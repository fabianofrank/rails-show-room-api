class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { in: 2..25 }
end
