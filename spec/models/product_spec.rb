require 'rails_helper'

RSpec.describe Product, type: :model do
  # Set up dummy hash to test against
  before :example do
    cat1 = Category.find_or_create_by! name: 'Apparel'
    @product = cat1.products.create!({
      name:  'Men\'s Classy shirt',
      description: Faker::Hipster.paragraph(4),
      image: ('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    })
      end

  describe 'Validations' do
    it 'should create a new product' do
      expect(Product.new).to be_a Product
      expect(@product.valid?).to eq true
    end

    it 'of name' do
      @product.name = nil;
      expect(@product.valid?).to eq false
    end

    it 'of price' do
      @product.price_cents = nil;
      expect(@product.valid?).to eq false
    end
    
    it 'of quantity' do
      @product.quantity = nil;
      expect(@product.valid?).to eq false
    end

    it 'of category' do
      @product.category = nil;
      expect(@product.valid?).to eq false
    end

  end
end

# TODO:
# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true