require 'rails_helper'

RSpec.feature "Visitor add product into My Cart", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 70.00
      )
     end
    end

  scenario "Tey will see increased number at My Cart " do
    visit root_path

    first('article.product').find_link('Add').click
    sleep(5)
    save_screenshot
    expect(page).to have_text 'My Cart (1)'
    puts page.html
  end
end

