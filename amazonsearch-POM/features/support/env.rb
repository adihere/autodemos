require 'watir-webdriver'
require 'pry'
require 'page-object'


at_exit do
      
  #global exit hook - not in use for now

end


Before do | prerequisites|
		
    $browser = Watir::Browser.new :chrome
    $browser.goto "http://www.amazon.co.uk/"	
	

end


After do |scenario|

  #$browser.driver.save_screenshot("screenshot.png")
  #embed("screenshot.png", "image/png")

  #sleep(1)
  
  puts 'from After do , closing browser'
  $browser.close

end


class AmazonLandingPage
  include PageObject
  text_field(:name, :id => 'twotabsearchtextbox')
  button(:search, :value => 'Go')
end


class AmazonResultsPage
  include PageObject
   h2(:searchcount, :id => 's-result-count')
  
end




 
  


