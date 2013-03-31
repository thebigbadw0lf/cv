class CvController < ApplicationController
  layout "cv"
  
  def index    
    @records = Record.find :all, :order => "end_date DESC"
    
    @education_records = EducationRecord.find :all, :order => "end_date DESC"
    
    @schools = School.find :all
    
    @tags = ActsAsTaggableOn::Tag.find :all,
  	      :select => "#{ActsAsTaggableOn::Tag.table_name}.id, #{ActsAsTaggableOn::Tag.table_name}.name, COUNT(*) AS count",
          :joins  => "INNER JOIN taggings ON #{ActsAsTaggableOn::Tag.table_name}.id = #{ActsAsTaggableOn::Tagging.table_name}.tag_id",
          :group  => "#{ActsAsTaggableOn::Tag.table_name}.id HAVING COUNT(*) > 0",
          :order  => "LOWER(#{ActsAsTaggableOn::Tag.table_name}.name) ASC"
  	
    #find out the smallest number of occurences for tags in the tag cloud and make it available to the view (shown in the view in the data-min-count css element from where it is picked up by jQuery and used for hiding less frequent tags in the tag cloud)
  	@min_tag_count = min_tag_count(@tags)
    
    @job_titles = JobTitle.find :all, :order => "updated_at DESC "
    
  	@companies = Company.find :all, :order => "updated_at DESC"
    
  	@locations = Location.find :all, :order => "updated_at DESC"
  	
  	@industries = Industry.find :all, 
            :include => {:companies => :records},
            :conditions => "records.* IS NOT NULL"
    
    @g_locations = @locations.to_gmaps4rails do |location, marker|
      #marker.infowindow render_to_string(:partial => "infowindow", :locals => { :location => location })
      
      unless location.region then
        marker.title location.city + ", " + location.country
        marker.json({ :id => "city_" + location.city.downcase + "_country_" + location.country.downcase })
      else
        marker.title location.city + ", " + location.region + ", " + location.country
        marker.json({ :id => "city_" + location.city.downcase + "_region_" + location.region.downcase + "_country_" + location.country.downcase })
      end
      
      marker.picture(APP_CONFIG[:gmaps_marker])
    end
    
    @g_locations2 = @locations.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => { :location => location })
      
      unless location.region then
        marker.title location.city + ", " + location.country
        marker.json({ :id => "large_city_" + location.city.downcase + "_country_" + location.country.downcase })
      else
        marker.title location.city + ", " + location.region + ", " + location.country
        marker.json({ :id => "large_city_" + location.city.downcase + "_region_" + location.region.downcase + "_country_" + location.country.downcase })
      end
      
      marker.picture(APP_CONFIG[:gmaps_marker])
    end
    
    @linkedin_records = LinkedInShare.find :all
    
    if (@linkedin_records.count < 5) || (Time.now - @linkedin_records.first.updated_at >= 60 * APP_CONFIG[:linkedin_refresh_interval])
      @shares = linkedin.network_updates(:type => 'SHAR', :count => 10) rescue @shares = nil
      save_linkedin_shares(@shares) unless @shares.nil?
      @linkedin_records = LinkedInShare.find :all
    end
    
    # @linkedin_records = nil to turn off the linkedin network updates sidebar section
  end
  
  protected
  def min_tag_count(tags)
  	tag_count = 99999999
  	
  	tags.each do |t|
  	   tag_count = t.count unless t.count > tag_count
  	end
    
    tag_count
  end
  
  def save_linkedin_shares(items)    
    shares = Array.new
    
    unless items.empty?
      items.all.each do |s|
        unless s.to_hash['update_content'].nil?
      
          share = s.to_hash['update_content'].first[1]
    
          post = Hash.new
          
          unless share['site_standard_profile_request'].nil?
            post[:url] = share['site_standard_profile_request']['url'] unless share['site_standard_profile_request']['url'].nil?
          end
          post[:picture_url] = share['picture_url'] unless share['picture_url'].nil?
          unless share['current_share'].nil?
            unless share['current_share']['author'].nil?
              post[:first_name] = share['current_share']['author']['first_name'] unless share['current_share']['author']['first_name'].nil?            
              post[:last_name] = share['current_share']['author']['last_name'] unless share['current_share']['author']['last_name'].nil?
              post[:headline] = share['current_share']['author']['headline'] unless share['current_share']['author']['headline'].nil?
            end
          end
        
          unless share['current_share'].nil?
            post[:comment] = share['current_share']['comment'] unless share['current_share']['comment'].nil?
          
            unless share['current_share']['content'].nil?
              post[:comment_short_url] = share['current_share']['content']['shortened_url'] unless share['current_share']['content']['shortened_url'].nil?
            end
          end
    
          shares << post unless post.empty?
        end
      end
    end
    
    
    if shares.count >= 5 then
      
      LinkedInShare.delete_all
      
      i = 0
      
      shares.each do |share|
        break if i == 5
        
        record = LinkedInShare.new do |post|
          post.url = share[:url]
          post.picture_url = share[:picture_url]
          post.first_name = share[:first_name]
          post.last_name = share[:last_name]
          post.headline = share[:headline]
          post.comment = share[:comment]
          post.comment_short_url = share[:comment_short_url]
        end
        
        unless record.url.blank? || record.first_name.blank? || record.last_name.blank? || record.headline.blank? || record.comment.blank?
          record.save!
          i += 1
        end
      end      
    end
  end
  
end
