module CvHelper
  def year_format(navigation_counter, position, class_past, class_now, class_future)
    case navigation_counter+1
      when 0..position-1
        class_past
      when position
        class_now
      else
        class_future
    end
  end
end
