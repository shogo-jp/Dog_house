class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates_uniqueness_of :dog_id, scope: :user_id
end
