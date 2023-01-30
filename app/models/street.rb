class Street < ApplicationRecord
  has_many :street_communes
  has_many :communes, through: :street_communes

  validates :title, presence: true
  validates :from, numericality: { only_integer: true }, allow_nil: true
  validates :to, numericality: { only_integer: true }, allow_nil: true, comparison: { greater_than: :from }
end