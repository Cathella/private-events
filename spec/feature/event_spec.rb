require 'rails_helper'

RSpec.describe Event, type: :feature do
  let(:user) { User.create(username: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { user.events.build(title: 'my first event reloaded', description: 'most fun filled event ever made', time: '2020-07-09 00:00:00') }

  describe 'Load events index page', type: :system do
    describe 'Contents of the index page' do
      it 'shows the right content in the index page' do
        visit events_path
        expect(page).to have_content('All Events')
      end
    end
  end

  describe 'Event creation process', type: :feature do
    it 'create an event' do
      visit login_path
      fill_in 'username', with: user.username
      click_button 'Login'
      # visit new_event_path
      click_on 'Create New Event'
      fill_in 'Title', with: event.title
      fill_in 'Description', with: event.description
      fill_in 'Time', with: event.time
      click_on 'Create Event'
      expect(page).to have_current_path(events_path)
    end
  end
end
