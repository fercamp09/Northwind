json.array!(@products) do |product|
  json.extract! product, :id, :ProductName, :QuantityPerUnit, :UnitPrice, :UnitsInStock, :UnitsOnOrder
  json.url product_url(product, format: :json)
end
