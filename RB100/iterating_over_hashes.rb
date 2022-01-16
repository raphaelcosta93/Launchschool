person = {name: 'bob', height: "6ft", weight:"160lbs", age:63, hair:'brown'}
person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end
