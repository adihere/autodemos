require 'watir-webdriver'
require 'pry'
require 'page-object'


#created sauce capability object
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['platform'] = "Windows 8.1"
caps['browserName'] = "internet explorer"
caps['version'] = "11"
caps['name'] = "Test trail 3 with Sauce by Adi"
 
def sauce_url
  "http://adityahere:1f6820dc-d457-44ea-80c0-2271351298ca@ondemand.saucelabs.com:80/wd/hub"
end


at_exit do
      
  #global exit hook - not in use for now

end


Before do | prerequisites|
	
    #calling saucelabs capability
    $browser = Watir::Browser.new(:remote, url: sauce_url, desired_capabilities: caps)
    #$browser = Watir::Browser.new :chrome
    $browser.goto "http://www.amazon.co.uk/"	
end


After do |scenario|
  sleep(1)
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


 
  


