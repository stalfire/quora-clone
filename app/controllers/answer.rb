post '/new_answer' do
	answer = Answer.new(params[:answer])
	answer.user_id = session[:user_id]
	if session[:user_id]
		answer.save
		answer.to_json
		# erb :"question/testing"
	else
		redirect "/"
	end
	# redirect 'question_list'
end