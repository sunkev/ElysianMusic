require 'spec_helper'

feature 'Admin creates a product' do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'Admin makes a product successfully' do

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit new_product_path
    fill_in 'Brand', with: 'Di Zhao Flutes'
    fill_in 'Model', with: 'X2F-SD3'
    fill_in 'Description', with: "The best"
    fill_in 'Price', with: 15
    click_button 'Create Product'
    expect(page).to have_content('Product successfully created')
  end

  scenario 'Admin makes a product with a photo' do

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit new_product_path
    fill_in 'Brand', with: 'Di Zhao Flutes'
    fill_in 'Model', with: 'X2F-SD3'
    fill_in 'Description', with: "The best"
    fill_in 'Price', with: 15
    page.attach_file('product_product_photo', Rails.root + 'spec/support/images/Flute pic.jpg')
    click_button 'Create Product'
    expect(page).to have_content('Product successfully created')
  end

  scenario 'Admin does not make a lesson successfully' do

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit new_product_path
    click_button 'Create Product'
    expect(page).to have_content('Product was not created')
  end

  scenario 'User cannot make a lesson without authorizing' do

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit new_product_path
    expect(page).to_not have_content('Make a product')
  end
end