class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :user_prefers, dependent: :destroy
  has_many :prefers, through: :user_prefers

  def prefers
    user_prefers.map(&:prefer)
  end
end
