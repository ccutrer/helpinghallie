class EventsController < ApplicationController
  before_filter :require_user, :except => :index

  def new
    @event = Event.new
  end

  def create
    type = params[:event].delete(:type)
    @event = Event.new(params[:event])
    @event.type = type
    if params[:commit] == 'Preview'
      return render :action => 'new'
    end
    @event.save!
    redirect_to root_path
  end

  def index
    @events = Event.all(:conditions => { :type => params[:type]}, :order => 'created_at DESC', :limit => 10)
  end
end
