class CreateApplicationsGroups < ActiveRecord::Migration
  def change
    create_table :applications_groups do |t|
      t.integer :application_id
      t.integer :group_id
 
      
    end
  end
end
