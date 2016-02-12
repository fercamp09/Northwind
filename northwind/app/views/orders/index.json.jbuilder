json.array!(@orders) do |order|
  json.extract! order, :id, :CustomerID, :OrderDate, :RequiredDate, :ShippedDate
  json.url order_url(order, format: :json)
end
