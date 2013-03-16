class School < ActiveRecord::Base
  attr_accessible :link, :location_id, :logo_link, :name, :name_short
  has_many :education_records
end