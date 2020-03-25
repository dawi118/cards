#Defined random variables
$draw = 0

#Creating card values and suits
suit = ["Clubs", "Diamonds", "Hearts", "Spades"]
	number = (2..10).to_a
	royalty = ["Jack", "Queen", "King"]
grade = ["Ace"] + number + royalty

#Constructing the arrays which these card values will be combined with
Clubs=Array.new(13,"Clubs")
Diamonds=Array.new(13,"Diamonds")
Hearts=Array.new(13,"Hearts")
Spades=Array.new(13,"Spades")
Of_a=Array.new(52," of ")

#Combining the arrays with card values and then their suit.
	deck = grade.zip(Of_a)
	deck = deck.map(&:join)
	deck = deck.zip(Clubs) + deck.zip(Diamonds) + deck.zip(Hearts) + deck.zip(Spades)
	deck = deck.map(&:join)

#Greeter to ascertain whether user wants to randomise card selection with or without replacement.
puts "\nWelcome to the card shuffler!\n\n"
puts "Would you like to sample cards with or without replacement? Type 'with' or 'without' and hit <Enter>"
	s_type = gets.chomp
puts "How many cards would you like to sample?"
	s_size = gets.chomp
puts "Got it, shuffling cards..."
sleep(1)

#Random draws with replacement
if s_type.to_s == "with" 
	while $draw < s_size.to_i
		deck = deck.shuffle!()	
		puts deck[1]
		$draw = $draw+1
	end

#Random draws without replacement
elsif s_type.to_s == "without"
	deck = deck.shuffle!()	
	while $draw < s_size.to_i
		puts deck[$draw]
		$draw = $draw+1
	end

#Error message for user:
else puts "Sorry, I cannot identify that command. Please re-run the programme and specify differently."
end

