class CvController < ApplicationController
  layout "cv"
  
  def index
    @years = %w{ 1978 1994 1998 2003 2005 2006(1) 2006(2) 2007 2008 2009 2010 2011 2012 2013 }
    
    @records = Record.find :all, :order => "end_date DESC"
    
    @education_records = EducationRecord.find :all, :order => "end_date DESC"
    
    @schools = School.find :all
    
    @tags = ActsAsTaggableOn::Tag.find(:all,
  	      :select => "#{ActsAsTaggableOn::Tag.table_name}.id, #{ActsAsTaggableOn::Tag.table_name}.name, COUNT(*) AS count",
          :joins  => "INNER JOIN taggings ON #{ActsAsTaggableOn::Tag.table_name}.id = #{ActsAsTaggableOn::Tagging.table_name}.tag_id",
          :group  => "#{ActsAsTaggableOn::Tag.table_name}.id HAVING COUNT(*) > 0",
          :order  => "LOWER(#{ActsAsTaggableOn::Tag.table_name}.name) ASC"
  	    )
  	
    #find out the smallest number of occurences for tags in the tag cloud and make it available to the view (shown in the view in the data-min-count css element from where it is picked up by jQuery and used for hiding less frequent tags in the tag cloud)
  	@min_tag_count = min_tag_count(@tags)
    
    @job_titles = JobTitle.find :all, :order => "updated_at DESC "
    
  	@companies = Company.find :all, :order => "updated_at DESC"
  	
  	@industries = Industry.find :all, :order => "updated_at DESC" #not null
  	
  	@locations = Location.find :all, :order => "updated_at DESC"
  	  	
  end
  
  protected
  def min_tag_count(tags)
  	tag_count = 99999999
  	
  	tags.each do |t|
  	   tag_count = t.count unless t.count > tag_count
  	end
    
    tag_count
  end
end
