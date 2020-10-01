class User < ApplicationRecord
  has_one :cart, dependent: :destroy # удаляет зависимые данные тоже, т.е. из card
  has_many :orders, dependent: :destroy
  has_many :comments
end
