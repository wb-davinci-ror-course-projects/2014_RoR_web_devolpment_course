class EventsController < ApplicationController

  def index
    @events = Event.order(:id)
    render :index and return
  end

  def new
    @event = Event.new
    render :new and return
  end

  def create
    @event = Event.new
    @event.name = params["name"]
    year  = params[:start_date][:year ].to_i
    month = params[:start_date][:month].to_i
    day   = params[:start_date][:day  ].to_i
    @event.end_date = params[:end_date]
    @event.start_date = Date.new(year, month, day)
    @event.save
    
    if @event.save == true
      redirect_to events_path and return
    else
      render :new and return
    end
  end

  def edit
    @event = Event.find(params["id"])
    render :edit and return
  end

  def update
    @event = Event.find(params["id"])
    @event.name = params["name"]
    year  = params[:start_date][:year ].to_i
    month = params[:start_date][:month].to_i
    day   = params[:start_date][:day  ].to_i
    @event.end_date = params[:end_date]
    @event.start_date = Date.new(year, month, day)
    @event.save
    
    if @event.save == true
      redirect_to events_path and return
    else
      render :edit and return
    end
  end

end
