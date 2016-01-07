require 'watir-webdriver'
require 'pry'
  
  Given(/^I opened the amazon web URL$/) do
  end

When(/^I search for 'Kindle Fire'$/) do
  amazon_landingpage = AmazonLandingPage.new($browser)
  amazon_landingpage.name = 'Kindle Fire'
  amazon_landingpage.search
end

  Then(/^I should see atleast (\d+) result$/) do |expectedcount|
    
    amazon_resultspage = AmazonResultsPage.new($browser)
    puts amazon_resultspage.searchcount
    strFullResult =  amazon_resultspage.searchcount

    #extract number of results from the search     
    countActualResult = countResults(strFullResult)
  
     if  countActualResult >= expectedcount.to_i
      # Save screenshot to file
      $browser.screenshot.save 'screenshot.png'
      embed 'screenshot.png', 'image/png'   
     
   end
  

 #method to extract number of results from the search  string
 def countResults(strInput)
    #extract number of results from the search
    indexStart = strInput.index('of ')
    indexEnd = strInput.index(' results')
       
    strActualResult = strInput [indexStart+3,indexEnd-8]  
    countActualResult = strActualResult.gsub(',','').to_i
    return countActualResult
  end 


  
end

