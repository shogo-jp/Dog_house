class Dog < ApplicationRecord
  # dogがユーザー一人に必ず属す
  belongs_to :user
  has_many :favorites, dependent: :destroy
  attachment :image

  with_options presence: true do  # 空白で登校拒否　　# バリデーションdogsとuserのcontroller
    validates :title
    validates :body
    validates :image
  end

end




