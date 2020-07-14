require 'rails_helper'

RSpec.describe 'Event', type: :model do
  User.create(username: 'ncathie')
  let(:event) { Event.new(title: 'my first event reloaded', description: 'most fun filled event ever made', creator_id: 1, time: '2020-07-09') }
  let(:attendance) { Attendance.new(attendee_id: 1, events_to_attend_id: 2) }

  context 'Validation test' do
    it 'ensures users are signed in to create events' do
      event = Event.new(description: 'most fun filled event ever made', time: '2020-07-09 00:00:00', creator_id: 1)
      expect(event).not_to be_valid
    end
  end

  describe 'Load events index page', type: :system do
    describe 'Contents of the index page' do
      it 'shows the right content in the index page' do
        visit events_path
        expect(page).to have_content('All Events')
      end
    end
  end

  describe 'associations' do
    it 'is associated to a user' do
      expect(event).to respond_to(:creator)
    end

    it 'has many invitations' do
      expect(event).to respond_to(:attendances)
    end

    it 'has many attendes' do
      expect(event).to respond_to(:attendees)
    end
  end
end
