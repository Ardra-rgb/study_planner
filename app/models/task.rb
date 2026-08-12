class Task < ApplicationRecord
  belongs_to :subject
  has_one_attached :study_pdf
end