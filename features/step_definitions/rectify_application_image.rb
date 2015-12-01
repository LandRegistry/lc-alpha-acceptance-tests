Given(/^I am on the Bankruptcy Rectification document request screen$/) do
  @regnote = '50013'
  visit($FRONTEND_URI)
  maximise_browser
  find(:id, 'rectify').click
end

Given(/^I am on the Rectify screen$/) do
  expect(page).to have_content('Bankruptcy Rectification')
end

When(/^I click on the different thumbnails the editable details are displayed below$/) do
  find(:id, 'thumbnail_1').click
  find(:xpath, 'html/body/form/div/div[2]/div[2]').click
end

When(/^the application details screen is displayed I can overtype the details$/) do
  fill_in('forenames', :with => 'Jack')
  fill_in('surname', :with => 'Jones')
end 

When(/^there is more that one alias name$/) do 
  click_button('addname')
  fill_in('aliasforename1', :with => 'Jeremy')
  fill_in('aliassurname1', :with => 'Fisher')
end 

When(/^I add an address the new details are visible$/) do
  click_button('addaddr')
  fill_in('address11', :with =>'1 long Street')
  fill_in('address21', :with =>'Plymouth')
  fill_in('county1', :with => 'Devon')
  fill_in('postcode1', :with => 'PL1 1BG')
  fill_in('court', :with => 'Devon County Court')
end

Then(/^all amended details will need to be updated to reflect the stored changes$/) do
  sleep(1)
  click_button('save_changes')
  sleep(1)
end

When(/^I can the new details on the screen$/) do
  page.has_content?('Is acknowledgement required?') 
end

When(/^I click on the No for acknowledgement required checkbox is highlighted$/) do 
  choose('No')
end 

When(/^I click on the Yes for acknowledgement required checkbox is highlighted$/) do 
  choose('Yes')
end 

When(/^I click on the Submit button$/) do 
  click_button('submit') 
end 

Given(/^I am on the Application complete screen$/) do
  expect(page).to have_content('Confirmation')
  expect(page).to have_content('successfully submitted')
end

When(/^the rectification to the application has been submitted the amended unique identifier is displayed to the user on the screen$/) do 
  #expect(page).to have_content(@regnote) 
  #this should be the same number as input but does not work defect raised for fix at later stage Database changes required
end 

Given(/^an acknowledgement has been requested$/) do
  step "I am on the Bankruptcy Rectification document request screen"
  @regnote = '50011'
  fill_in('reg_no', :with => @regnote)
  step "I can click the continue button to go to the next screen"
  step "there is more that one alias name"
  step "all amended details will need to be updated to reflect the stored changes"
  step "I click on the Yes for acknowledgement required checkbox is highlighted"
  step "I click on the Submit button"
  expect(page).to have_content('View Notification')
end 

When(/^I click on the view notification link$/) do 
  find(:id, 'notification').click
  sleep(1)
end 

Then(/^the image on an acknowledgement is displayed$/) do
  #expect(page).to have_content('ACKNOWLEDGEMENT OF APPLICATION')
end

Given(/^an acknowledgement has not been requested$/) do 
  step "I am on the Bankruptcy Rectification document request screen"
  @regnote = create_registration
  fill_in('reg_no', :with => @regnote)
  step "I can click the continue button to go to the next screen"
  step "the application details screen is displayed I can overtype the details"
  step "all amended details will need to be updated to reflect the stored changes"
  step "I click on the No for acknowledgement required checkbox is highlighted"
  step "I click on the Submit button"
end 

Then(/^there is not link to view notification$/) do 
  expect(page).not_to have_content('View Notification')
end 