class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.boolean :save_as_template

      t.timestamps
    end
  end
end
