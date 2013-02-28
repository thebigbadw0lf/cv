class Company < ActiveRecord::Base
  attr_accessible :link, :logo_link, :max_employees, :min_employees, :name, :short_name
  belongs_to :record
end
