class Answer < ApplicationRecord
  validates :answer, presence: true, length: {maximum: 5}
  belongs_to :user
  belongs_to :question
end
