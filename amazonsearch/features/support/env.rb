require 'watir-webdriver'
require 'pry'


at_exit do
      
  #global exit hook - not in use for now

end


Before do | prerequisites|
		
    $browser = Watir::Browser.new :chrome
    $browser.goto "http://www.amazon.co.uk/"	
    puts 'From Before of Env.rb '
	

end


After do |scenario|

  #$browser.driver.save_screenshot("screenshot.png")
  #embed("screenshot.png", "image/png")

  #sleep(1)
  
  puts 'from After do , closing browser'
  $browser.close

end


