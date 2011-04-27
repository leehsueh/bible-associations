require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

questions = {
    'True or False: Israel sinned by asking for a king.' => 'True',
}

get '/' do
    @topics = questions
    erb :home
end

get '/random' do
    arr = questions.keys
    @text = arr[rand(arr.length)]
    @answer = questions[@text]
    erb :random
end

# 404 route (doesnt seem to work)
not_found do
    status 404
    'not found'
end