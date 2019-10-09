class Picture < ApplicationRecord
   validates :content, presence: true
   belongs_to :user, optional: true
   has_many :favorite_users, through: :favorites, source: :user
   has_many :favorites, dependent: :destroy
end
