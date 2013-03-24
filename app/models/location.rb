class Location < ActiveRecord::Base
  attr_accessible :street, :city, :continent, :country, :latitude, :link, :longitude
  acts_as_gmappable
  has_many :records_locations
  has_many :records, :through => :records_locations
  has_and_belongs_to_many :education_records
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.city}, #{self.country}" 
  end
end
