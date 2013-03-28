class LinkedInShare < ActiveRecord::Base
  attr_accessible :comment, :comment_short_url, :first_name, :headline, :last_name, :picture_url, :url
end
