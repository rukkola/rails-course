require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :price }

  it 'has_many' do
    should have_many :positions
    should have_many :comments
    should have_many :carts
  end

  it { should have_one :image }

  context 'calculates the price' do
    let!(:item_1) { create :item, price: 10 }
    let!(:item_2) { create :item, price: 20 }
    let!(:order) { create :order }

    it 'calculates the price' do
      order.items << item_1
      order.items << item_2
      expect(order.calculate_total).to be 30.0
    end
  end
end