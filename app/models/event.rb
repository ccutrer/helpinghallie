class Event < ActiveRecord::Base
  scope :events, -> { where(type: 'Event') }
end
