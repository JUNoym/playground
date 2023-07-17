json.extract! @book, :id, :name, :price
json.something_key "これは任意につけたキー"
json.publisher do
  json.name @book.publisher.name
  json.address @book.publisher.address
end
