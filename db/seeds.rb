# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {
    :username => "Leonardo",
    :email => "leonardo@example.com".downcase,
    :admin => true,
  },
  {
    :username => "Batman",
    :email => "bruce_wayne@example.com".downcase,
    :admin => true
  },
    {
    :username => "Robin",
    :email => "robin@example.com".downcase,
    :admin => false
  },
    {
    :username => "Joker",
    :email => "joker@example.com".downcase,
    :admin => false
  },
    {
    :username => "Gordon",
    :email => "gordon@example.com".downcase,
    :admin => false
  },
    {
    :username => "Penguin",
    :email => "penguin@example.com".downcase,
    :admin => false
  },
    {
    :username => "Riddler",
    :email => "riddler@example.com".downcase,
    :admin => false
  },
  {
    :username => "2 Faces",
    :email => "2faces@example.com".downcase,
    :admin => false
  },
  {
    :username => "Poison Ivy",
    :email => "poisonivy@example.com".downcase,
    :admin => false
  },
  {
    :username => "John Doe",
    :email => "jdoe@example.com".downcase,
    :admin => false
  }
]

users.each do |new_user|
  user = User.new
  user.email = new_user[:email]
  user.username = new_user[:username]
  user.admin = new_user[:admin]
  user.password = "password"
  user.password_confirmation = "password"

  user.save
end

teams = [
  {
    :name => "criciuma_sc",
    :label => "Criciúma",
    :crest => "assets/crests/criciuma_sc.jpg"
  },
  {
    :name => "sport_pe",
    :label => "Sport",
    :crest => "assets/crests/sport_pe.jpg"
  },
  {
    :name => "internacional_rs",
    :label => "Internacional",
    :crest => "assets/crests/internacional_rs.jpg"
  },
  {
    :name => "palmeiras_sp",
    :label => "Palmeiras",
    :crest => "assets/crests/palmeiras_sp.jpg"
  },
  {
    :name => "flamengo_rj",
    :label => "Flamengo",
    :crest => "assets/crests/flamengo_rj.jpg"
  },
  {
    :name => "vitoria_ba",
    :label => "Vitória",
    :crest => "assets/crests/vitoria_ba.jpg"
  },
  {
    :name => "santos_sp",
    :label => "Santos",
    :crest => "assets/crests/santos_sp.jpg"
  },
  {
    :name => "botafogo_rj",
    :label => "Botafogo",
    :crest => "assets/crests/botafogo_rj.jpg"
  },
  {
    :name => "chapecoense_sc",
    :label => "Chapecoense",
    :crest => "assets/crests/chapecoense_sc.jpg"
  },
  {
    :name => "cruzeiro_mg",
    :label => "Cruzeiro",
    :crest => "assets/crests/cruzeiro_mg.jpg"
  },
  {
    :name => "fluminense_rj",
    :label => "Fluminense",
    :crest => "assets/crests/fluminense_rj.jpg"
  },
  {
    :name => "corinthians_sp",
    :label => "Corinthians",
    :crest => "assets/crests/corinthians_sp.jpg"
  },
  {
    :name => "sao_paulo_sp",
    :label => "São Paulo",
    :crest => "assets/crests/sao_paulo_sp.jpg"
  },
  {
    :name => "figueirense_sc",
    :label => "Figueirense",
    :crest => "assets/crests/figueirense_sc.jpg"
  },
  {
    :name => "atletico_pr",
    :label => "Atlético PR",
    :crest => "assets/crests/atletico_pr.jpg"
  },
  {
    :name => "goias_go",
    :label => "Goiás",
    :crest => "assets/crests/goias_go.jpg"
  },
  {
    :name => "atletico_mg",
    :label => "Atlético MG",
    :crest => "assets/crests/atletico_mg.jpg"
  },
  {
    :name => "coritiba_pr",
    :label => "Coritiba",
    :crest => "assets/crests/coritiba_pr.jpg"
  },
  {
    :name => "bahia_ba",
    :label => "Bahia",
    :crest => "assets/crests/bahia_ba.jpg"
  },
  {
    :name => "gremio_rs",
    :label => "Grêmio",
    :crest => "assets/crests/gremio_rs.jpg"
  }
]

teams.each do |new_team|
  team = Team.new
  team.name = new_team[:name]
  team.label = new_team[:label]
  team.crest = new_team[:crest]
  team.save
end

