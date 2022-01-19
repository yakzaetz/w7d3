require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  describe 'password encryption' do 
    it 'encrypts password with BCrypt' do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: 'yao_xu', password: 'password')
    end

    it 'sets the password reader' do
      user = User.new(username: 'yao_xu', password: 'password')
      expect(user.password).to eq('password')
    end
  end

  subject {  User.create!(username: 'yaakov', password: 'password')}

  describe 'session token' do
    it 'assigns a session_token' do
      expect(subject.session_token).not_to be_nil
    end

    it 'resets session token' do
      old_session_token = subject.session_token
      new_session_token = subject.reset_session_token!
      expect(old_session_token).not_to eq(new_session_token)
    end
  end

  describe 'finds users by credentials' do

    context 'with a valid username and password' do
      it 'should return user' do
        yao = User.create(username: 'yao_xu', password: 'password')
        user = User.find_by_credentials('yao_xu','password')

        expect(yao.username).to eq(user.username)
        expect(yao.password_digest).to eq(user.password_digest)
      end
    end

    context 'with an invalid username and password' do
      it 'should return nil' do
        yaakov = User.create(username: 'yaakov', password: 'password')
        user = User.find_by_credentials('yaakov','password1')
        expect(user).to be_nil
      end
    end
  end
  
end
