class CreatePatientMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_medications do |t|
      t.references :patient, foreign_key: true
      t.references :medication, foreign_key: true

      t.timestamps
    end
  end
end
