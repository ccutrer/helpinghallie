class Event < ActiveRecord::Base
  scope :events, :conditions => { :type => 'Event' }
end
