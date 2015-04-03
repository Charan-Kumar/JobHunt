class CreateAngelTags < ActiveRecord::Migration
  def change
    create_table :angel_tags do |t|
      t.integer :tag_id
      t.string :tag_name

      t.timestamps
    end
  end
end
