json.array!(@produtos) do |produto|
  json.extract! produto, :id, :code, :name, :url, :price, :nparcela, :vparcela, :image, :marca
  json.url produto_url(produto, format: :json)
end
