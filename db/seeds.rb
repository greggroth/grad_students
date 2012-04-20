# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Funding.create(
  source: "PhD: Pre-Qualifier",
  amount: 20000
)

Funding.create(
  source: "PhD: Post-Qualifier",
  amount: 21000
)

Funding.create(
  source: "MS",
  amount: 1000
)
