require 'rails_helper'
feature "user creates a comment" do
  before(:each) do
    visit users_new_path
    fill_in "user[username]", with: "abloskas"
    click_button "Sign In"
    new_message = (0..15).map { (65+rand(26)).chr }.join
    fill_in "post[post]", with: new_post
    click_button "Submit"
  end
  scenario "successfully creates a comment" do
    new_comment = (0..15).map { (65+rand(26)).chr }.join
    fill_in "comment[comment]", with: new_comment
    click_button "Submit"
    expect(page).to have_content new_comment
    expect(current_path).to eq(posts_index_path)
  end
  scenario "doesn't fill out comment field" do
    click_button "Post a Comment"
    expect(page).to have_content "Comment can't be blank"
    expect(current_path).to eq(posts_index_path)
  end
  scenario "tries to create a comment that is <= 10 characters" do
    fill_in "comment[comment]", with: "123456789"
    click_button "Post a Comment"
    expect(page).to have_content "Comment is too short"
    expect(current_path).to eq(posts_index_path)
  end
end