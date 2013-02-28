class Location < ActiveRecord::Base
  attr_accessible :city, :continent, :country, :latitude, :link, :longitude
  has_many :records_locations
  has_many :records, :through => :records_locations
end
