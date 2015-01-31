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
  },
  {
    :name => "bangu_rj",
    :label => "Bangu",
    :crest => "assets/crests/bangu_rj.png"
  },
    {
    :name => "barra_mansa_rj",
    :label => "Barra Mansa"
  },
    {
    :name => "boavista_rj",
    :label => "Boavista",
    :crest => "assets/crests/boavista_rj.gif"
  },
    {
    :name => "bonsucesso_rj",
    :label => "Bonsucesso"
  },
    {
    :name => "cabofriense_rj",
    :label => "Cabofriense"
  },
    {
    :name => "friburguense_rj",
    :label => "friburguense"
  },
    {
    :name => "macae_rj",
    :label => "Macaé"
  },
    {
    :name => "madureira_rj",
    :label => "Madureira"
  },
    {
    :name => "nova_iguacu_rj",
    :label => "Nova Iguaçu"
  },
    {
    :name => "resende_rj",
    :label => "Resende"
  },
  {
    :name => "tigres_rj",
    :label => "Tigres-RJ"
  },
      {
    :name => "volta_redonda_rj",
    :label => "Volta Redonda"
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
    :venue_id => 12,
    :home_team_id => 1,
    :away_team_id => 2,
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-29",
    :match_at => "2000-01-01 19:30:00",
    :venue_id => 13,
    :home_team_id => "3",
    :away_team_id => "4",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-29",
    :match_at => "2000-01-01 21:00:00",
    :venue_id => 14,
    :home_team_id => "5",
    :away_team_id => "6",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue_id => 15,
    :home_team_id => "7",
    :away_team_id => "8",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue_id => 16,
    :home_team_id => "9",
    :away_team_id => "10",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue_id => 1,
    :home_team_id => "11",
    :away_team_id => "12",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 17:00:00",
    :venue_id => 17,
    :home_team_id => "13",
    :away_team_id => "14",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue_id => 19,
    :home_team_id => "15",
    :away_team_id => "16",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue_id => 19,
    :home_team_id => "17",
    :away_team_id => "18",
    :user_id => 1
  },

  {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 37,
    :match_on => "2014-11-30",
    :match_at => "2000-01-01 19:30:00",
    :venue_id => 20,
    :home_team_id => "19",
    :away_team_id => "20",
    :user_id => 1
  },
    {
    :tournament => "Campeonato Brasileiro - Série A",
    :round => 36,
    :match_on => "2014-11-22",
    :match_at => "2000-01-01 19:30:00",
    :venue_id => 14,
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
    :venue_id => 1,
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
    :venue_id => 1,
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
    :venue_id => 1,
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
    :venue_id => 10,
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
    :venue_id => 3,
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
    :venue_id => 7,
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
    :venue_id => 16,
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
    :venue_id => 3,
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
    :venue_id => 12,
    :home_team_id => 18,
    :away_team_id => 4,
    :home_goal => 2,
    :away_goal => 0,
    :outcome => 1,
    :user_id => 1
  },
  {
    :tournament => "Campeonato Carioca",
    :round => 1,
    :match_on => "2015-02-01",
    :match_at => "2000-01-01 17:00:00",
    :venue_id => 12,
    :home_team_id => 8,
    :away_team_id => 23,
    :user_id => 1
  }


]

matches.each do |new_match|
  match = Match.new
  match.tournament = new_match[:tournament]
  match.round = new_match[:round]
  match.match_on = new_match[:match_on]
  match.match_at = new_match[:match_at]
  match.venue_id = new_match[:venue_id]
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

