require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(username: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { user.events.build(title: 'my first event reloaded', description: 'most fun filled event ever made', time: '2020-07-09 00:00:00') }

  context 'Validation' do
    it 'ensures the user is signed and the event has a creator' do
      expect(event.valid?).to eql(true)
    end

    it 'it is invalid if user is not signed in' do
      event.creator_id = 5
      expect(event.valid?).to eql(false)
    end

    it "create an event with it's attributes" do
      event.title = 'first event'
      expect(event).to have_attributes(title: 'first event')
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:time) }
  end

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendances).with_foreign_key('events_to_attend_id').class_name('Attendance') }
    it { should have_many(:attendees).through(:attendances).dependent(:destroy) }
  end
end
