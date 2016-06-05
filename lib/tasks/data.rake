require 'csv'
namespace :data do
  desc "import data"
  task import: :environment do
    headers = ["chain", "name", "latitude", "longitude", "address", "city", "zip", "department", "phone", "hours", "store_id", "is_address_computed", "is_location_computed", "key", "ignored", "ignore_reason", "overload_chain_name", "mandatory_coords", "country_code"] #
    attributes = ["chain","name","latitude","longitude","address","city","zip","phone","country_code"]
    CSV.foreach( "shops_shopmium.csv", headers: :first_row, write_headers: false, return_headers: false, col_sep: ';', skip_blanks: true, encoding: "iso-8859-1") do |row| #
      Shop.create( row.map {|k,v| [k.strip,v]}.select{|k,v| attributes.include?( k)}.to_h)
    end
  end
end