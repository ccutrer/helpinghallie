class EventsController < ApplicationController
  before_action :require_user, :except => [:index, :show]

  def index
    user
    @events = klass.where(type: params[:type]).order('created_at DESC NULLS LAST, id DESC').limit(10)
  end

  def show
    user
    @event = klass.find(params[:id])
  end

  def new
    @event = klass.new
    render :action => 'show'
  end

  def create
    @event = klass.new(event_params)
    @event.type = params[:type]
    if params[:commit] == 'Preview'
      return render :action => 'show'
    end
    @event.save!
    redirect_to polymorphic_path(@event)
  end

  def update
    @event = klass.find(params[:id])
    @event.attributes = event_params
    if params[:commit] == 'Preview'
      return render :action => 'show'
    end
    @event.save!
    redirect_to polymorphic_path(@event)
  end

  def destroy
    @event = klass.find(params[:id])
    @event.destroy
    redirect_to polymorphic_path(@event.class)
  end

  protected

  def klass
    @klass ||= params[:type].classify.constantize
  end

  def event_params
    params.require(:type)
    event_params = params[ActiveModel::Naming.param_key(klass)]
    event_params.permit(:subject, :author, :body)
  end
end
