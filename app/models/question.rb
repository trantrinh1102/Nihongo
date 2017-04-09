class Question < ApplicationRecord
  belongs_to :test
  belongs_to :result

  has_many :answers
end
