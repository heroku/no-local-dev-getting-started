# app.rb

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './environments'
require 'cowsay'


get "/" do
  erb :home
end

get "/cowsay" do
  @character = "Cow"
  @message = "Hello"
  erb :'/cowsay/_cowsay'

  # '<pre>' + Cowsay.say("Hello", "Cow") +'</pre>'
end

get "/cowsay/all" do
  response = ""
  Cowsay.character_classes.each do |who|
    response += "<h4> #{who.to_s} </h4><hr>"
      response += '<pre>' + Cowsay.say("Hello", who.to_s) +'</pre>'
    end
    puts response
    response
end
get "/cowsay/random/:string" do
  '<pre>' + Cowsay.random_character.say(params[:string]) + '</pre>'
end
get "/cowsay/:character/:string" do
  '<pre>' + Cowsay.say(params[:string], params[:character]) +'</pre>'
end

class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
