class AnswerResponse < ApplicationRecord
    validates :user_id, :answer_choice_id, presence: true
    validate :respondent_already_answered?, :respondent_author_of_poll?

    belongs_to :answer_choice,
        class_name: 'AnswerChoice',
        primary_key: :id,
        foreign_key: :answer_choice_id

    belongs_to :respondent,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :user_id
        
    has_one :response_question,
        through: :answer_choice,
        source: :question

    private
    def respondent_already_answered?
        if sibling_responses
            errors[:user_id] << "Respondent has already answered this question!"
        end
    end

    def sibling_responses
        response_question
            .question_responses
            .where.not('id = ?', self.id)
    end

    def respondent_author_of_poll?
        if response_question.question.poll.user_id == self.user_id
            errors[:user_id] << "Respondent is the author of this poll!"
        end
    end
end