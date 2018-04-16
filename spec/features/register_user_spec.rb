require 'rails_helper'
feature "create an account" do
  scenario "successfully creates user account" do
    visit users_new_path
    fill_in "user[username]", with: "abloskas"
    click_button "Sign In"
    expect(page).to have_content "Welcome, abloskas"
    expect(current_path).to eq(posts_index_path)
  end
  scenario "empty username field" do
    visit users_new_path
    click_button "Sign In"
    expect(page).to have_content "Username can't be blank"
    expect(current_path).to eq(users_new_path)
  end
  scenario "fills in a username <= 5 characters" do
    visit users_new_path
    fill_in "user[username]", with: "12345"
    click_button "Sign In"
    expect(page).to have_content "Username is too short"
    expect(current_path).to eq(users_new_path)
  end
end