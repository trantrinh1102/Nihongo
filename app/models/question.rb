class Question < ApplicationRecord
  belongs_to :test
  belongs_to :result

  has_many :answers

  accepts_nested_attributes_for :answers, allow_destroy: true

end
