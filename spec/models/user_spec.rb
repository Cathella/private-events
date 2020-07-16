require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'ncathie') }

  context 'Validation' do
    it 'it is valid with a username, email and password' do
      user.email = 'jojo@gg.com'
      user.password = 'password'
      expect(user.valid?).to eql(true)
    end

    it 'it is not valid without an email' do
      user.password = 'password'
      expect(user.valid?).to eql(false)
    end

    it 'it is not valid without a password' do
      user.email = 'jojo@gg.com'
      expect(user.valid?).to eql(false)
    end

    it 'it is not valid without a username' do
      user.password = 'password'
      user.email = 'jojo@gg.com'
      user.username = nil
      expect(user.valid?).to eql(false)
    end

    it "create a new person with it's attributes" do
      person = User.new(username: 'John', email: 'jj@jj.com')
      expect(person).to have_attributes(username: 'John')
      expect(person).to have_attributes(email: 'jj@jj.com')
    end

    it { is_expected.to validate_uniqueness_of :username }
    it { is_expected.to validate_uniqueness_of :email }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
  end

  context 'Associations' do
    it { should have_many(:events_to_attend).through(:attendances) }
    it { should have_many(:attendances).class_name('Attendance') }
    it { should have_many(:events).class_name('Event') }
    it { should have_many(:events).with_foreign_key('creator_id') }
    it { should have_many(:attendances).with_foreign_key('attendee_id') }
  end
end
