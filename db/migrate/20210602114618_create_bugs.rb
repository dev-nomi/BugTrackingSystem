class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description 
      # t.string :screenshot
      t.datetime :deadline
      t.string :bug_type
      t.string :status
      t.integer :project_id
      
      t.timestamps
    end
  end
end
