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

feature "User clicks on sidebar links", :type => :feature, :js => true do
  background do
    User.create(name: 'John', username: 'johnny22', email: 'johnny22@mail.com', password: 'password')
  end

  scenario 'the Home view is displayed' do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'Home' link
    click_link 'Home'
    expect(page).to have_content 'Welcome Home, John!'
  end

  scenario "the Custom Activities view is displayed" do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'Custom Activities' link
    click_link 'Custom Activities'
    expect(page).to have_content 'Custom Activity List'
  end

  scenario "the History view is displayed" do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'History' link
    click_link 'History'
    expect(page).to have_content 'History for'
  end

  scenario "the Settings view is displayed" do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'Settings' link
    click_link 'Settings'
    expect(page).to have_content 'User Settings'
  end

  scenario "the 'Create a new Custom Activity' feature works" do
    visit root_path

    # Login
    fill_in 'username-or-email', with: 'johnny22'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Welcome Home, John!'

    # Click 'Custom Activities' link
    click_link 'Custom Activities'
    expect(page).to have_content 'Custom Activity List'

    # Click 'Create a Custom Activity' button
    click_link 'add'
    expect(page).to have_content 'Create New Custom Activity'

    # Fill in Custom Activity info and create it
    fill_in 'title', with: 'Asdf my new title'
    fill_in 'content', with: 'Jkl; my new content'
    click_button 'Submit'
    expect(page).to have_content 'Custom Activity List'
    expect(page).to have_content 'Asdf my new title'
    expect(page).to have_content 'Jkl; my new content'
  end
end

