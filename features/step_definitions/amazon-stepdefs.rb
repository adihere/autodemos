require 'watir-webdriver'
require 'pry'
  
  Given(/^I opened the amazon web URL$/) do
 
    puts 'Given1'     
    # Save screenshot to file
  end


When(/^I search for 'Kindle Fire'$/) do
  $browser.text_field(:id => 'twotabsearchtextbox').set('Kindle Fire')
  $browser.button(:value => 'Go').click
end

  Then(/^I should see atleast (\d+) result$/) do |expectedcount|
    
    puts $browser.h2(:id => 's-result-count').text
    strFullResult =  $browser.h2(:id => 's-result-count').text
    
    #binding.pry
    
    indexStart = strFullResult.index('of ')
    indexEnd = strFullResult.index(' results')
       
     strActualResult = strFullResult [indexStart+3,indexEnd-8]  
     countActualResult = strActualResult.gsub(',','').to_i
     
    puts countActualResult
    
     if  countActualResult >= expectedcount.to_i
    	puts 'Multiple Results - Test Pass'	

      # Save screenshot to file
      $browser.screenshot.save 'screenshot.png'
      embed 'screenshot.png', 'image/png'
        
      
     
   end
  



  
end

