# Capybara test - run with 'bundle exec rspec'
require 'rails_helper'
 
feature "User creates an account", :type => :feature, :js => true do
  scenario 'they see themselves logged in after account creation' do
    visit (root_path + "#signup")

    fill_in 'name', with: 'John'
    fill_in 'username', with: 'johnny22'
    fill_in 'email', with: 'johnny22@mail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome Home, John!'
  end
end

feature "User logs out", :type => :feature, :js => true do
  background do
    User.create(name: 'John', username: 'johnny22', email: 'johnny22@mail.com', password: 'password')
  end

  scenario 'they see the login page after logging out' do
    visit (root_path)

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Logout
    click_link 'Logout'
    expect(page).to have_content 'Login'
  end
end

feature "User hits the 'GO' button", :type => :feature, :js => true do
  background do
    User.create(name: 'John', username: 'johnny22', email: 'johnny22@mail.com', password: 'password')
  end

  scenario 'they see a list of results' do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'GO' button
    visit (root_path + "#home")
    click_button 'GO'
    expect(page).to have_content 'Activity List'
  end
end