require 'rails_helper'

RSpec.describe Item, type: :model do
  it { validate_presence_of :name }

  it { should validate_numericality_of :price }

  it 'has_many' do
    should have_many :positions
    should have_many :comments
    should have_many :carts
  end

  it { should have_one :image }

end