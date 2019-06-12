class CreateCodemedications < ActiveRecord::Migration[5.2]
  def change
    create_table :codemedications do |t|
        t.string :drug
        t.string :dose
        t.string :time
      t.timestamps
    end
  end
end
