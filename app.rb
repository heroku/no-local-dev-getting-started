# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Contact < ActiveRecord::Base
  self.table_name = 'connect.contact'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end

get "/create" do
  CREATE_URL = 'https://connect.heroku.com/dashboard-next/create-connection'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  if match && match[1]
    redirect to(CREATE_URL + "?create=" + match[1])
  else
    redirect to(CREATE_URL)
  end
end

