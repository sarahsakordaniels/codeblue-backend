class CreateRhythms < ActiveRecord::Migration[5.2]
  def change
    create_table :rhythms do |t|
        t.string :rhythm_type
        t.string :time
        t.boolean :pulse
        t.references :code

      t.timestamps
    end
  end
end
