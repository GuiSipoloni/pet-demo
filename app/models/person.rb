class Person < ApplicationRecord
  has_many :pet, dependent: :destroy, autosave: true

  validates_presence_of :name, :document, :birth_date

  def is_adult?
    birth_date >= 18.years.ago.to_date
  end
end
