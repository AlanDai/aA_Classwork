class AnswerChoice < ApplicationRecord
    validates :question_id, presence: true, uniqueness: true
    validates :choice, presence: true

    belongs_to :question,
        class_name: 'Question',
        primary_key: :id,
        foreign_key: :question_id

    has_many :responses,
        class_name: 'AnswerResponse',
        primary_key: :id,
        foreign_key: :answer_choice_id
end