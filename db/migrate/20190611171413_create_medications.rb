class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :route
      t.string :purpose
      t.timestamps
    end
  end
end
