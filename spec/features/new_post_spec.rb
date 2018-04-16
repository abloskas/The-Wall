require 'rails_helper'
feature "user creates a message" do
  before(:each) do
    visit users_new_path
    fill_in "user[username]", with: "abloskas"
    click_button "Sign In"
  end
  scenario "successfully creates a post" do
    new_message = (0..15).map { (65+rand(26)).chr }.join
    fill_in "post[post]", with: new_post
    click_button "Submit"
    expect(page).to have_content new_post
    expect(current_path).to eq(posts_index_path)
  end
  scenario "doesn't fill out message field" do
    click_button "Submit"
    expect(page).to have_content "Post can't be blank"
    expect(current_path).to eq(posts_index_path)
  end
  scenario "create a message that is <= 10 characters" do
    fill_in "post[post]", with: "123456789"
    click_button "Submit"
    expect(page).to have_content "Post is too short"
    expect(current_path).to eq(posts_index_path)
  end
end