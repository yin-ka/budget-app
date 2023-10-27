require 'rails_helper'

RSpec.describe 'Category/Index', type: :system do
  describe 'category index page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @category1 = Category.create(name: 'test category1', icon: 'https://www.shutterstock.com/image-photo/brutal-bearded-man-mustache-shirt-pants-379763746.jpg')
      @category2 = Category.create(name: 'test category2', icon: 'https://www.shutterstock.com/image-photo/man-tshirt-denim-shorts-takes-selfie-1748702714.jpg')

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'user_password', with: @user.password # Assuming the password field has the ID 'user_password'
      click_button 'Log in'
    end

    it 'displays the list of categories' do
      expect(page).to have_content('test category1')
      expect(page).to have_content('test category2')
    end

    it 'displays the category icons' do
      expect(page).to have_css('img[src="https://www.shutterstock.com/image-photo/brutal-bearded-man-mustache-shirt-pants-379763746.jpg"]')
      expect(page).to have_css('img[src="https://www.shutterstock.com/image-photo/man-tshirt-denim-shorts-takes-selfie-1748702714.jpg"]')
    end
  end
end
