require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be valid with attributes' do
      @category = Category.create(name:"Apparel")
      product = Product.new(
        name: 'Pants',
        price: 70,
        quantity: 4,
        category_id: @category.id
        )
      expect(product).to be_valid
    end

    it 'should not be valid without name' do
      @category = Category.create(name: "Apparel")
      product = Product.new(
        name: nil,
        price: 70,
        quantity: 4,
        category_id: @category.id
        )
      expect(product).to_not be_valid
    end

    it 'should not be valid without price' do
      @category = Category.create(name: "Apparel")
      product = Product.new(
        name: 'Pants',
        price: nil,
        quantity: 4,
        category_id: @category.id
        )
      expect(product).to_not be_valid
    end

    it 'should not be valid without quantity' do
      @category = Category.create(name: "Apparel")
      product = Product.new(
        name: 'Pants',
        price: 70,
        quantity: nil,
        category_id: @category.id
        )
      expect(product).to_not be_valid
    end

    it 'should not be valid without category id' do
      @category = Category.create(name: "Apparel")
      product = Product.new(
        name: 'Pants',
        price: 70,
        quantity: 4,
        category_id: nil
        )
      expect(product).to_not be_valid
    end
  end
end