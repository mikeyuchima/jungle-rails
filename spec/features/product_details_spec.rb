require 'rails_helper'

RSpec.feature "Visitor Navigate to Product Page", type: :feature, js:true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      1.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They see product detail" do
      # ACT
      visit root_path
  
      page.find('.product').find('.actions').find('.product-link').click      
  
      #VERIFY
      expect(page).to have_css 'section.products-show'

      sleep(1)
  
      # DEBUG
      save_screenshot
    end
end
