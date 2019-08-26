class Pet < ApplicationRecord
  belongs_to :person

  validate :is_owner_adult? if self.type.downcase == 'andorinha'


  private

  def is_owner_adult?
    self.errors.add(:person, 'Owner must have more than 18 year') if self.person.is_adult?
  end
end
