class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
