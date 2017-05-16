require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should be valid with attributes' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'should not be valid without password' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should match password and password confirmation' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(user.password).to eq(user.password_confirmation)
    end    

    it 'should unique email' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.COM',
        password: 'password',
        password_confirmation: 'password'
        )
      existing_user = User.find_by_email(user.email.downcase)
      expect(existing_user).to_not eq(user)
    end    

    it 'should have password minimum length of 6 ' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.COM',
        password: 'pass',
        password_confirmation: 'pass'
        )
      expect(user).to_not be_valid
    end    
  end

  describe '.authenticate_with_credentials' do
    it 'should not be valid if user already exists' do
      user = User.create(
        first_name: 'sean',
        last_name: 'park',
        email: 'sean@rails.com  ',
        password: 'password',
        password_confirmation: 'password'
        )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq nil
    end
  end
end