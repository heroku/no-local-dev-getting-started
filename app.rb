# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end

class Contact < ActiveRecord::Base
 self.table_name = 'salesforce.account'
end
# Start - Added by Deep
#class Account < ActiveRecord::Base
 # self.table_name = 'salesforce.account'
#end
# end - Added by Deep

#get "/contacts" do
#  @contacts = Contact.all
#  erb :index
#end
get "/contacts" do
 @contacts = Contact.all
  erb :index
end
# Start - Added by Deep
#get "/accts" do
  #@accts = Account.all
  #erb :index
#end
# End - Added by Deep


get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
