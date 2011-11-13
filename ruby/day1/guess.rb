guesses = []
number = rand 100

puts "I'm a computer, and I'm thinking of a number between 1 and 100..."

until guesses.last == number do
  case guesses.length
  when 0
    puts "What's your guess?"
  when 1
    puts "Hmm... guess again."
  else
    distance = number - guesses.last
    closeness = distance.abs
    direction = guesses[-1] - guesses[-2]

    warmth =
      case closeness
      when 1..2
        "on fire!"
      when 3..5
        "hot!"
      when 6..10
        "warming up."
      when 11..20
        "warm."
      else
        "cold."
      end

    gradient =
      if (distance < 0 and direction < 0) or (distance > 0 and direction > 0) then
        if closeness > 20 then
          "But you're getting warmer!"
        else
          "Getting warmer!"
        end
      else
        if closeness > 20 then
          "But, uhh, you're getting colder!"
        else
          "Getting cooler."
        end
      end

    puts "You're #{warmth} #{gradient}"
  end

  input = 0

  until input > 0
    line = gets
    exit if line.match /quit|exit/i
    input = line.to_i
    puts "That doesn't look like a number..." if input == 0
  end
  
  guesses << input
end

puts "YOU GOT IT! You only had to sit here for #{guesses.length} tries!"
