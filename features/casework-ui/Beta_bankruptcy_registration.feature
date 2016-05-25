@Beta @breg

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a bankruptcy application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-045 View images of bankruptcy registration forms 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
#When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-045 View single image on a bankruptcy registration screen
Given I am on the bankruptcy registration screen
When I choose the first available WOB form
#And I should not see the thumbnail on the image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-046 #BUS-043 #BUS-042 #BUS-132 #BUS-131 Input bankruptcy registration details
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
Then I can click on Continue button to submit the form

Scenario: #BUS-132 #BUS-131 Input particulars of debtor
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the second AKA the details are visible
When I enter the address the details are visible
When I click to add additional address new fields are visible
And can be completed
Then I can click on Continue button to submit the form

Scenario: #BUS-139 #BUS-130 #BUS-038 #BUS-053 Verify mandatory two stage name re-entry when completing a bankruptcy registration application 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the address the details are visible
When I can click on Continue button to submit the form
When I am on the verification screen I can rekey debtor's name
When I am on the verification screen I can change debtor's AKA name
When I am on the verification screen I can rekey court name
When I can click on Continue button to submit the form
And I am on the Court screen I can enter a valid key number
And I can click on Continue button to submit the form
Then the successfully completed Registration banner and number is displayed

Scenario: BUS-038 Confirm Bankruptcy registration number
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
Then I can confirm successful submission of details for a bankruptcy application

Scenario: BUS-167 Verify two stage mandatory re-key 
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I register a PAB application with AKA
When I re-register with the previous registration details
Then I can confirm that court details have already been used

Scenario: BUS-167.0 Proceed to register bankruptcy even if two keyed details already exists
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I register a PAB application with AKA
And I re-register with the previous registration details
When I can confirm that court details have already been used
And I click Yes to continue with the bankruptcy registration
Then I can confirm that I am on the debtors details screen 
And I can submit a new particulars of details
And I can re-key and submit debtor details

Scenario: BUS-165 Associate image of duplicate bankruptcy application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I register a PAB application with AKA
And I re-register with the previous registration details
When I can confirm that court details have already been used
And I click No to discontinue with the bankruptcy registration
Then I can choose a name
And I can assign immage to the application

Scenario: BUS-082 Store application on Particulars of Debtor page of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click on Continue button to submit the form
And I can enter name details
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

Scenario: BUS-082.1 Store application on details verification screen of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click button to continue
And I can submit debtor details
And I can re-key debtor details
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

Scenario: BUS-082.2 Store application on Key Number page of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click button to continue
And I can submit debtor details
And I can re-key debtor details
And I can click button to continue
And I am on the Court screen I can enter a valid key number
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

Scenario: BUS-082.3 Verify display of a stored bankruptcy application 
Given I am on the bankruptcy registration screen
When I navigate to bankruptcy application storage page
Then I can validate number displayed before and after an application is stored

Scenario: BUS-120 Reject Bankruptcy registration application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I enter court name the details are visible
When I click on the link to reject application
Then I click Ok on the pop up
And I can see Confirmation message indicating the application has been rejected

Scenario: BUS-120.1 Confirm that a rejected Bankruptcy registration form no longer exists
Given I am on the bankruptcy registration screen
When I choose the first available WOB form
Then I can reject the bank reg application form
And I can confirm the form no longer exists

Scenario: Register WOB issued by adjudicator
Given I am on the bankruptcy registration screen
When I choose the first available WOB form
And I enter court reference the details are visible
And I can click button to continue
Then I register the application
And I can click button to continue
And I can see the application successful message 

Scenario: Register PAB issued by adjudicator
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court reference the details are visible
And I can click button to continue
Then I register the application
And I can click button to continue
And I can see the application successful message 

Scenario: BUS-173A Login and out of the portal
Given I launch the login page
And I enter valid login details
When I click on the login button
Then I can log out
And I can see username and password fields

Scenario: BUS-173B Login and out of the portal without any data
Given I launch the login page
And I leave login fields empty
When I click on the login button
Then I will see invalid data error message

Scenario: Confirm remaining bank registration 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
Then I can verify remaining forms on worklist after submitting two out of three applications

#EA: Test runs successfully on wifi but fails on diti
#Scenario: E2E Regression: Amend and cancel a stored new bankruptcy application
#Given I am on the bankruptcy registration screen
#When I register a newly stored bankruptcy application
#And I can amend the newly registered application
#Then I cancel the amended application
#And I cannot cancel the bankruptcy application a second time

Scenario: Submit different application forms
Given I am on Land Charge and Bankruptcy services login page
Then I can submit multiple Bank application forms:
|user    |pword   |page	   |crtname      |crtref|forename  |surname     |forename2|surname2|occupation |address1      |county                 |pcode |chckforename    |chcksurname|chckcrtname |keyno  |
|cssyt2c | labour |bankreg |Mango County |  221 |Mary	  |Screwedface |Jonelle  |Joelle  |Nurse      |21 The Street |Buckinghamshire County |LA12AA|Mary            |Screwedface|Mango County|2244095|
|cssyt2c | labour |bankreg |Jumbo County |  111 |Harry	  |Nikeman     |         |        |Farmer     |21 The Street |Derbyshire County      |DE45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | labour |bankreg |             |  111 |Harry	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | labour |lcreg   |             |      |	      |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | labour |flsrch  |             |      |     	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | labour |bksrch  |             |      |     	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | %lsdd  |flsrch  |             |      |     	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|2344dfd | labour |bksrch  |             |      |     	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County|2244095|
|cssyt2c | labour |bankreg |Orange County|  111 |Harry	  |Watts       | Pollard | Vicky  |Teacher    |12 My Street  |Derbyshire County      |DE45YD|Harry           |Watts      |Jumbo County|2244095|

#Scenario: Submit bankruptcy application forms
#Given I am on Land Charge and Bankruptcy services login page
#And I enter valid login details
#And I click on the login button
#When I navigate to bankruptcy registration worklist
#And I choose the first available application form
#Then I can submit bankruptcy registration forms
#|crtname     |crtref|forename |surname     |forename2|surname2|occupation |address1      |county                 |pcode |chckforename    |chcksurname|chckcrtname    |keyno  |
#|Mango County|  221 |Mary	  |Screwedface |Jonelle  |Joelle  |Nurse      |21 The Street |Buckinghamshire County |LA12AA|Mary            |Screwedface|Mango County   |2244095|
#|Jumbo County|  111 |Harry	  |Nikeman     |         |        |Farmer     |21 The Street |Derbyshire County      |DE45YD|Harry           |Nikeman    |Jumbo County   |2244095|
#|            |  111 |Harry	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County   |2244095|
#|Mickey Mouse|      |Penny    |Bruce       |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County   |2244095|
#|            |      |     	  |Nikeman     |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Harry           |Nikeman    |Jumbo County   |2244095|
#|Derby County|  221 |Mike 	  |Bacon       |         |        |Plumber    |21 The Street |Plymouth County        |PL45YD|Mike 	         |Bacon      |Plymouth County|2244095|
  
Scenario: Correction of Bankruptcy registration
Given I am on the bankruptcy registration screen
And I navigate to bankruptcy registration worklist
And I choose the first available application form
When I register a new bankruptcy application
And I can validate registration details for correction
And I can amend debtor details
Then I can proceed to bankruptcy verification page
And I can submit corrections

