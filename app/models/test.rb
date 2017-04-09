class Test < ApplicationRecord
  belongs_to :lesson_test

  has_many :results
end
