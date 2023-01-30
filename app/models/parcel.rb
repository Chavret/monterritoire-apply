class Parcel < ApplicationRecord
  NUMBER_REGEXP = /\A(?<prefix>\d{3})?\s*(?<section>[A-Z]{1,2})\s*(?<plan>\d{1,4})\z|\A(?<prefix>\d{3})?\s*(?<section>\d{2})\s*(?<plan>\d{4})\z|\A(?<prefix>\d{3})?\s*0{1}(?<section>[A-Z]{1})\s*(?<plan>\d{1,4})\z/
end