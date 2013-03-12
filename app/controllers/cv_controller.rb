class CvController < ApplicationController
  layout "cv"
  
  def index
    @years = %w{ 1978 1994 1998 2003 2005 2006(1) 2006(2) 2007 2008 2009 2010 2011 2012 2013 }
    
    @records = Record.find :all, :order => "end_date DESC"
    
    @schools = School.find :all, :order => "end_date DESC"
    
    @tags = ActsAsTaggableOn::Tag.find(:all,
  	      :select => "#{ActsAsTaggableOn::Tag.table_name}.id, #{ActsAsTaggableOn::Tag.table_name}.name, COUNT(*) AS count",
          :joins  => "INNER JOIN taggings ON #{ActsAsTaggableOn::Tag.table_name}.id = #{ActsAsTaggableOn::Tagging.table_name}.tag_id",
          :group  => "#{ActsAsTaggableOn::Tag.table_name}.id HAVING COUNT(*) > 0",
          :order  => "LOWER(#{ActsAsTaggableOn::Tag.table_name}.name) ASC"
  	    )
  	    
  	@min_tag_count = 99999999
  	
  	@tags.each do |t|
  	   @min_tag_count = t.count unless t.count > @min_tag_count
  	end
  	  	
  end
end
