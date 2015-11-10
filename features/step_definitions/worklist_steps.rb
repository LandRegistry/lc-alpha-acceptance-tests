

bob_howard = '{"key_number":"1479067","application_type":"PA(B)","application_ref":"9045789","date":"2014-10-28","debtor_name":{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"},"debtor_alternative_name":[],"gender":"N/A","occupation":"Bookmaker","residence":[{"address_lines":["1940 Huels Fort","North Glennamouth","South Nonafort","West Yorkshire"],"postcode":"PA85 4RH"}],"residence_withheld":false,"business_address":{"address_lines":["831 Hailee Burg","Chasityborough","East Tamara","Northamptonshire"],"postcode":"IP81 2CM"},"date_of_birth":"1974-10-07","investment_property":[]}'

class AssertionFailure < RuntimeError
end

def assert( condition, message = nil )
    unless( condition )
        raise AssertionFailure, message
    end
end

class RestAPI
	attr_reader :response, :data

    def initialize(uri)
        @uri = URI(uri)
        @http = Net::HTTP.new(@uri.host, @uri.port)
    end

    def post_data(url, data)
        request = Net::HTTP::Post.new(url)
        request.body = data
        request["Content-Type"] = "application/json"
        @response = @http.request(request)
        if @response.body == ""
			nil
        else
			@data = JSON.parse(@response.body)
		end
    end

end

Given(/^I have selected to view the main worklist$/) do
  visit($FRONTEND_URI)
end

When(/^I have selected to view specific the application list "(.*)"$/) do |type|
    visit("#{$FRONTEND_URI}/get_list?appn=#{type}" )
end

When(/^I can see the total bankruptcy applications$/) do
    page.should have_css("div#banks_total", :text => '9')
end

When(/^I have submitted a new PAB$/) do
    registration_api = RestAPI.new($CASEWORK_API_URI)
    registration_api.post_data("/lodge_manual", bob_howard)
end

When(/^I have waited (\d+) seconds$/) do |seconds|
    sleep(seconds.to_i)
end

Then(/^I see the totals refresh$/) do
    page.should have_css("div#banks_total", :text => '0')
end

Then(/^I see the bankruptcy application list page$/) do
    page.should have_content("Bankruptcy Registrations")
    page.should have_content("05 November 2015")
    page.should have_css('div#banks_total', :text => '9')
end

Then(/^I see the amendments application list page$/) do
    page.should have_content("Amendments")
    page.should have_content("05 November 2015")
    page.should have_css('div#amend_total', :text => '6')
end

Then(/^I see the cancellations application list page$/) do
    page.should have_content("Cancellations")
    page.should have_content("05 November 2015")
    page.should have_css('div#canc_total', :text => '6')
end

Then(/^I see the searches application list page$/) do
    page.should have_content("Searches")
    page.should have_content("05 November 2015")
    page.should have_css('div#search_total', :text => '6')
end

Then(/^I see the OC application list page$/) do
    page.should have_content("Office Copies")
    #page.should have_content("05 November 2015")
    page.should have_css('div#oc_total', :text => '0')
end

Then(/^I see the application list page with no waiting apps$/) do
    page.should have_content("There are no waiting applications")
end

Then(/^I see the application totals$/) do
    page.should have_css("div#banks_total")
    page.should have_css("div#lcreg_total")
    page.should have_css("div#amend_total")
    page.should have_css("div#canc_total")
    page.should have_css("div#search_total")
    page.should have_css("div#oc_total")
end

When(/^I select a pab application$/) do
    #visit("#{$FRONTEND_URI}/get_application/bank_regn/37/PA(B)" )
    find(:id,'app_type1').click
end

Then(/^I see the application details page$/) do
    page.should have_content("Debtor name and details")
end

Then(/^I close browser$/) do
    close_browser
end

Then(/^I open a new browser instance$/) do
    Capybara.send(:session_pool).delete_if { |key, value| key =~ /selenium/i }
end

