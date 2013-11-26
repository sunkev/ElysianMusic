require 'spec_helper'

feature 'Everyone can see an individual show product page' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:flute) { FactoryGirl.create(:product) }

  scenario 'User sees product after clicking image on index page' do

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit products_path
    click_on 'Flute pic'
    expect(page).to have_content(flute.brand)
  end
end