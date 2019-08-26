class Pet < ApplicationRecord
  belongs_to :person

  MAXIMUM_COST = 100000 #R$ 1000.00

  validate :is_owner_adult? if: :type_is? 'andorinha'
  validate :cant_owner_have_cat? if: :type_is? 'gato'
  validate :is_maximum_cost_per_person?

  private

  def is_owner_adult?
    self.errors.add(:person, 'Owner must have more than 18 year') if self.person.is_adult?
  end

  def cant_owner_have_cat?
    self.errors.add(:person, 'Owner must have more than 18 year') if self.person.name.first.upcase == 'A'
  end

  def is_maximum_cost_per_person?
    self.errors.add(:person, 'Owner reached the maximum cost') if self.person.pets.sum(:cost) == MAXIMUM_COST
  end

  def type_is?(type)
    self.type.downcase == type
  end
end
