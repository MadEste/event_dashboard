class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :show ]

  def index
    @events = current_user.events.all
  end

  def show
  end

  def new
    puts "runing new"
    @event = current_user.events.build
    @schedule = @event.build_schedule(user_id: current_user.id)

  end

  def edit
    if @event.user_id != current_user.id
      flash[:error] = "Not allowed"
      redirect_to root_path
    else
      @schedule = @event.schedule
    end

  end

  # POST /events
  # POST /events.json
  def create
    puts "running create"
    @event = current_user.events.create(event_params)
    @schedule = @event.build_schedule(user_id: current_user.id)

    

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @event.user_id == current_user.id
      respond_to do |format|
        # puts "call sanitize_url"
        # sanitize_url
        if @event.update(event_params)
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Not allowed"
      redirect_to root_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if @event.user_id == current_user.id
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Not allowed"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
        :name, :description, 
        links_attributes: [:id, :label, :url, :_destroy], 
        schedule_attributes: [:id, :_destroy, days_attributes: [:id, :date, :_destroy]]
        )
    end


end
