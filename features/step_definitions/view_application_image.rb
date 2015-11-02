Given(/^I am on the view application screen$/) do
  visit($FRONTEND_URI)
  maximise_browser
end

When(/^I have selected to view specific the application list$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  find(:xpath,"html/body/div[1]/div/div/div[3]/div/table/tbody/tr[1]/td[1]/a").click

end

When(/^the image of the application is displayed I can click on all available pages$/) do
  find(:xpath, '//*[@id="thumbnails"]/img[2]').click
end

Given(/^I am on the debtors name and details screen$/) do
  expect(page).to have_content('Debtor name and details')
  puts('screen shows')
end

When(/^I complete the Forename and Surname details remain visible$/) do
  fill_in('forename', :with => 'Nicola')
  fill_in('surname', :with => 'Andrews')
end

When(/^I click the add name button Alias Forename\(s\) and Alias Surname is displayed$/) do
  click_button('Add alias name')
  fill_in('aliasforename0', :with =>'Nichola')
  fill_in('aliassurname0', :with => 'Andrews')
  click_button('Add alias name')
  fill_in('aliasforename1', :with =>'Nicola')
  fill_in('aliassurname1', :with => 'Andrewson')
end

When(/^I amend a Forename the new details remain visable$/) do
  fill_in('forename', :with => 'Nicola Jayne')
end

Then(/^I amend the Surname of the Alias Surname and the new details remain visible$/) do
  fill_in('aliasforename0', :with => 'Nicola')
end

When(/^I enter an Occupation the details remain visible$/) do
  fill_in('occupation', :with => 'civil servant')
end

Given(/^I am on the debtors address screen$/) do
  expect(page).to have_content('Debtor address')
end

When(/^I supply the address details in the address fields they remain visible$/) do
  fill_in('address1', :with => '1 Addison Square')
  fill_in('address2', :with => 'Ringwood')
  fill_in('address3', :with => '')
  fill_in('county', :with => 'Hants')
  fill_in('postcode', :with => 'BH23 1NY')
end

When(/^I click the add address button the address is added to the top of the screen$/) do
  click_button('Add additional address')
  #check that address is displayed at top
end

When(/^I supply additional address details$/) do
  fill_in('address1', :with => '1 Longview Terrace')
  fill_in('address2', :with => 'Ringwood')
  fill_in('address3', :with => 'New Forest')
  fill_in('county', :with => 'Hants')
  fill_in('postcode', :with => 'BH23 1NY')
end

Given(/^I am on the case information screen$/) do
  expect(page).to have_content('Case information')
end

When(/^I first see the class of charge neither PAB or WOB are checked$/) do
  find_field("PA(B)").checked?
  find_field("WO(B)").checked?

end

When(/^I select a Class of Charge of PAB this becomes checked$/) do

  choose('PA(B)')
end

Then(/^I select a Class of Charge of WOB this becomes checked and PAB becomes unchecked$/) do
  choose('WO(B)')

end

When(/^I enter a court name the details remain visible$/) do
  fill_in('court', :with => 'Bournemouth County court')
end

When(/^I enter a court number and year the details remain visible$/) do
  fill_in('court_ref', :with => '123/2015')
end

Then(/^I click the submit button and the application complete screen is displayed$/) do
  click_button('Submit')
end


When(/^the Application has been submitted the unique identifier is displayed to the user on the screen$/) do
  expect(page).to have_content('Your application reference number')
  expect(page).to have_content('Registered on')
end

When(/^the Application has been submitted the date is displayed to the user on the screen$/) do
  current_date = Date.today
  date_format = current_date.strftime('%d.%m.%Y')
  puts(current_date)
  puts(date_format)
  registerdate = find(:id, 'registereddate').text
  puts(registerdate)
  expect(registerdate).to eq 'Registered on '+ date_format
end

Then(/^the user can return to the worklist$/) do
  click_link('Return to Worklist')
  sleep(1)
end
