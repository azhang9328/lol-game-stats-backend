# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#manually added in from cdragon
#http://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/perks.json

stat_perks = [
    {"riot_id" => 5003,"name" => "MagicRes","shortDesc" => "+8 Magic Resist","longDesc" => "+8 Magic Resist", "rune_type" => "stat"},
    {"riot_id" => 5002,"name" => "Armor","shortDesc" => "+6 Armor","longDesc" => "+6 Armor", "rune_type" => "stat"},
    {"riot_id" => 5008,"name" => "Adaptive","shortDesc" =>  "+9 Ad or Ap","longDesc" =>  "+9 Ad or Ap", "rune_type" => "stat"},
    {"riot_id" => 5001,"name" => "HealthScaling","shortDesc" => "+15-90 Health (based on level)","longDesc" => "+15-90 Health (based on level)", "rune_type" => "stat"},
    {"riot_id" => 5007,"name" => "CDRScaling" ,"shortDesc" => "+CDR (based on level)","longDesc" => "+CDR (based on level)", "rune_type" => "stat"},
    {"riot_id" => 5005,"name" => "AttackSpeed","shortDesc" => "+10% Attack Speed","longDesc" => "+10% Attack Speed", "rune_type" => "stat"}
]

stat_perks.each do |stat|
    Rune.create(stat)
end

client = Lol::Client.new
client.dd_get(:champions)
client.dd_get(:items)
client.dd_get(:summoner_spells)
client.dd_get(:runes)