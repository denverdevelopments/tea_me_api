# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'

Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

@client1 = FactoryBot.create :customer
@client2 = FactoryBot.create :customer
@client3 = FactoryBot.create :customer

@brew1 = FactoryBot.create :tea
@brew2 = FactoryBot.create :tea
@brew3 = FactoryBot.create :tea
@brew4 = FactoryBot.create :tea
@brew5 = FactoryBot.create :tea

@sub1 = FactoryBot.create(:subscription, customer: @client1, tea: @brew1)
@sub2 = FactoryBot.create(:subscription, customer: @client1, tea: @brew3)
@sub3 = FactoryBot.create(:subscription, customer: @client1, tea: @brew5)
@sub4 = FactoryBot.create(:subscription, customer: @client2, tea: @brew2)
@sub5 = FactoryBot.create(:subscription, customer: @client2, tea: @brew4)
@sub6 = FactoryBot.create(:subscription, customer: @client3, tea: @brew3)

# @activity2 = FactoryBot.create(:activity, project: @project1, status: "current")
