class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :posts
  has_many :subscriptions, dependent: :destroy
end
