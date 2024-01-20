// To parse this JSON data, do
//
//     final crush = crushFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Crush {
  Crush({
    required this.id,
    required this.langues,
    required this.centredinteret,
    required this.friendsMatch,
    required this.friendsDoesntMatch,
    required this.lastMatchedAt,
    required this.phone,
    required this.country,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.taille,
    required this.morphologie,
    required this.jevis,
    required this.profession,
    required this.niveaudetudes,
    required this.nombredenfants,
    required this.relationserieuse,
    required this.jefume,
    required this.frequencealcool,
    required this.jebois,
    required this.frequencefume,
    required this.religion,
    required this.ethnie,
    required this.hetero,
    required this.presentation,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.v,
  });

  final String id;
  final List<String> langues;
  final List<String> centredinteret;
  final List<String> friendsMatch;
  final List<String> friendsDoesntMatch;
  final DateTime lastMatchedAt;
  final Phone phone;
  final String country;
  final String nom;
  final String prenom;
  final int age;
  final int taille;
  final String morphologie;
  final String jevis;
  final String profession;
  final String niveaudetudes;
  final int nombredenfants;
  final String relationserieuse;
  final bool jefume;
  final String frequencealcool;
  final bool jebois;
  final String frequencefume;
  final String religion;
  final String ethnie;
  final String hetero;
  final String presentation;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String avatar;
  final int v;

  factory Crush.fromJson(Map<String, dynamic> json) => Crush(
    id: json["_id"],
    langues: List<String>.from(json["langues"].map((x) => x)),
    centredinteret: List<String>.from(json["centredinteret"].map((x) => x)),
    friendsMatch: List<String>.from(json["friends_match"].map((x) => x)),
    friendsDoesntMatch: List<String>.from(json["friends_doesnt_match"].map((x) => x)),
    lastMatchedAt: DateTime.parse(json["last_matched_at"]),
    phone: Phone.fromJson(json["phone"]),
    country: json["country"],
    nom: json["nom"],
    prenom: json["prenom"],
    age: json["age"],
    taille: json["taille"],
    morphologie: json["morphologie"],
    jevis: json["jevis"],
    profession: json["profession"],
    niveaudetudes: json["niveaudetudes"],
    nombredenfants: json["nombredenfants"],
    relationserieuse: json["relationserieuse"],
    jefume: json["jefume"],
    frequencealcool: json["frequencealcool"],
    jebois: json["jebois"],
    frequencefume: json["frequencefume"],
    religion: json["religion"],
    ethnie: json["ethnie"],
    hetero: json["hetero"],
    presentation: json["presentation"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    avatar: json["avatar"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "langues": List<dynamic>.from(langues.map((x) => x)),
    "centredinteret": List<dynamic>.from(centredinteret.map((x) => x)),
    "friends_match": List<dynamic>.from(friendsMatch.map((x) => x)),
    "friends_doesnt_match": List<dynamic>.from(friendsDoesntMatch.map((x) => x)),
    "last_matched_at": lastMatchedAt.toIso8601String(),
    "phone": phone.toJson(),
    "country": country,
    "nom": nom,
    "prenom": prenom,
    "age": age,
    "taille": taille,
    "morphologie": morphologie,
    "jevis": jevis,
    "profession": profession,
    "niveaudetudes": niveaudetudes,
    "nombredenfants": nombredenfants,
    "relationserieuse": relationserieuse,
    "jefume": jefume,
    "frequencealcool": frequencealcool,
    "jebois": jebois,
    "frequencefume": frequencefume,
    "religion": religion,
    "ethnie": ethnie,
    "hetero": hetero,
    "presentation": presentation,
    "password": password,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "avatar": avatar,
    "__v": v,
  };

  static List<Crush> crushFromJson(String str) => List<Crush>.from(json.decode(str).map((x) => Crush.fromJson(x)));

  static String crushToJson(List<Crush> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Phone {
  Phone({
    required this.countryCode,
    required this.isValid,
    required this.phoneNumber,
    required this.countryCallingCode,
    required this.formattedNumber,
    required this.nationalNumber,
    required this.formatInternational,
    required this.formatNational,
    required this.uri,
    required this.e164,
  });

  final String countryCode;
  final bool isValid;
  final String phoneNumber;
  final String countryCallingCode;
  final String formattedNumber;
  final String nationalNumber;
  final String formatInternational;
  final String formatNational;
  final String uri;
  final String e164;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    countryCode: json["countryCode"],
    isValid: json["isValid"],
    phoneNumber: json["phoneNumber"],
    countryCallingCode: json["countryCallingCode"],
    formattedNumber: json["formattedNumber"],
    nationalNumber: json["nationalNumber"],
    formatInternational: json["formatInternational"],
    formatNational: json["formatNational"],
    uri: json["uri"],
    e164: json["e164"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "isValid": isValid,
    "phoneNumber": phoneNumber,
    "countryCallingCode": countryCallingCode,
    "formattedNumber": formattedNumber,
    "nationalNumber": nationalNumber,
    "formatInternational": formatInternational,
    "formatNational": formatNational,
    "uri": uri,
    "e164": e164,
  };
}
