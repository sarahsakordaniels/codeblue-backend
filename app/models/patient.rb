class Patient < ApplicationRecord
  belongs_to :user
  has_many :vitalsets
  has_many :medications, through: :patient_medications
  has_many :codes
end
