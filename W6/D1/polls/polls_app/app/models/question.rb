class Question < ApplicationRecord
    validates :body, presence: true, uniqueness: true

    belongs_to :poll,
        class_name: 'Poll',
        primary_key: :id,
        foreign_key: :poll_id

    has_many :answer_choices,
        class_name: 'AnswerChoice',
        primary_key: :id,
        foreign_key: :question_id

    has_many :question_responses,
        through: :answer_choices,
        source: :responses
    
    def results
        responses_count = self.answer_choices
            .select('answer_choices.choice', 'COUNT(*) as num_responses')
            .left_outer_joins(:responses)
            .group('answer_choices.choice')
        choice_counts = {}
        responses_count.each do |response_count|
            choice_counts[response_count.choice] = response_count.num_responses
        end
        choice_counts
    end
end