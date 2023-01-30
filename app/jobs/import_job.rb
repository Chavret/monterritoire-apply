require 'csv'

class ImportJob < ApplicationJob
  def self.perform_now(csv)
    CSV.foreach(csv, headers: true, col_sep: ";", encoding: Encoding::ISO_8859_1) do |row|
      ActiveRecord::Base.transaction do
        intercommunality = find_or_create_intercommunality(row["siren_epci"], row["nom_complet"], row["form_epci"])
        commune = find_or_create_commune( row["insee"], row["nom_com"], row["pop_total"], intercommunality)
      end
    end
  end

  private

  def self.find_or_create_intercommunality(siren_epci, nom_complet, form_epci)
    intercommunality = Intercommunality.create_with(name: nom_complet, form: form_epci.downcase.first(3))
                                       .find_or_create_by(siren: siren_epci)

    intercommunality
  end

  def self.find_or_create_commune(insee, nom_com, pop_total, intercommunality)
    commune = Commune.create_with(name: nom_com, population: pop_total, intercommunality: intercommunality)
                     .find_or_create_by(code_insee: insee)

    commune
  end
end