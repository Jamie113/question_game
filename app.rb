require './requires'
require 'sinatra'
require 'sinatra/cookies'
 
get '/frank-says' do
  'Put this in your pipe & smoke it!'
 end

 get '/' do
  erb :index
end

post '/' do 
  Player.create(params)
end 

get '/cookies_test' do 
  cookies[:test]="Hello"
end 
