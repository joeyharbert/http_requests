require 'http'

apikey = ""

puts "Welcome to Dictionary dot you're welcome. What do ya want to know bout?"

query = gets.chomp.downcase

definition_info = HTTP.get("https://api.wordnik.com/v4/word.json/#{query}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{apikey}")

example_info = HTTP.get("https://api.wordnik.com/v4/word.json/#{query}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=#{apikey}")

word = definition_info.parse[0]["word"]

definition = []

definition_info.parse.each do |define|
  definition << define["text"]
end


part_of_speech = definition_info.parse[0]["partOfSpeech"]

puts "#{word} (#{part_of_speech}):"

i = 1
definition.each do |text|
  puts "#{i}. #{text}"
  i += 1
end

puts " "
puts "Example uses:"

if example_info.parse != nil
  examples = []
  example_info.parse["examples"].each do |ex|
    examples << {title: ex["title"], text: ex["text"]}
  end


  i = 1
  examples.each do |ex|
    puts "#{i}. (#{ex[:title]} - #{ex[:text]})"
    i += 1
  end
else
  puts "Sorry, no examples."  
end
