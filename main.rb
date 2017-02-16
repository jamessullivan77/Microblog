require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
require './model'

set :database, "sqlite3:whatever.db"
enable :sessions 


get '/' do
 @login = User.all
 @current_login = session[:user_id] && User.find(session[:user_id])
 p @current_login
 erb :index
end

get '/logout' do
 session.destroy
 flash[:notice] = "You are now logged out"
 redirect '/'
end

post '/login' do
 @login = User.where("username = '#{params[:user]}'").first

 p params

 if @login && @login.password == params[:password]
  # "WELCOME #{@user.fname}!"
   session[:user_id] = @login.id
   flash[:notice] = "You successfully logged in!"
 else
   flash[:notice] = "YOU ARE AN IMPOSTER"
 end
 redirect '/'
end