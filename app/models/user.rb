class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :username, presence: true, length: { in: 5..20 }, uniqueness: true

  has_many :comments
  devise :database_authenticatable,
         :confirmable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable
end
