require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'ncathie') }

  context 'Validation test for user' do
    it 'is not valid without a username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'create a new person with a username and email' do
      person = User.new(username: 'John', email: 'jj@jj.com')
      expect(person).to have_attributes(username: 'John')
      expect(person).to have_attributes(email: 'jj@jj.com')
    end

    it { is_expected.to validate_uniqueness_of :username }
  end

  describe 'Sign up User', type: :system do
    describe 'Contents of the signup page' do
      it 'shows the right content in the signup page' do
        visit new_user_path
        expect(page).to have_content('Sign Up')
      end
    end

    context 'Associations tests for User and Event' do
      it { should have_many(:events_to_attend) }
      it { should have_many(:attendances) }
      it { should have_many(:events) }
    end
  end
end
