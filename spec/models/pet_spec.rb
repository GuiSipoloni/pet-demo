require "rails_helper"

RSpec.describe Pet, type: :model do

  describe "create a new pet" do

    describe "validate if owner has more than 18 year to have a pet type andorinha" do
      let(:adult_person) { Person.create(name: 'Guilherme', document: '11122233344', brith_date: Date.parse("06/03/1994")) }
      let(:young_person) { Person.create(name: 'Guilherme', document: '11122233344', brith_date: Date.parse("06/03/2010")) }
      before do
        Pet.create(person: adult_person, type: 'andorinha')
        Pet.create(person: young_person, type: 'andorinha')
      end
      context "when owner has more than 18 year" do
        it { expect(adult_person.pet).to eq('andorinha') }
      end
      context "when owner has more less 18 year" do
        it { expect(young_person.pet.first).to be_nil }
      end
    end

    describe "validate if owner can have a cat" do
      let(:ariane) { Person.create(name: 'Ariane', document: '11122233344', brith_date: Date.parse("30/03/1996")) }
      let(:guilherme) { Person.create(name: 'Guilherme', document: '11122233344', brith_date: Date.parse("06/03/1994")) }
      before do
        Pet.create(person: ariane, type: 'gato')
        Pet.create(person: guilherme, type: 'gato')
      end
      context "when the owner has a name that doesn't start with 'A'" do
        it { expect(guilherme.pet.first.type).to eq('gato') }
      end
      context "when the owner has a name that starts with 'A'" do
        it { expect(ariane.pet.first).to be_nil }
      end
    end

  end
end