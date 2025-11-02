class Album < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :release_year, numericality: { only_integer: true, greater_than: 1900 }, allow_nil: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :availability, inclusion: { in: [ true, false ] }

  before_validation :set_default_availability, on: :create

  private

  def set_default_availability
    self.availability = true if availability.nil?
  end
end
