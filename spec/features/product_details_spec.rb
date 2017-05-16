require 'rails_helper'

RSpec.feature "Visitor naviagate to product detail page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 70.00
      )
    end
  end
  scenario "They see the product details" do
    visit root_path

    first('.product').click_link('Details')
    sleep(5)
    save_screenshot
    expect(page).to have_css '.product-detail'
    puts page.html
  end
end
