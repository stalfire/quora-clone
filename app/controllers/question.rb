require 'byebug'
get '/question_list' do
	@all_questions = Question.all
	@all_answers = Answer.all
	erb :"questions/question"
end
post '/new_question' do
	question = Question.new(params[:question])
	question.user_id = session[:user_id]
	if question.save
		votes = QuestionVote.new(choice: 0, question_id:question.id, user_id:session[:user_id])
		votes.save
		question.to_json
	end
	# redirect 'question_list'
end

get '/testing' do
	@all_questions = Question.all
	@all_answers = Answer.all
	erb :"questions/testing"
end