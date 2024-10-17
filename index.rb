require "net/http"
require "json"
require "csv"

API_KEY = "5216ee230492e1e94b134c14"

uri = URI("https://v6.exchangerate-api.com/v6/#{ API_KEY }/latest/EUR")
response = Net::HTTP.get(uri)
data = JSON.parse(response)

rates = data["conversion_rates"]
currencies = ["USD", "GBP", "JPY"]

CSV.open("rates.csv", "w") do |csv|
  csv << ["Currency", "Rate"]

  currencies.each do |currency|
    csv << [currency, rates[currency]]
  end
end

puts "exchange rates of EUR successfully saved to rates.csv file"
