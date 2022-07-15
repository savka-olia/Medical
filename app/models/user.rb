class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :normalize_phone

  validates_uniqueness_of :mobile_number
  validates :mobile_number, phone: { possible: false, types: [:mobile] }

  def email_required?
    false
  end
         
  def email_changed?
    false
  end

  def formatted_phone
    parsed_phone = Phonelib.parse(mobile_number)
    return mobile_number if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == "380" 
        parsed_phone.full_national # 093 439 8129
      else
        parsed_phone.full_international # +380 93 439 8129
      end
    formatted
  end


  private

  def normalize_phone
    self.mobile_number = Phonelib.parse(mobile_number).full_e164.presence
  end
end
