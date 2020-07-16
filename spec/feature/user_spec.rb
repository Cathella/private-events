require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Sign up User', type: :system do
    describe 'Contents of the signup page' do
      it 'shows the right content in the signup page' do
        visit new_user_path
        expect(page).to have_content('Sign Up')
      end
    end
  end
end