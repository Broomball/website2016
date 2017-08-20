class Game < ApplicationRecord
  has_many :player_games
  has_many :players, :through => :player_games

  belongs_to :home_team, :class_name => :Team
  belongs_to :away_team, :class_name => :Team

  def self.creategames(startDate)
    schedule=RRSchedule::Schedule.new(
    :teams => [
      %w(A1 A2 A3 A4 A5 A6 A7 A8 A9 A10),
      %w(B1 B2 B3 B4 B5 B6 B7 B8 B9 B10),
      %w(C1 C2 C3 C4 C5 C6 C7 C8 C9 C10),
      %w(D1 D2 D3 D4 D5 D6 D7 D8 D9 D10),
      %w(E1 E2 E3 E4 E5 E6 E7 E8 E9 E10),
      %w(F1 F2 F3 F4 F5 F6 F7 F8 F9 F10),
      %w(G1 G2 G3 G4 G5 G6 G7 G8 G9 G10),
      %w(H1 H2 H3 H4 H5 H6 H7 H8 H9 H10),
      %w(I1 I2 I3 I4 I5 I6 I7 I8 I9 I10),
      %w(J1 J2 J3 J4 J5 J6 J7 J8 J9 J10),
      %w(K1 K2 K3 K4 K5 K6 K7 K8 K9 K10),
      %w(L1 L2 L3 L4 L5 L6 L7 L8 L9 L10),
      %w(M1 M2 M3 M4 M5 M6 M7 M8 M9 M10),
      %w(N1 N2 N3 N4 N5 N6 N7 N8 N9 N10),
      %w(O1 O2 O3 O4 O5 O6 O7 O8 O9 O10),
      %w(P1 P2 P3 P4 P5 P6 P7 P8 P9 P10),
      %w(Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10),
      %w(R1 R2 R3 R4 R5 R6 R7 R8 R9 R10),
      %w(S1 S2 S3 S4 S5 S6 S7 S8 S9 S10),
      %w(T1 T2 T3 T4 T5 T6 T7 T8 T9 T10),
      %w(U1 U2 U3 U4 U5 U6 U7 U8 U9 U10),
      %w(V1 V2 V3 V4 V5 V6 V7 V8 V9 V10),
      %w(W1 W2 W3 W4 W5 W6 W7 W8 W9 W10),
      %w(X1 X2 X3 X4 X5 X6 X7 X8 X9 X10)
    ],

    #Setup some scheduling rules
    :rules => [
      RRSchedule::Rule.new(:wday => 0, :gt => ["8:00AM", "8:45AM", "9:30AM", "10:15AM", "11:00AM", "11:45AM", "12:30PM", "1:15PM", "2:00PM", "2:45PM", "3:30PM", "4:15PM", "5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 1, :gt => ["5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 2, :gt => ["5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 3, :gt => ["5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 4, :gt => ["5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 5, :gt => ["5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"]),
      RRSchedule::Rule.new(:wday => 6, :gt => ["8:00AM", "8:45AM", "9:30AM", "10:15AM", "11:00AM", "11:45AM", "12:30PM", "1:15PM", "2:00PM", "2:45PM", "3:30PM", "4:15PM", "5:00PM", "5:45PM", "6:30PM", "7:15PM", "8:00PM", "8:45PM", "9:30PM", "10:15PM", "11:00PM"], :ps => ["black", "silver", "gold"])
    ],

    #First games are played on...
    :start_date => Date.parse("2017/01/10"),

    #array of dates to exclude
    :exclude_dates => [],

    #Number of times each team must play against each other (default is 1)
    :cycles => 1,

    #Shuffle team order before each cycle. Default is true
    :shuffle => true
  )

  schedule.generate
  schedule.gamedays.each do |gd|
    gd.games.each do |g|
      Game.create(home_team_id: Team.where(name: g.team_a.to_s).first.id, away_team_id: Team.where(name: g.team_b.to_s).first.id, start_time: g.game_time)
    end
  end

    #Get each conference
    #conferences = Team.distinct.pluck(:conference)

    #For each conference and team in conference schedule the games
    #conferences.each do |c|
    #  teamsInConference = Team.where(conference: c).order(:id)
    #  teamsInConference.each.with_index do |teamInC, teamNum|
    #    teamsInConference.drop(teamNum + 1).each.with_index do |opponentTeams, index|
    #      if gamesPerTeam/2 < index
    #        Game.new(home_team_id: teamInC.id, away_team_id: opponentTeams.id, )
    #      else
    #        Game.new(home_team_id: opponentTeams.id, away_team_id: )
    #      end


    #    end
    #  end
    end

end
