json.array!(@customers) do |customer|
  json.extract! customer, :id, :ContactName, :ContactTitle, :Address
  json.url customer_url(customer, format: :json)
end
