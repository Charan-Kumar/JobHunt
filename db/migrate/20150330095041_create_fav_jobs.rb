class CreateFavJobs < ActiveRecord::Migration
  def change
    create_table :fav_jobs do |t|
      t.string :job_key
      t.boolean :is_fav
      t.integer :user_id

      t.timestamps
    end
  end
end
