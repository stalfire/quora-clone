get '/question_list' do
	@all_questions = Question.all
	@all_answers = Answer.all
	erb :"questions/question"
end
post '/new_question' do
	question = Question.new(params[:question])
	question.user_id = session[:user_id]
	question.save
	question.to_json
	# redirect 'question_list'
end

get '/testing' do
	@all_questions = Question.all
	@all_answers = Answer.all
	erb :"questions/testing"
end