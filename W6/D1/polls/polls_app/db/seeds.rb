# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
AnswerResponse.destroy_all

alan = User.create( username: 'Alan' )

climb_poll = Poll.create( title: 'Climbing Poll', user_id: alan.id )
climb_q1 = Question.create( body: 'Have you ever climbed before?', poll_id: climb_poll.id )
climb_q1ac1 = AnswerChoice.create( choice: 'Yes', question_id: climb_q1.id )
climb_q1ac2 = AnswerChoice.create( choice: 'No', question_id: climb_q1.id )
climb_q2 = Question.create( body: 'Does climbing interest you?', poll_id: climb_poll.id )
climb_q2ac1 = AnswerChoice.create( choice: 'Yes', question_id: climb_q2.id )
climb_q2ac2 = AnswerChoice.create( choice: 'No', question_id: climb_q2.id )

alan_q1 = AnswerResponse.create( user_id: alan.id, answer_choice_id: climb_q1ac1.id )
alan_q2 = AnswerResponse.create( user_id: alan.id, answer_choice_id: climb_q2ac1.id )

walker = User.create( username: 'Walker' )
walker_q1 = AnswerResponse.create( user_id: walker.id, answer_choice_id: climb_q1ac2.id )
walker_q2 = AnswerResponse.create( user_id: walker.id, answer_choice_id: climb_q2ac1.id )

michelle = User.create( username: 'Michelle' )
michelle_q1 = AnswerResponse.create( user_id: michelle.id, answer_choice_id: climb_q1ac2.id )
michelle_q2 = AnswerResponse.create( user_id: michelle.id, answer_choice_id: climb_q2ac2.id )

mike = User.create( username: 'Mike' )
mike_q1 = AnswerResponse.create( user_id: mike.id, answer_choice_id: climb_q1ac2.id )
mike_q2 = AnswerResponse.create( user_id: mike.id, answer_choice_id: climb_q2ac2.id )

vanessa = User.create( username: 'Vanessa' )
vanessa_q1 = AnswerResponse.create( user_id: vanessa.id, answer_choice_id: climb_q1ac1.id )
vanessa_q2 = AnswerResponse.create( user_id: vanessa.id, answer_choice_id: climb_q2ac1.id )