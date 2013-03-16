module CvHelper
  def year_format(navigation_counter, position, class_past, class_now, class_future)
    case navigation_counter
      when 0..position-1
        class_past
      when position
        class_now
      else
        class_future
    end
  end
  
  def year_switch(navigation_counter)
    navigation_counter.even? ? "year_box" : "year_box2"
  end
  
  def date_format(date)
    date.strftime("%B %Y")
  end
  
  def calculate_duration(item)
    item.each_with_index do | r, i|  #split records associated with current job title
      r.is_current == 1 ? end_date = Date.today : end_date = r.end_date #use today's date if job is current
      start_date = r.start_date
    
      if i > 0 then  #start_date_prev(ious) and end_date_prev(ious) are not available in first iteration
        end_date > @start_date_prev ? end_date_calc = @start_date_prev : end_date_calc = end_date  #eliminate overlaps when previous record's started before the current one ended
        start_date > @start_date_prev ? start_date_calc = @start_date_prev : start_date_calc = start_date   #eliminate overlaps when previous record's start date started before the current one. In this case the duration for the current entry is zero since it is completely overlapping the start and end of the previous entry
        dur = end_date_calc - start_date_calc # add current entry's duration to overall duration
      end
      
      if i==0
        @days = end_date - start_date # if this is the first iteration (i is 0) then simply subtract start_date from end_date to compute duration
      end
      
      @days += dur.to_i
      @end_date_prev = end_date  #store current end and start dates to use in next iteration
      @start_date_prev = start_date      
    end
    
    duration =  @days.to_f
        
    case duration
    when 384..3650000000000
      output_days = duration / 365
      if output_days % 1 == 0 then
        output_text = output_days.round.to_s + " years"
      else
        output_text = output_days.round(1).to_s + " years"
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
end
