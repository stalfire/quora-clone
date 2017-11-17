require 'byebug'
get '/' do
	session[:user_id] = nil
  erb :"static/index"
end
post '/signup' do
  user = User.new(params[:user])
  # user = User.new(name:params[:name],email:params[:email],password:params[:password],password_confimation:[:password_confimation])
  if user.save
    # what should happen if the user is saved?
    session[:user_id] = user.id
    redirect "users/#{user.id}"
  else
    # what should happen if the user keyed in invalid date?
    erb :"static/index"
  end
end  
post '/signin' do
	user = User.find_by(name:params[:name]).try(:authenticate, params[:password])
	if user
		session[:user_id] = user.id
		redirect "users/#{user.id}"
	else
		redirect "/"
	end	
end
get '/users/:id' do
	@all_questions = Question.all
	@questions_posted = @all_questions.where(user_id:[session[:user_id]])
	@votes = QuestionVote.all
	id = params[:id]
	@user = User.find(id)
	if session[:user_id] == @user.id
		erb :"users/profile"
	else
		redirect "/"
	end
end
get '/user_list' do
	@all_users = User.all.sort
	erb :"static/user_list"
end
get '/my_profile' do
	if session[:user_id]
		redirect "users/#{session[:user_id]}"
	else
		redirect "/"
	end
end


