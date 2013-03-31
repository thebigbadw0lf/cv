module CvHelper
  
  def carousel_timeline
    ["Jun'78", "Jun'98", "Oct'02", "Jan'05", "Jan'06", "Oct'06", "Jul'08", "Apr'10", "Now..."]
  end
  
  def year_format(carousel_navigation_counter, position, class_past, class_now, class_future)
    case carousel_navigation_counter
      when 0..position-1
        class_past
      when position
        class_now
      else
        class_future
    end
  end
  
  def year_switch(carousel_navigation_counter)
    carousel_navigation_counter.even? ? "year_box" : "year_box2"
  end
  
  def date_format(date)
    date.strftime("%B %Y")
  end
  
  def calculate_duration(item)
    start_date_prev, end_date_prev, days = nil
    
    item.each_with_index do | r, i|  #split records associated with current item
      if defined?(r.is_current) then
        r.is_current == 1 ? end_date = Date.today : end_date = r.end_date #use today's date if item is current
      else
        end_date = r.end_date
      end
      
      start_date = r.start_date
      
      dur = 0
    
      if i > 0 then  #start_date_prev(ious) and end_date_prev(ious) are not available in first iteration
        end_date > start_date_prev ? end_date_calc = start_date_prev : end_date_calc = end_date  #eliminate overlaps when previous record's started before the current one ended
        start_date > start_date_prev ? start_date_calc = start_date_prev : start_date_calc = start_date   #eliminate overlaps when previous record's start date started before the current one. In this case the duration for the current entry is zero since it is completely overlapping the start and end of the previous entry
        dur = end_date_calc - start_date_calc # add current entry's duration to overall duration
      end
      
      if i==0
        days = end_date - start_date # if this is the first iteration, simply subtract start_date from end_date to compute duration
      end
      
      days += dur.to_i
      end_date_prev = end_date  #store current end and start dates to use in next iteration
      start_date_prev = start_date      
    end
    
    duration =  days.to_f
    
    verbalize_duration(duration)
  end
  
  def verbalize_duration(duration)
    case duration   #output duration in years, months or days depending on length
      when 384..3650000000000
        output_days = duration / 365
        output_days = output_days.round(1)
        if output_days % 1 == 0 then
          output_text = output_days.round.to_s + " years"
        else
          output_text = output_days.to_s + " years"
        end
      when 350...384
        output_text = "1 year"
      when 33...350
        output_days = duration / 30
        output_text = output_days.round.to_s + " months"
      when 27...33
        output_text = "1 month"
      when 1.5...27
        output_text = duration.round.to_i.to_s + " days"
      when 0...1.5
        output_text = "1 day"
    end
    
    output_text
  end
  
  def calc_duration_industries(item)   #build array to hold all records belonging to companies tagged with one specific industry
    industry_records = Array.new
    item.each do |i|  #split each industry array into companies
      i.records.each do |r|   #split each company array into records
        industry_records << r   #append each record to new array
      end
    end
    
    industry_records = industry_records.sort_by(&:end_date).reverse!   #sort records by end_date desc
    calculate_duration(industry_records)   #send new array to method for computing industry duration and return duration back to the view
  end
  
  def order_tags(tags)
    tags.sort { |a,b| a.downcase <=> b.downcase }
  end
  
  def compute_average_duration(records)
    duration = 0
    
    records.each do |record|
      record.end_date = Date.today if record.is_current == 1
      duration += record.end_date - record.start_date
    end
    
    average_duration = duration / records.count
    verbalize_duration(average_duration.to_f)
  end

  def show_location_items(location)
    items = Array.new
    
    location.records.each do |record|
      item = Hash.new
      item[:name] = record.company.name
      record.company.link.blank? ? item[:url] = "#" : item[:url] = "http://" + record.company.link
      items << item
    end
    
    location.education_records.each do |record|
      item = Hash.new
      item[:name] = record.school.name
      record.school.link.blank? ? item[:url] = "#" : item[:url] = "http://" + record.school.link
      items << item
    end
    
    items
  end
  
  def compose_comment(comment, comment_title, comment_description)
    if comment.blank? && comment_title.blank?
      output = comment_description
    elsif comment.blank? && !comment_title.blank?
      output = comment_title
    elsif !comment.blank? && comment_title.blank?
      output = comment
    else
      comment.length > comment_title.length ? output = comment : output = comment_title
    end
  end
end

