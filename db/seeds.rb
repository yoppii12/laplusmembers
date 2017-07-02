# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/stock_datas.csv') do |row|
    Stock.create(:code => row[0], :bn => row[1], :sp=> row[2], :dbr => row[3], :tr => row[4], :tru => row[5], :nsh => row[6] )
end

CSV.foreach('db/test.csv') do |row|
    Stock.create(:code => row[0], :bn => row[1], :sp=> row[2], :dbr => row[3], :tr => row[4], :tru => row[5], :nsh => row[6] )
end