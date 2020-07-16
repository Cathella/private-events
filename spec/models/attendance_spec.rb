require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.create(username: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { Event.create(creator_id: user.id, title: 'my first event reloaded', description: 'most fun filled event ever made', time: '2020-07-09 00:00:00') }
  let(:event_attendance) { event.attendances.build(attendee_id: user.id) }
  context 'Validation' do
    it 'ensures that the user and event exist before they can attend event' do
      expect(event_attendance.valid?).to eql(true)
    end

    it 'ensures that the user exist before they can attend event' do
      event_attendance.attendee_id = 10
      expect(event_attendance.valid?).to eql(false)
    end

    it 'ensures that the event exist before they can attend' do
      event_attendance.events_to_attend_id = 10
      expect(event_attendance.valid?).to eql(false)
    end
  end

  context 'Associations' do
    it { should belong_to(:events_to_attend).class_name('Event') }
    it { should belong_to(:attendee).class_name('User') }
  end
end
