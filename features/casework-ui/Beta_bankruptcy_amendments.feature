@Beta @bamd

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view the amendment form a bankruptcy registration
So that I can make any changes to the registration

Scenario: #BUS-048 View image of bankruptcy registration forms for amendment
Given I am on the bankruptcy amendments screen
When I select an application type of LRRABO with a single image
And I should not see the thumbnail on the image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-048 View multiple images of bankruptcy registration forms for amendment
Given I am on the bankruptcy amendments screen
When I select an amendment application type the application images are displayed
When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-049 Retrieve and View original data of application
Given I am on the bankruptcy amendments screen
When I select an application type of LRRABO with a single image
When I enter the WOB reference number the details are visible
And the date is visible
When I enter the PAB reference number the details are visible
And the date is visible
When I can click on Continue button to submit the form
When I am on the original bankruptcy details screen I can see the details are all completed
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the second AKA the details are visible
When I click to add additional address new fields are visible
And can be completed
When I click on the remove address the details are no longer visible
When I overtype a new with blanks and click continue an error message is displayed
When I amend an AKA name the new details are visible
Then I can click on Continue button to submit the form