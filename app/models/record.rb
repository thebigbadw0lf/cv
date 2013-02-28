class Record < ActiveRecord::Base
  attr_accessible :company_id, :end_date, :industry_id, :job_title, :link, :start_date, :is_current, :tag_list
  acts_as_taggable
  has_one :company
  has_one :industry
  has_many :records_locations
  has_many :locations, :through => :records_locations
  has_many :records_descriptions
  has_many :descriptions, :through => :records_descriptions
end