matches = [
  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-29",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Heriberto Hulse",
    :home_team_id => 1,
    :away_team_id => 2,
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-29",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Beira-Rio",
    :home_team_id => "3",
    :away_team_id => "4",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-29",
    :match_at => "2000-01-01 21:00:00",
    :venue => "Arena da Amazônia",
    :home_team_id => "5",
    :away_team_id => "6",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Vila Belmiro",
    :home_team_id => "7",
    :away_team_id => "8",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Arena Condá",
    :home_team_id => "9",
    :away_team_id => "10",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Maracanã",
    :home_team_id => "11",
    :away_team_id => "12",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Morumbi",
    :home_team_id => "13",
    :away_team_id => "14",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Arena da Baixada",
    :home_team_id => "15",
    :away_team_id => "16",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Independência",
    :home_team_id => "17",
    :away_team_id => "18",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Fonte Nova",
    :home_team_id => "19",
    :away_team_id => "20",
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-22",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Beira Rio",
    :home_team_id => "3",
    :away_team_id => "17",
    :home_goal => 2,
    :away_goal => 1,
    :outcome => 1,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-22",
    :match_at => "2000-01-01 21:00:00",
    :venue => "Fonte Nova",
    :home_team_id => "19",
    :away_team_id => "15",
    :home_goal => 1,
    :away_goal => 2,
    :outcome => -1,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Castelão/MA",
    :home_team_id => 5,
    :away_team_id => 1,
    :home_goal => 1,
    :away_goal => 1,
    :outcome => 0,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Arena Pantanal",
    :home_team_id => 7,
    :away_team_id => 13,
    :home_goal => 0,
    :away_goal => 1,
    :outcome => -1,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Arena Pernambuco",
    :home_team_id => 2,
    :away_team_id => 11,
    :home_goal => 2,
    :away_goal => 2,
    :outcome => 0,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Orlando Scarpelli",
    :home_team_id => 14,
    :away_team_id => 6,
    :home_goal => 2,
    :away_goal => 0,
    :outcome => 1,
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 17:00:00",
    :venue => "Mineirão",
    :home_team_id => 10,
    :away_team_id => 16,
    :home_goal => 2,
    :away_goal => 1,
    :outcome => 1,
    :user_id => 2
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Arena Condá",
    :home_team_id => 9,
    :away_team_id => 8,
    :home_goal => 2,
    :away_goal => 0,
    :outcome => 1,
    :user_id => 2
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Arena Corinthians",
    :home_team_id => 12,
    :away_team_id => 20,
    :home_goal => 1,
    :away_goal => 0,
    :outcome => 1,
    :user_id => 2
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-23",
    :match_at => "2000-01-01 19:30:00",
    :venue => "Couto Pereira",
    :home_team_id => 18,
    :away_team_id => 4,
    :home_goal => 2,
    :away_goal => 0,
    :outcome => 1,
    :user_id => 1
  }

]

matches.each do |new_match|
  match = Match.new
  match.tournament = new_match[:tournament]
  match.round = new_match[:round]
  match.match_on = new_match[:match_on]
  match.match_at = new_match[:match_at]
  match.venue = new_match[:venue]
  match.home_team_id = new_match[:home_team_id]
  match.away_team_id = new_match[:away_team_id]
  match.home_goal = new_match[:home_goal]
  match.away_goal = new_match[:away_goal]
  match.outcome = new_match[:outcome]
  match.user_id = new_match[:user_id]
  match.label =  match.home_team.label +  " x " + match.away_team.label
  match.save
end

bets = [
  {:match_id => 12,  :user_id => 1, :bet => 0},
  {:match_id => 12,  :user_id => 2, :bet => 1},
  {:match_id => 12,  :user_id => 3, :bet => 1},
  {:match_id => 12,  :user_id => 4, :bet => 1},
  {:match_id => 12,  :user_id => 5, :bet => 0},
  {:match_id => 12,  :user_id => 6, :bet => 0},
  {:match_id => 12,  :user_id => 7, :bet => -1},
  {:match_id => 12,  :user_id => 8, :bet => -1},
  {:match_id => 12,  :user_id => 9, :bet => 1},
  {:match_id => 12,  :user_id => 10, :bet => 0},
  {:match_id => 13,  :user_id => 1, :bet => 1},
  {:match_id => 13,  :user_id => 2, :bet => 1},
  {:match_id => 13,  :user_id => 3, :bet => 1},
  {:match_id => 13,  :user_id => 4, :bet => 1},
  {:match_id => 13,  :user_id => 5, :bet => 1},
  {:match_id => 13,  :user_id => 6, :bet => 1},
  {:match_id => 13,  :user_id => 7, :bet => 1},
  {:match_id => 13,  :user_id => 8, :bet => 1},
  {:match_id => 13,  :user_id => 9, :bet => 1},
  {:match_id => 13,  :user_id => 10, :bet => 1},
  {:match_id => 1,  :user_id => 1, :bet => 0},
  {:match_id => 1,  :user_id => 2, :bet => 0},
  {:match_id => 1,  :user_id => 3, :bet => -1},
  {:match_id => 1,  :user_id => 4, :bet => -1},
  {:match_id => 1,  :user_id => 5, :bet => -1},
  {:match_id => 1,  :user_id => 6, :bet => 1},
  {:match_id => 1,  :user_id => 7, :bet => 0},
  {:match_id => 2,  :user_id => 1, :bet => 1},
  {:match_id => 2,  :user_id => 2, :bet => 1},
  {:match_id => 2,  :user_id => 3, :bet => 1},
  {:match_id => 2,  :user_id => 4, :bet => 0},
  {:match_id => 2,  :user_id => 5, :bet => -1},
  {:match_id => 2,  :user_id => 6, :bet => -1},
  {:match_id => 2,  :user_id => 7, :bet => 1}
]

bets.each do |new_bet|
  bet = Bet.new
  bet.user_id = new_bet[:user_id]
  bet.match_id = new_bet[:match_id]
  bet.bet = new_bet[:bet]
  bet.save
end
