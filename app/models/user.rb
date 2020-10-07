class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy # удаляет зависимые данные тоже, т.е. из card
  has_many :orders, dependent: :destroy
  has_many :comments
end
