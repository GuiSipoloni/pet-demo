class Person < ApplicationRecord
  has_many :pet, dependent: :destroy, autosave: true

  validates_presence_of :name, :document, :brith_date

  def is_adult?
    brith_date >= 18.years.ago.to_d
  end
end
