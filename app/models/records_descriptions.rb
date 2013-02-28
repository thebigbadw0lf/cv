class RecordsDescriptions < ActiveRecord::Base
  attr_accessible :description_id, :record_id
  belongs_to :record
  belongs_to :description
end
