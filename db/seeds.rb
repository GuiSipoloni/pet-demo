# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.create([
  { name: "Johnny Cash", document: "555555555", birth_date: Date.parse("26/02/1932") },
  { name: "Sid Vicious", document: "555555555", birth_date: Date.parse("10/05/1957") },
  { name: "Axl Rose", document: "555555555", birth_date: Date.parse("06/02/1962") },
  { name: "Joey Ramone", document: "555555555", birth_date: Date.parse("19/05/1951") },
  { name: "Bruce Dickinson", document: "555555555", birth_date: Date.parse("07/08/1958")},
  { name: "Kurt Cobain", document: "555555555", birth_date: Date.parse("20/02/1967") },
  { name: "Elvis Presley", document: "555555555", birth_date: Date.parse("17/08/2008") }
])
Pet.create([
  { name: "Pé de Pano", cost: 199_99, pet_type: "Cavalo", person: Person.find_by_name("Johnny Cash") },
  { name: "Rex", cost: 99_99, pet_type: "Cachorro", person: Person.find_by_name("Sid Vicious") },
  { name: "Ajudante do Papai Noel", cost: 9999, pet_type: "Cachorro", person: Person.find_by_name("Axl Rose") },
  { name: "Rex", cost: 103_99, pet_type: "Papagaio", person: Person.find_by_name("Joey Ramone") },
  { name: "Flora", cost: 103_99, pet_type: "Lhama", person: Person.find_by_name("Bruce Dickinson") },
  { name: "Dino", cost: 177_99, pet_type: "Iguana", person: Person.find_by_name("Kurt Cobain") },
  { name: "Lassie", cost: 407_99, pet_type: "Ornitorrinco", person: Person.find_by_name("Elvis Presley")}
])
