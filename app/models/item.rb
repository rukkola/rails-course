class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  #has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one :image, as: :imageable
  has_and_belongs_to_many :orders

=begin
  after_initialize { p 'init'}
  after_save       { p 'save' }
  after_create     { p 'create' }
  after_update     { p 'update' }
  after_destroy    { p 'destroy' }
=end
end
