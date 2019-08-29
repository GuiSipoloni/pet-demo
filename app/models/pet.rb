class Pet < ApplicationRecord
  belongs_to :person

  MAXIMUM_COST = 1000_00

  validate :is_owner_adult?, if: -> { self.pet_type.downcase == 'andorinha' }
  validate :cant_owner_have_cat?, if: -> { self.pet_type.downcase == 'gato' }
  validate :is_maximum_cost_per_person?

  scope :by_pet_type, -> (type) { where(pet_type: type) }


  private

  def is_owner_adult?
    self.errors.add(:person, 'Owner must have more than 18 year') if self.person.is_adult?
  end

  def cant_owner_have_cat?
    self.errors.add(:person, 'Owner must have more than 18 year') if self.person.name.first.upcase == 'A'
  end

  def is_maximum_cost_per_person?
    self.errors.add(:person, 'Owner reached the maximum cost') if self.person.pet.sum(:cost) == MAXIMUM_COST
  end

end
