class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Cheeselord block: starts
  mount_uploader :photo, PhotoUploader
  validates :username, presence: true, length: { in: 5..20 }, uniqueness: true
  # Cheeselord block: ends

  has_many :comments
  devise :database_authenticatable,
         :confirmable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable
end
