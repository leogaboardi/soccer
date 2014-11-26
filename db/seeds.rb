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
    :email => "leogaboardi@example.com".downcase
    #:admin => true
  },
  {
    :username => "Batman",
    :email => "bruce_wayne@example.com".downcase
    #:admin => false
  },
  {
    :username => "John Doe",
    :email => "jdoe@example.com".downcase
    #:admin => false
  }
]

users.each do |new_user|
  user = User.new
  user.email = new_user[:email]
  user.username = new_user[:username]
  user.admin = new_user[:admin]
  user.save
end

teams = [
  {
    :name => "criciuma_sc",
    :label => "Criciúma",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00007sc.jpg"
  },
  {
    :name => "sport_pe",
    :label => "Sport",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00012pe.jpg"
  },
  {
    :name => "internacional_rs",
    :label => "Internacional",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00009rs.jpg"
  },
  {
    :name => "palmeiras_sp",
    :label => "Palmeiras",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00019sp.jpg"
  },
  {
    :name => "flamengo_rj",
    :label => "Flamengo",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00006rj.jpg"
  },
  {
    :name => "vitoria_ba",
    :label => "Vitória",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00006ba.jpg"
  },
  {
    :name => "santos_sp",
    :label => "Santos",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00018sp.jpg"
  },
  {
    :name => "botafogo_rj",
    :label => "Botafogo",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00005rj.jpg"
  },
  {
    :name => "chapecoense_sc",
    :label => "Chapecoense",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00002sc.jpg"
  },
  {
    :name => "cruzeiro_mg",
    :label => "Cruzeiro",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00006mg.jpg"
  },
  {
    :name => "fluminense_rj",
    :label => "Fluminense",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00009rj.jpg"
  },
  {
    :name => "corinthians_sp",
    :label => "Corinthians",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00021sp.jpg"
  },
  {
    :name => "sao_paulo_sp",
    :label => "São Paulo",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00017sp.jpg"
  },
  {
    :name => "figueirense_sc",
    :label => "Figueirense",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00010sc.jpg"
  },
  {
    :name => "atletico_pr",
    :label => "Atlético PR",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00004pr.jpg"
  },
  {
    :name => "goias_go",
    :label => "Goiás",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00009go.jpg"
  },
  {
    :name => "atletico_mg",
    :label => "Atlético MG",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00003mg.jpg"
  },
  {
    :name => "coritiba_pr",
    :label => "Coritiba",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00006pr.jpg"
  },
  {
    :name => "bahia_ba",
    :label => "Bahia",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00005ba.jpg"
  },
  {
    :name => "gremio_rs",
    :label => "Grêmio",
    :crest => "http://cdn.cbf.com.br/cbf/imagens/escudos/00008rs.jpg"
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
#  {
#    :tournament => "campeonato brasileiro"
    #:round => 1
    #:date => "11/25/2014"
    #:time => "4:00 pm"
   # :venue => "morumbi"
    #:home_team_id => "1"
    #:away_team_id => "2"
  #},
  #  {
  #  :tournament => "campeonato brasileiro"
    #:round => 1
    #:date => "11/25/2014"
    #:time => "4:00 pm"
 #   :venue => "maracanã"
    #:home_team_id => "3"
    #:away_team_id => "4"
    #:home_goal => "1"
    #:away_goal => "0"
    #:outcome => "1"
#  }
]

matches.each do |new_match|
  match = Match.new
  match.tournament = new_match[:tournament]
  match.round = new_match[:round]
  match.date = new_match[:date]
  match.time = new_match[:time]
  match.venue = new_match[:venue]
  match.home_team_id = new_match[:home_team_id]
  match.away_team_id = new_match[:away_team_id]
  match.home_goal = new_match[:home_goal]
  match.away_goal = new_match[:away_goal]
  match.outcome = new_match[:outcome]
  match.save
end
