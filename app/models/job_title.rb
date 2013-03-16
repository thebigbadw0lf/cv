class JobTitle < ActiveRecord::Base
  attr_accessible :id, :title_long, :title_short
  has_many :records, :order => "end_date DESC"
  
end
