# Capybara test - run with 'bundle exec rspec'
require 'rails_helper'

describe "User creates an account", :type => :feature, :js => true do
  scenario 'they see themselves logged in after account creation' do
    visit (root_path + "#signup")

    fill_in 'name', with: 'John'
    fill_in 'username', with: 'johnny22'
    fill_in 'email', with: 'johnny22@mail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_css 'h3', 'Welcome Home Jill'
  end
end

describe "User logs out", :type => :feature, :js => true do
  scenario 'they see the login page after logging out' do
    visit root_path

    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'

    click_link 'Logout'
    expect(page).to have_css 'h3', 'Login'
  end
end