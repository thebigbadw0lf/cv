class Industry < ActiveRecord::Base
  attr_accessible :link, :name, :short_name
  belongs_to :record
end
