class CreateAppoinments < ActiveRecord::Migration[6.1]
  def change
    create_table :appoinments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.string :patient
      t.string :references
      t.string :location
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
