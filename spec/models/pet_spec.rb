require "rails_helper"

RSpec.describe Pet, type: :model do

  describe "create a new pet" do

    describe "validate if owner has more than 18 year to have a pet type andorinha" do
      let(:adult_person) { Person.create(name: 'Guilherme', document: '11122233344', birth_date: Date.parse("06/03/1994")) }
      let(:young_person) { Person.create(name: 'Guilherme', document: '11122233344', birth_date: Date.parse("06/03/2010")) }
      before do
        Pet.create(person: adult_person, pet_type: 'andorinha')
        Pet.create(person: young_person, pet_type: 'andorinha')
      end
      context "when owner has more than 18 year" do
        it { expect(adult_person.pet.first.pet_type).to eq('andorinha') }
      end
      context "when owner has more less 18 year" do
        it { expect(young_person.pet.first).to be_nil }
      end
    end

    describe "validate if owner can have a cat" do
      let(:ariane) { Person.create(name: 'Ariane', document: '11122233344', birth_date: Date.parse("30/03/1996")) }
      let(:guilherme) { Person.create(name: 'Guilherme', document: '11122233344', birth_date: Date.parse("06/03/1994")) }
      before do
        Pet.create(person: ariane, pet_type: 'gato')
        Pet.create(person: guilherme, pet_type: 'gato')
      end
      context "when the owner has a name that doesn't start with 'A'" do
        it { expect(guilherme.pet.first.pet_type).to eq('gato') }
      end
      context "when the owner has a name that starts with 'A'" do
        it { expect(ariane.pet.first).to be_nil }
      end
    end

    describe "validate if owner heached the maximum cost" do
      let(:guilherme) { Person.create(name: 'Guilherme', document: '11122233344', birth_date: Date.parse("06/03/1994")) }
      before do
        (1..6).each do |i|
          Pet.create(person: guilherme, pet_type: 'cachorro', cost: 200_00)
        end
      end
      context "owner must have only 5 dogs" do
        it { expect(guilherme.pet.count).to eq(5) }
      end
    end

  end

  describe 'Questions' do
    context 'Qual é o custo médio dos animais do tipo cachorro?' do
      it{ puts (Pet.by_pet_type('cachorro').average(:cost)/100).to_money.format }
    end

    context 'Quantos cachorros existem no sistema?' do
      it{ puts Pet.by_pet_type('cachorro').count }
    end

    context 'Qual o nome dos donos dos cachorros' do
      it{ puts Pet.by_pet_type("cachorro").includes(:person).pluck('people.name') }
    end

    context 'Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)' do
      it do
        puts Person.
                joins(:pet).
                group("pets.person_id, people.name").
                select("sum(cost) as cost, people.name").
                order("cost DESC").
                map{|r| "Nome: #{r.name} - Custo mensal: #{((r.cost) /100).to_money.format}" }
      end
    end

    context 'Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?' do
      it do
        puts Person.
              joins(:pet).
              group("pets.person_id, people.name").
              select("sum(cost) as cost, people.name").
              map{|r| "Nome: #{r.name} - Custo em 3 meses: #{((r.cost * 3) /100).to_money.format}" }
      end
    end
  end
end