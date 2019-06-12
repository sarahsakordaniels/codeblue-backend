class Code < ApplicationRecord
  belongs_to :patient
  has_many :codemedications
  has_many :shocks
  has_many :rhythms
end
