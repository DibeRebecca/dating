class User {
  final String id;
  final String nom;
  final String prenom;
  final String country;
  final String relationserieuse;
  final String avatar;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.country,
    required this.relationserieuse,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      nom: json['nom'],
      prenom: json['prenom'],
      country: json['country'],
      relationserieuse: json['relationserieuse'],
      avatar: json['avatar'],
    );
  }
}
