class School < ActiveRecord::Base
  attr_accessible :degree, :degree_short, :end_date, :link, :location_id, :logo_link, :name, :name_short, :start_date, :teaching_list
  acts_as_taggable_on :teachings
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :descriptions
end