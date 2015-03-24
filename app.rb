# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class Contact < ActiveRecord::Base
end


get "/" do
  @contacts = Contact.all
  erb :"index"
end

get "/create" do
  CREATE_URL = 'https://connect.heroku.com/dashboard-next/create-connection?create='
  match = /(.*?)\.herokuapp\.com/.match(x)
  if match[1]
    redirect to(CREATE_URL + app_name)
  else
    redirect to(CREATE_URL)
end

