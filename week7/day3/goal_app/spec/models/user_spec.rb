require 'rails_helper'


RSpec.describe User, type: :model do
  
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}
  
  subject(:a_person) {FactoryBot.create(:user)}

  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}

  describe '#ensure_session_token' do 
    it 'assigns a session token if none is given' do
      expect(FactoryBot.build(:user).session_token).not_to be_nil
    end
  end
  
  describe 'password_encryption' do
    it 'does not save password to the database' do
      FactoryBot.create(:user, username: 'Harry Potter')
      user = User.find_by(username: "Harry Potter")
      expect(user.password).not_to eq ("password")
    end

    it 'ensure password is encrypted using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with ("abcdef")
      FactoryBot.build(:user, password: "abcdef")
    end
  end

  describe 'reset_session_token' do
    it 'should reset the session token' do
      old_token = subject.session_token
      new_token = subject.reset_session_token!
      expect(old_token).not_to eq(new_token)
    end
    it 'should return the new session token' do
      expect(subject.session_token).not_to be_nil
    end
  end

  describe 'is_password?' do
    it 'return true if the passwords match' do
      pw = '123456'
      result = subject.is_password?(pw)
      expect(result).to be true
    end

    it 'return false if the passwords match' do
      pw = 'abcdef'
      result = subject.is_password?(pw)
      expect(result).not_to be true
    end
  end

  describe "User::find_by_credentials" do
    it 'should return the user object if found' do
      test = User.find_by_credentials(subject.username, '123456')
      expect(subject.password_digest).to eq(test.password_digest)
    end

    it 'should return nil if user not found' do
      test = User.find_by_credentials('Bob', '123456')
      expect(test).to be_nil
    end
  end


end
