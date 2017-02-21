require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
require './model'
require 'json'

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

 p params, @login

  if @login && @login.password == params[:password]
   session[:user_id] = @login.id
   flash[:notice] = "You successfully logged in!"
 else
   flash[:notice] = "YOU ARE AN IMPOSTER"
   @login = nil
 end
 	if @login && @login.admin
 		redirect '/adminhome'
 	elsif @login == nil
 		redirect '/'
 	else
 		redirect '/profile'
end
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

post '/signupform' do
	redirect '/signup'
end

post '/cancelsignup' do
	redirect '/'
end

post '/canceledit' do
	redirect '/profile'
end

get '/profile' do
	@login = User.all
    @current_login = User.find(session[:user_id])
    p @current_login
erb :profile
end

post '/profile' do
	@current_login = session[:user_id] && User.find(session[:user_id])
	User.find(session[:user_id]).update(
		fname: params[:fname],
		lname: params[:lname],
		username: params[:username],
		password: params[:password],
		email: params[:email],
		phone: params[:phone]
		# picture: params[:picture]
		)
	redirect '/profile'
end

delete '/profile' do
	User.find(session[:user_id]).delete
 	session.destroy
 	flash[:notice] = "You have deleted your account"
	redirect '/'
end

##############################################
#feed
##############################################

get '/feed' do 
	@post = Post.last
	# @comment_post = Comments.last
	# + User.find(params[:username])
	 # .find(session[:user_id])
	# p @comment_post
	
	erb :feed
end

post '/feed' do 
	@current_login = session[:user_id] && User.find(session[:user_id])
	post = Post.create(
	topic: params[:topic],
	rob: params[:rob],

	james: params[:james],
	user_id: @current_login.id
	)

redirect '/feed'

end

post '/post/:id/comment' do
	@current_login = session[:user_id] && User.find(session[:user_id]) 
	p params 
	Comment.create(
		usr_comment: params[:usr_comment],
		post_id: params[:id],
		user_id: @current_login.id
	)
	# User.find(
	# 	username: params[:username]
	# 	)
	content_type :json
	{status: "ok"}.to_json
end

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Admin Only
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#############################################
#AdminHomepage
#############################################

#Need to define a <h1>/2 <textarea>S in the admin homepage
#for the H1 and author articles in feed that we choose everyday. 
#Need variables below to be referenced in MAIN.ERB, FEED.ERB, ADMIN.ERB. 
#Need new table that collects the H1 topic and Atricles and posts them.
get '/adminhome' do 
erb :admin_homepage

end


post '/adminhome' do 

erb :admin_homepage
redirect '/feed'
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
	password: params[:password],
	user_id: @current_login.id
	)

redirect '/login'
end
