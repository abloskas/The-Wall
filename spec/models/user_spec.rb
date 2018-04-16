require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    it "should not save if username is <= 5 characters" do
      expect(build(:user, username: "12345")).to be_invalid
    end
    it "should not save if username already exists" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
  end
end
