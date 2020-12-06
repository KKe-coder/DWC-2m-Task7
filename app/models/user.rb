class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	has_many :act_follower, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy

	has_many :followerlist, through: :act_follower, source: :followed

	has_many :pas_followed, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy

	has_many :followedlist, through: :pas_followed, source: :follower

  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

    def followed_by?(user)
      pas_followed.find_by(follower_id: user.id).present?
    end

end
