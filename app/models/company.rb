class Company < ActiveRecord::Base
  attr_accessible :link, :logo_link, :max_employees, :min_employees, :name, :short_name
  has_many :records
  has_and_belongs_to_many :industries, :join_table => "industries_companies"
  
end
