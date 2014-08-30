module BrandonsTestHelper
  
  def url_formatter(object)
    if object.start_with?("http"); object else "http://#{object}" end
  end

  def time_formatter(time)
    if logged_in? 
      time.in_time_zone(current_user.time_zone).strftime"%b %e at %l:%m %p %Z"  
    else
      #TODO: Not sure why the time zone seems to be defaulting to UDT, had to
      #manually hard code "Pacific Time (US & Canada)" below 
      time.in_time_zone("Pacific Time (US & Canada)").strftime"%b %e at %l:%m %p %Z"
    end
  end

end

