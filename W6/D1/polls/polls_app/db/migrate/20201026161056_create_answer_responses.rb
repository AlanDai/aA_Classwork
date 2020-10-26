class CreateAnswerResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_responses do |t|
      t.integer :user_id, null:false
      t.integer :answer_choice_id, null:false
    end
    add_index :answer_responses, %i(user_id answer_choice_id), unique:true
  end
end
