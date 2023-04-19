require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) } #is the .on(:create) qualifier necessary? Saw this in the example on shoulda-matchers doc...
  end
  describe 'is_password?' do
    it "checks if a given password matches the stored password by comparing the password_digests" do
      u = User.new
      u.password_digest = BCrypt::Password.create("heated")
      expect(u.is_password?("heated")).to be(true)
      expect(u.is_password?("chilly")).to be(false)
    end
  end
  describe 'reset_session_token' do
    it 'generates a new session token' do
      u = User.new(password: "heated", email: "tired@mail.com")
      old_session_token = u.reset_session_token!
      expect(u.reset_session_token!).to_not eq(old_session_token)
    end
  end
  describe '::find_by_credentials' do
    it 'will save locate a User given a valid email and password' do
      u = User.create(password: "heated", email: "tired@mail.com")
      expect(User.find_by_credentials("tired@mail.com", "heated")).to eq(u)
    end
  end
end
