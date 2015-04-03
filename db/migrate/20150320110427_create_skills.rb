class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :skill_id
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
