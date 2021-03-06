class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  helper_method :user_attendance

  # GET /events
  # GET /events.json

  def user_attendance(attendance_id)
    User.find(attendance_id).username
  end

  def index
    # @events = Event.all
    @event = Event.new
    @events = Event.all
    @attendance = Attendance.new

    @upcoming = Event.upcoming
    @past = Event.past
  end

  # GET /events/1
  # GET /events/1.json
  def show
    set_event
    @attendance = @event.attendances
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    set_event
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    @event.creator_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    set_event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    set_event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :time)
  end
end