venues = [
  {
      :name => "maracana_rj",
      :label => "Maracanã (RJ)",
      :address => " Avenida Presidente Castelo Branco, s/n - Portão 2 - Maracanã, Rio de Janeiro - RJ, 20271-130, Brazil",
      :picture_url => "http://upload.wikimedia.org/wikipedia/commons/3/36/Maracan%C3%A3_Stadium_in_Rio_de_Janeiro.jpg",
      :capacity =>78838
  },
  {
      :name => "arena_corinthians_sp",
      :label => "Arena Corinthians (SP)",
      :address => "Avenida Miguel Ignácio Curi, 111 - Vila Carmosina, São Paulo - SP, 08295-005, Brazil",
      :picture_url => "http://imguol.com/c/esporte/2014/05/08/080514---vista-aerea-do-itaquerao-nesta-quinta-feira-data-da-visita-de-dilma-rousseff-ao-estadio-1399570844978_1920x1080.jpg",
      :capacity => 61606
  },
  {
      :name => "orlando_scarpelli_sc",
      :label => "Orlando Scarpelli (SC)",
      :address => "Rua Humaitá, 194 – Estreito, Florianópolis - SC, 88070-730, Brazil",
      :picture_url => "http://www.rio2016.com/pregamestraining/sites/default/files/imagecache/620x460/Est%C3%A1dio%20a%C3%A9rea_0.JPG",
      :capacity => 19908
  },
  {
      :name => "arena_gremio_rs",
      :label => "Arena do Grêmio",
      :address => "Avenida Padre Leopoldo Brentano, 110 - Humaitá, Porto Alegre - RS, 90250-590, Brazil",
      :picture_url => "https://fbcdn-sphotos-h-a.akamaihd.net/hphotos-ak-ash4/191063_531576843519171_667983520_o.jpg",
      :capacity => 55662
  },
  {
      :name => "serra_dourada_go",
      :label => "Serra Dourada",
      :address => "Avenida Fued José Sebba, 1170 - Jardim Goiás, Goiânia - GO, Brazil",
      :picture_url => "http://s796.photobucket.com/user/leojr_gyn/media/20734989.jpg.html",
      :capacity => 50049
  },
  {
      :name => "allianz_parque_sp",
      :label => "Allianz Parque",
      :address => "Rua Turiassu, 1840 - Perdizes, São Paulo - SP, 05005-000, Brazil",
      :picture_url => "http://www.baressp.com.br/bares/fotos/allianzparque3.jpg",
      :capacity => 43600
  },
  {
      :name => "mineirao_mg",
      :label => "Mineirão",
      :address => "Avenida Antônio Abrahão Caram, 1001 - São José (Pampulha), Belo Horizonte - MG, 31275-000, Brazil",
      :picture_url => "http://upload.wikimedia.org/wikipedia/commons/e/e3/Novo_mineir%C3%A3o_a%C3%A9rea.jpg",
      :capacity => 58170
  },
  {
      :name => "mane_garrincha_df",
      :label => "Mané Garrincha",
      :address => "Asa Norte, Brasília - DF, 70070-701, Brazil",
      :picture_url => "http://upload.wikimedia.org/wikipedia/commons/e/e4/Brasilia_Stadium_-_June_2013.jpg",
      :capacity => 69349
  },
  {
      :name => "manoel_barradas_ba",
      :label => "Manoel Barradas",
      :address => "Rua Artêmio Valente, 01 - Canabrava, Salvador - BA, 41260-300, Brazil",
      :picture_url => "http://upload.wikimedia.org/wikipedia/commons/d/d5/Jogo_barradao.jpg",
      :capacity => 35632
  },
  {
      :name => "arena_pernambuco_pe",
      :label => "Arena Pernambuco",
      :address => "Avenida Deus É Fiel, 01, Letra A - Jardim Penedo, São Lourenço da Mata - PE, 54710-010, Brazil",
      :picture_url => "http://www.copa2014.gov.br/sites/default/files/styles/galeria_de_imagem_820_547/public/galeria/recife_aerea_arenapernambuco-3554.jpg",
      :capacity => 46154
  },
  {
      :name => "couto_pereira_pr",
      :label => "Couto Pereira",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "heriberto_hulse_sc",
      :label => "Heriberto Hulse",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "beira_rio_rs",
      :label => "Beira-Rio",
      :address => "Avenida Padre Cacique, 891 - Praia de Belas, Porto Alegre - RS, 90810-240, Brazil",
      :picture_url => "http://www.copa2014.gov.br/sites/default/files/styles/galeria_de_imagem_820_547/public/galeria/portoalegre_aerea_arenabeirario-33.jpg",
      :capacity => 51300
  },
  {
      :name => "arena_da_amazonia_am",
      :label => "Arena da Amazônia",
      :address => "Avenida Constantino Nery, S/N - Flores, Manaus - AM, 69050-010, Brazil",
      :picture_url => "http://www.copa2014.gov.br/sites/default/files/styles/galeria_de_imagem_820_547/public/galeria/arenaamazonia_fev2014-3_1.jpg?itok=taZixSKI",
      :capacity => 40549
  },
  {
      :name => "vila_belmiro_sp",
      :label => "Vila Belmiro",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "arena_conda_sc",
      :label => "Arena Condá",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "morumbi_sp",
      :label => "Morumbi",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "arena_da_baixada_sc",
      :label => "Arena da Baixada",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
  {
      :name => "independencia_mg",
      :label => "Independência",
      :address => "",
      :picture_url => "",
      :capacity => 1
  },
    {
      :name => "fonte_nova_ba",
      :label => "Arena Fonte Nova",
      :address => "Ladeira da Fonte das Pedras, s/n - Nazaré, Salvador - BA, 40050-565, Brazil",
      :picture_url => "http://upload.wikimedia.org/wikipedia/commons/3/34/Arena_Fonte_Nova_view_from_lake_(zoom).jpg",
      :capacity => 51708
  }
]

venues.each do |new_venue|
  venue = Venue.new
  venue.name = new_venue[:name]
  venue.label = new_venue[:label]
  venue.address = new_venue[:address]
  venue.picture_url = new_venue[:picture_url]
  venue.capacity = new_venue[:capacity]
  venue.save
end

coefficients = [
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "intercept",
      :value => 9.35291
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "timeOfDay18:15",
      :value => 2.321435
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuemane_garrincha",
      :value => 0.712061
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "home.teamsport_pe",
      :value => 0.709938
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuearena_das_dunas",
      :value => 0.6963102
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venueolimpico_do_para",
      :value => 0.6685318
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuemineirao",
      :value => 0.5700306
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuecastelao",
      :value => 0.5170172
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuearena_da_baixada",
      :value => 0.5050869
  },
  {
      :user_id => 1,
      :scope => "attendance",
      :name => "venuemaracana",
      :value => 0.4874497
  }]

coefficients.each do |new_coefficient|
  coefficient = Coefficient.new
  coefficient.user_id = new_coefficient[:user_id]
  coefficient.scope = new_coefficient[:scope]
  coefficient.name = new_coefficient[:name]
  coefficient.value = new_coefficient[:value].round(7)
  coefficient.save
end
