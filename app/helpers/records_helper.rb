module RecordsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def order_tags(tags)
    tags.sort { |a,b| a.downcase <=> b.downcase }
  end
end
