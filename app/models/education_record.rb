class EducationRecord < ActiveRecord::Base
  attr_accessible :degree_name, :degree_short_name, :end_date, :id, :is_current, :start_date, :teaching_list
  acts_as_taggable_on :teachings
  belongs_to :school
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :descriptions, :order => "id ASC"
  
end
