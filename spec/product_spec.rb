require 'rails_helper'


describe Product, type: :model do

  it 'is valid with attributes' do
    product = Category.new.products.new(name: 'sean', description: '123 rails', category_id: 1, quantity: 1, price: 100)
    expect(product).to be_valid
  end
  it 'is not valid without a name' do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
  end
  it 'is not valid without a description' do
    product = Product.new(description: nil)
    expect(product).to_not be_valid
  end
  it 'is not valid without a category_id' do
    product = Product.new(category_id: nil)
    expect(product).to_not be_valid
  end
  it 'is not valid without a quantity' do
    product = Product.new(quantity: nil)
    expect(product).to_not be_valid
  end
  
  it 'is not valid without a price' do
    product = Product.new(price: nil)
    expect(product).to_not be_valid
  end
  
end
