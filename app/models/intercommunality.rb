class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, presence: true
  validates :siren, presence: true, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :form, inclusion: { in: %w(ca cu cc met) }

  before_save :generate_slug

  def communes_hash
    communes.pluck(:code_insee, :name).to_h
  end

  def generate_slug
    self.slug ||= name&.parameterize
  end

  def population
    communes.sum(:population)
  end
end