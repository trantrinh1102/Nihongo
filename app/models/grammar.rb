class Grammar < ApplicationRecord
  belongs_to :lesson

  validates :title, :content, presence: true
end
