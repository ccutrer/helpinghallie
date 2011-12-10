class EventsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]

  def index
    user
    @events = klass.all(:conditions => { :type => params[:type] }, :order => 'created_at DESC, id DESC', :limit => 10)
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
    @event = klass.new(params[ActiveModel::Naming.param_key(klass)])
    if params[:commit] == 'Preview'
      return render :action => 'show'
    end
    @event.save!
    redirect_to polymorphic_path(@event)
  end

  def update
    @event = klass.find(params[:id])
    @event.attributes = params[ActiveModel::Naming.param_key(klass)]
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
end
