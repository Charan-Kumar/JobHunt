class FavJob < ActiveRecord::Base
  validates :job_key, uniqueness: true
  belongs_to :user
end
