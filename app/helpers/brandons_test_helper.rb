module BrandonsTestHelper
  
  def url_formatter(object)
    if object.start_with?("http"); object else "http://#{object}" end
  end

  def time_formatter(time)
    time.strftime"%b %e at %l:%m %p %Z"
  end

end