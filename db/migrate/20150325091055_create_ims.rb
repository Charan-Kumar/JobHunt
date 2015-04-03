class CreateIms < ActiveRecord::Migration
  def change
    create_table :ims do |t|
      t.string :im_account_type
      t.string :im_account_name
      t.integer :user_id

      t.timestamps
    end
  end
end
