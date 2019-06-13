class CreateVitalsets < ActiveRecord::Migration[5.2]
  def change
    create_table :vitalsets do |t|
      t.string :bloodpressure
      t.string :pulse
      t.string :temperature
      t.string :spo2
      t.references :patient
      t.timestamps
    end
  end
end
