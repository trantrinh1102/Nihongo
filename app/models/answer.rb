class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :result

  scope :by_correct, ->{where is_correct: true}
end
