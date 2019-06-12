class Medication < ApplicationRecord
  has_many :patients, through: :patient_medications
end
