require 'rails_helper'

RSpec.describe User, type: :model do
  before :example do
    
    @uma = User.create({
      first_name: 'Uma',
      last_name: 'Thurman',
      email: 'big_mama@gmail.com',   
      password: 'hunter2',
      password_confirmation: 'hunter2'
    })
    @quentin = User.create({
      first_name: 'Quentin',
      last_name: 'Tarantino',
      email: 'big_mama@gmail.com',   
      password: 'feet',
      password_confirmation: 'feet'
    })
  end

  describe 'Validations' do
    it 'should have a first and last name, email, and password' do
      @uma.first_name = nil;
      @uma.last_name = nil;
      @uma.email = nil;
      @uma.password = nil;
      expect(@uma.valid?).to eq false
    end

    it 'should have a password that matches the confirmation' do
      expect(@uma.password == @uma.password_confirmation).to eq true
    end

    it 'should have a unique email' do
      expect(@quentin.valid?).to eq false
    end

    it 'should have a password length of > 5' do
      expect(@quentin.first_name).to eq 'Quentin'
    end

    describe '.authenticate_with_credentials' do
      it "returns a user if there is a match on email and password" do
        expect(User.authenticate_with_credentials(@uma.email, 'hunter2')).to_not be_nil
      end
      it "returns nil if there is no user with that email" do
        expect(User.authenticate_with_credentials('bigsammy@jackson.com', 'motherclucker')).to be_nil
      end
      it "returns nil if there is a user with that email, but the password doesn't match" do
      expect(User.authenticate_with_credentials('big_mama@gmail.com', 'killbill')).to be_nil
      end
    end

  end
end
