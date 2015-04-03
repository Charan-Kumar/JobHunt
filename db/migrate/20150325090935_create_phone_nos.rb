class CreatePhoneNos < ActiveRecord::Migration
  def change
    create_table :phone_nos do |t|
      t.string :phone_type
      t.integer :phone_number
      t.integer :user_id
      t.timestamps
    end
  end
end
