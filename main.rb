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
 @login = User.where("username = '#{params[:username]}'").first

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

get '/signup' do
	@user = User.all
	erb :signup
end

post '/signup' do
	User.create(
		fname: params[:fname],
		lname: params[:lname],
		username: params[:username],
		password: params[:password]
		)
	redirect '/'
end

get '/profile' do
	@login = User.all
    @current_login = session[:user_id] && User.find(session[:user_id])
    p @current_login
erb :profile
end


###################################################
#User Infor Storage
##################################################

get '/database' do 

	@users = User.all
	erb :database
end 


post '/database' do 

User.create(
	fname: params[:fname],
	lname: params[:lname],
	username: params[:username],
	password: params[:password]
)
redirect '/login'
end


