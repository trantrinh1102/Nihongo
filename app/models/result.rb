class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test

  has_many :question
  has_many :answer
end
