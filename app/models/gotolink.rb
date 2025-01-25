class Gotolink < ApplicationRecord
  validates :title, :url, :slug, presence: true
  validates :slug, uniqueness: true
end
