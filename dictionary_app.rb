require 'http'

info = HTTP.get("https://api.wordnik.com/v4/word.json/unicorn/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=APIKEY")

word = info.parse[0]["word"]

definition = info.parse[0]["text"]

part_of_speech = info.parse[0]["partOfSpeech"]

p "#{word} (#{part_of_speech}) - #{definition}"