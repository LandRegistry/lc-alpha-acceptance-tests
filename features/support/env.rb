
$B2B_API_URI = ENV['PUBLIC_API_URL'] || 'http://localhost:5001'
$B2B_PROCESSOR_URI = ENV['AUTOMATIC_PROCESS_URL'] || 'http://localhost:5002'
$BANKRUPTCY_REGISTRATION_URI = ENV['LAND_CHARGES_URL'] || 'http://localhost:5004'
$LAND_CHARGES_URI = ENV['LAND_CHARGES_URL'] || 'http://localhost:5004'
$CASEWORK_API_URI = ENV['CASEWORK_API_URL'] || 'http://localhost:5006'
$LEGACY_DB_URI = ENV['LEGACY_ADAPTER_URL'] || 'http://localhost:5007'
$FRONTEND_URI = ENV['CASEWORK_FRONTEND_URL'] || 'http://localhost:5010'

$POSTGRES_HOST = ENV['POSTGRES_HOST'] || 'localhost'
$POSTGRES_PORT = ENV['POSTGRES_PORT'] || '5432'
$POSTGRES_USER = ENV['POSTGRES_USER'] || 'vagrant'
$POSTGRES_PASSWORD = ENV['POSTGRES_PASSWORD'] || 'vagrant'


puts '======================='
puts "ENVIRONMENT SET"
puts $B2B_PROCESSOR_URI
puts ENV['AUTOMATIC_PROCESS_URL']
puts '======================='