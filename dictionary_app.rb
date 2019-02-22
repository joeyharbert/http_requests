require 'http'

puts "Welcome to Dictionary dot you're welcome. What do ya want to know bout?"

query = gets.chomp

info = HTTP.get("https://api.wordnik.com/v4/word.json/#{query}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=APIKEY")

word = info.parse[0]["word"]

definition = info.parse[0]["text"]

part_of_speech = info.parse[0]["partOfSpeech"]

puts "#{word} (#{part_of_speech}) - #{definition}"