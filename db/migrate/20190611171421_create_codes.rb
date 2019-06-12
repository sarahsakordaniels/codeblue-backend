class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
        t.string :begin_time
        t.string :end_time
        t.string :patient_status
      t.timestamps
    end
  end
end
