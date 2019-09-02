require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {
    User.new(
      email: "fakeperson@fakesite.com",
      password: "fakepassword")
}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "verifies password is correct" do
      expect(user.is_password?("fakepassword")).to eq(true)
    end

    it "verifies password is incorrect" do
      expect(user.is_password?("wrong_password")).to eq(false)
    end
  end

  describe "#reset_session_token!" do
    it "resets user's session token" do
      old_session_token = user.session_token
      new_session_token = user.reset_session_token!
      expect(user.session_token).to eq(new_session_token)
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }
    it "returns user with credentials from database" do
      expect(User.find_by_credentials("fakeperson@fakesite.com", "fakepassword")).to eq(user)
    end

    it "returns nil if invalid credentials" do
      expect(User.find_by_credentials("fakeperson@fakesite.com", "wrong_password")).to eq(nil)
    end
  end
end