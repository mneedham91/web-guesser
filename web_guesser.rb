require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100) + 1
@@guesses_remaining = 5

get '/' do
	@@guesses_remaining -= 1
	if @@guesses_remaining == 0
		@@number = rand(100) + 1
		@@guesses_remaining = 5
		message = 'You lost! A new number has been generated.'
	else
		message = check_guess(params['guess'].to_i, @@number)
		if message == "You got it right!"
			@@number = rand(100) + 1
			@@guesses_remaining = 5
		end
	end
	erb :index, :locals => {:number => @@number, :message => message, :cheat => params['cheat']}
end

def check_guess(guess, number)
	if guess > number
		if guess > number + 5
			message = 'Way too high!'
		else
			message = 'Too high!'
		end
	elsif guess < number
		if guess < number - 5
			message = 'Way too low!'
		else
			message = 'Too low!'
		end
	elsif guess == number
		message = 'You got it right!'
	end
	message
end
