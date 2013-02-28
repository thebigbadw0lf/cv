class Description < ActiveRecord::Base
  attr_accessible :description_long, :description_short
  has_many :records_descriptions
  has_many :records, :through => :records_descriptions
end
