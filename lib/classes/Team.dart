class Team {
  String name;
  String abbrev;
  TeamMember player1;
  TeamMember player2;
  TeamMember player3;
  TeamMember? sub;
  TeamMember? coach;

  Team({
    required this.name,
    required this.abbrev,
    required this.player1,
    required this.player2,
    required this.player3,
    this.sub,
    this.coach,
  });
}

class TeamMember {
  String name;
  String country;

  TeamMember({
    required this.name,
    required this.country,
  });
}
