require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'New Category Page' do
    before do
      @user = User.create(name: 'Test', email: 'test@example.com', password: 'password')
      
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it 'displays the form for creating a new category' do
      visit new_category_path

      expect(page).to have_css('.navbar')
      expect(page).to have_css('.fas.fa-arrow-left')
    end
  end
end