class Event < ActiveRecord::Base
  scope :events, :conditions => { :type => 'Events' }
end
