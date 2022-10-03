# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#
CodeError.create!(name:'set_brand', description:"Couldn't find Brand with id", value: 10001, status: true)
CodeError.create!(name:'set_model', description:"Couldn't find Model with id", value: 20001, status: true)
file = File.read('./models.json')
response = ImportData.build(JSON.parse(file))
