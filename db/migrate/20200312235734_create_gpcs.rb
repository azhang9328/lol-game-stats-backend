class CreateGpcs < ActiveRecord::Migration[6.0]
    def change
      create_table :gpcs do |t|
        t.references :champion, null: false, foreign_key: true
        t.references :game, null: false, foreign_key: true
        t.references :summoner, null: false, foreign_key: true
        t.integer :participantId
        t.string :team
        t.integer :longestTimeSpentLiving
        t.integer :kills
        t.integer :deaths
        t.integer :assists
        t.integer :largestKillingSpree
        t.integer :largestMultiKill
        t.integer :killingSprees
        t.integer :doubleKills
        t.integer :tripleKills
        t.integer :quadraKills
        t.integer :pentaKills
        t.integer :unrealKills
        t.integer :totalDamageDealt
        t.integer :magicDamageDealt
        t.integer :physicalDamageDealt
        t.integer :trueDamageDealt
        t.integer :largestCriticalStrike
        t.integer :totalDamageDealtToChampions
        t.integer :magicDamageDealtToChampions
        t.integer :physicalDamageDealtToChampions
        t.integer :trueDamageDealtToChampions
        t.integer :totalHeal
        t.integer :damageSelfMitigated
        t.integer :damageDealtToObjectives
        t.integer :damageDealtToTurrets
        t.integer :visionScore
        t.integer :totalDamageTaken
        t.integer :magicalDamageTaken
        t.integer :physicalDamageTaken
        t.integer :trueDamageTaken
        t.integer :goldEarned
        t.integer :goldSpent
        t.integer :turretKills
        t.integer :inhibitorKills
        t.integer :totalMinionsKilled
        t.integer :neutralMinionsKilled
        t.integer :neutralMinionsKilledTeamJungle
        t.integer :neutralMinionsKilledEnemyJungle
        t.integer :champLevel
        t.integer :visionWardsBoughtInGame
        t.integer :sightWardsBoughtInGame
        t.integer :wardsPlaced
        t.integer :wardsKilled
        t.boolean :firstBloodKill
        t.boolean :firstBloodAssist
        t.boolean :firstTowerKill
        t.boolean :firstTowerAssist
        t.string :lane
        t.string :role

        t.timestamps
      end
    end
  end
  