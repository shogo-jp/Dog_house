class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # dogをたくさん持っている(dogsと複数形にする), ユーザーが消去されたらそれに紐ずくdogも削除される
  has_many :dogs, dependent: :destroy

  validates :username, presence: true
  has_many :favorites, dependent: :destroy

  def already_favorited?(dog)
    self.favorites.exists?(dog_id: dog.id)
  end


  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

end
