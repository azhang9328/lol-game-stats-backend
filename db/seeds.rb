# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

newgame = Game.create
newchamp = Champion.create
newplayer = Player.create
newgpc = Gpc.create(champion_id: newchamp.id, game_id: newgame.id, player_id: newplayer.id)