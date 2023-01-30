class Commune < ApplicationRecord
  require 'csv'

  belongs_to :intercommunality, optional: true
  has_many :street_communes
  has_many :streets, through: :street_communes

  validates :name, presence: true
  validates :code_insee, presence: true, length: { minimum: 5 }

  scope :search, -> name { where("lower(name) ILIKE ?", "%#{sanitize_sql_like(name.downcase)}%") }
  scope :to_hash, -> { pluck(:code_insee, :name).to_h }

  def self.to_csv
    attributes = %w{code_insee name}
    
    CSV.generate(headers: true,  col_sep: ";") do |csv|
      csv << attributes

      all.find_each do |commune|
        csv << attributes.map{ |attr| commune.send(attr) }
      end
    end
  end
end