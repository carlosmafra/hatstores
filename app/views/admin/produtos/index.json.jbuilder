json.array!(@admin_produtos) do |admin_produto|
  json.extract! admin_produto, :id, :code, :name, :url, :price, :nparcela, :vparcela, :image, :marca
  json.url admin_produto_url(admin_produto, format: :json)
end
