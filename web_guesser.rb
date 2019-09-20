require 'sinatra'
require 'sinatra/reloader'

number = rand(100) + 1

get '/' do
	message = check_guess(params['guess'].to_i, number)
	erb :index, :locals => {:number => number, :message => message}
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
