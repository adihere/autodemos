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


class UtilAdi
 #method to extract number of results from the search  string
 def countResults(strInput)
    indexStart = strInput.index('of ')
    indexEnd = strInput.index(' results')
       
    strActualResult = strInput [indexStart+3,indexEnd-8]  
    countActualResult = strActualResult.gsub(',','').to_i
    #return countActualResult
     countActualResult
  end 
end


 
  


