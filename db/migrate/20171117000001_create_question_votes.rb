class CreateQuestionVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :question_votes do |t|
			t.integer :choice
			t.references :user, foreign_key: true
			t.references :question, foreign_key: true
		end
	end
end
