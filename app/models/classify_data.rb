class ClassifyData < ApplicationRecord
  validates :data, :classification, presence: true
end