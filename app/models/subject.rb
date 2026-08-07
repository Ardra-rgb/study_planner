class Subject < ApplicationRecord
  has_many :tasks, dependent: :destroy
end