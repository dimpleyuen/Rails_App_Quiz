json.array! @tweets do |tweet|
  json.id tweet.id
  json.content tweet.content
  json.language tweet.author_name
end