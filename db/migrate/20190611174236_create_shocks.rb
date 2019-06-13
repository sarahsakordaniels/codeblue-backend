class CreateShocks < ActiveRecord::Migration[5.2]
  def change
    create_table :shocks do |t|
        t.string :time
        t.string :energy
        t.references :code
      t.timestamps
    end
  end
end
