class EducationRecord < ActiveRecord::Base
  attr_accessible :degree_name, :degree_short_name, :end_date, :id, :is_current, :start_date
end
