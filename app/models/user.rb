class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # dogをたくさん持っている(dogsと複数形にする), ユーザーが消去されたらそれに紐ずくdogも削除される
  has_many :dogs, dependent: :destroy
end
