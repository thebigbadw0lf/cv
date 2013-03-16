class Record < ActiveRecord::Base
  attr_accessible :company_id, :end_date, :industry_id, :job_title_id, :link, :start_date, :is_current, :skill_list
  acts_as_taggable_on :skills
  belongs_to :company
  belongs_to :job_title
  has_many :records_locations
  has_many :locations, :through => :records_locations
  has_many :records_descriptions
  has_many :descriptions, :through => :records_descriptions, :order => "id ASC"
  
end
