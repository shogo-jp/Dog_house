class Dog < ApplicationRecord
  # dogがユーザー一人に必ず属す
  belongs_to :user
  attachment :image
end
