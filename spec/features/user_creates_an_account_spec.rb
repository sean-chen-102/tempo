# Capybara test - run with 'bundle exec rspec'
require 'rails_helper'

describe "User creates an account", :type => :feature, :js => true do
  scenario 'they see themselves logged in after account creation' do
    puts "PATH= #{root_path + '#signup'}"
    visit root_path

    fill_in 'name', with: 'John'
    fill_in 'username', with: 'johnny22'
    fill_in 'email', with: 'johnny22@mail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_css 'h3', 'Welcome Home Jill'
  end
end