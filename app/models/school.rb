class School < ActiveRecord::Base
  attr_accessible :degree, :degree_short, :end_date, :link, :location_id, :logo_link, :name, :start_date, :teaching_list
  acts_as_taggable_on :teachings
  has_one :location
  has_and_belongs_to_many :descriptions
end