class RecordsLocations < ActiveRecord::Base
  attr_accessible :location_id, :record_id
  belongs_to :record
  belongs_to :location
end
