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
end
