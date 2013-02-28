class Record < ActiveRecord::Base
  attr_accessible :company_id, :end_date, :industry_id, :job_title, :link, :start_date, :is_current, :tag_list
  acts_as_taggable
end
