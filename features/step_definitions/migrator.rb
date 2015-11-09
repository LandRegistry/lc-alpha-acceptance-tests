reg_no = rand(1000..1000000).to_s # TODO: how to ensure uniqueness?
day_start = (Date.today).strftime("%Y-%m-%d")
day_end = (Date.today + 1).strftime("%Y-%m-%d")

date_range = "/begin?start_date=#{day_start}&end_date=#{day_end}"
legacy_date_range = "/land_charge?start_date=#{day_start}&end_date=#{day_end}"
#'/land_charge?start_date=2015-07-17&end_date=2015-07-18'
mytime = Time.new.strftime("%Y-%m-%d %H:%M:%S.%6N")
legacy_row = '{"time":"' + mytime + '","registration_no":"' + reg_no + '","priority_notice":"","reverse_name":"YDRUPYDDERFD","property_county":255,"registration_date":"' + day_start + '","class_type":"PA(B)","remainder_name":"STANFOR","punctuation_code":"28C6","name":"","address":"52413 LILYAN PINE EAST ILIANA FA16 0XD BERKSHIRE","occupation":"","counties":"","amendment_info":"NORTH JAMEYSHIRE COUNTY COURT 677 OF 2015","property":"","parish_district":"","priority_notice_ref":""}'

now = Date.today
ninety_days_ago = (now - 90)

puts reg_no

migration_api = nil
legacy_api = nil
registration_api = nil

Given(/^I have inserted a row into the legacy db$/) do
  legacy_api = RestAPI.new($LEGACY_DB_URI)
  legacy_api.put("/land_charge", legacy_row)
end

When(/^I submit a date range to the migrator$/) do
  migration_api = RestAPI.new($MIGRATOR_URI)
  migration_api.post(date_range)
end

When(/^I submit a date range to the legacy db$/) do
  legacy_api = RestAPI.new($LEGACY_DB_URI)
  legacy_api.get(legacy_date_range)
end

When(/^it returns a 200 OK response$/) do
  expect(RestAPI.last_response.code).to eql "200"
end

Then(/^a new record is stored on the register database in the correct format$/) do
  PostgreSQL.connect('landcharges')
  result = PostgreSQL.query("SELECT c.party_name FROM migration_status a, register b, party_name c WHERE a.original_regn_no = #{reg_no} AND a.register_id = b.id AND b.debtor_reg_name_id = c.id FETCH FIRST 1 ROW ONLY")
  expect(result.values.length).to eq 1
  row = result.values[0]
  expect(row[0]).to eq "STANFORD FREDDY PURDY"
  PostgreSQL.disconnect
end
