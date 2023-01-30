class Commune < ApplicationRecord
  belongs_to :intercommunality, optional: true
  has_many :street_communes
  has_many :streets, through: :street_communes

  validates :name, presence: true
  validates :code_insee, presence: true, length: { minimum: 5 }
end