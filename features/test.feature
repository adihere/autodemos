Feature: TestAmazonSearch
As an amazon user
I want to search for products on the website
So that I can view or buy the products 

@allscenarios
@scenario1
Scenario: Check Amazon website for a product

Given I opened the amazon web URL
When I search for 'Kindle Fire'
Then I should see atleast 1 result


@allscenarios
@scenario2
Scenario: Check Amazon website for a gibberish product

Given I opened the amazon web URL
When I search for 'Gibberish Doesnot Exist zazu'
Then I should see no results



