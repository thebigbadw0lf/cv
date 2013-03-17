class Industry < ActiveRecord::Base
  attr_accessible :link, :name, :short_name
  has_and_belongs_to_many :companies, :join_table => "industries_companies"
  has_many :records
end
