require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

topics = {
            'Baptism' => 'John 3:5',
            'Footwashing' => 'John 13',
            'Holy Communion' => 'John 6:53',
            'Come to me, you who are weary' => 'Matthew 11:28',
            'All have sinned.' => 'Romans 3:23',
            'Salvation only in Jesus\'s name' => 'Acts 4:12',
        }

get '/' do
    @topics = topics
    erb :home
end

get '/random' do
    if rand(2) == 0
        arr = topics.keys
    else
        arr = topics.values
    end
    @text = arr[rand(arr.length)]
    erb :random
end

# 404 route (doesnt seem to work)
not_found do
    status 404
    'not found'
end