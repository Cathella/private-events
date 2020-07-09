class HomeController < ApplicationController
  def index
    @events = Event.all
    @attendance = Attendance.new
  end
end
