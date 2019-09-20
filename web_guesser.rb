require 'sinatra'
require 'sinatra/reloader'

get '/' do
	"The secret number is #{ @@number }"
end

@@number = rand(100) + 1