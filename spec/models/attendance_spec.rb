require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.new(username: 'ncathie') }
  let(:event) { Event.new(title: 'my first event reloaded', description: 'most fun filled event ever made', creator_id: 1, time: '2020-07-09') }
  let(:attendance) { Attendance.new(attendee_id: 2, events_to_attend_id: 2) }

  describe 'Associations in Attendance' do
    it 'event attendance belongs to attendee' do
      expect(attendance).to respond_to(:attendee)
    end

    it 'belongs to attended_event' do
      expect(attendance).to respond_to(:events_to_attend)
    end
  end
end
