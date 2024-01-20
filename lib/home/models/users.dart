// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Users {
  Users({
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
  final List<String>? langues;
  final List<String>? centredinteret;
  final List<String>? friendsMatch;
  final List<String>? friendsDoesntMatch;
  final DateTime? lastMatchedAt;
  final Phone? phone;
  final String country;
  final String nom;
  final String prenom;
  final int? age;
  final int? taille;
  final String? morphologie;
  final String? jevis;
  final String? profession;
  final String? niveaudetudes;
  final int? nombredenfants;
  final String? relationserieuse;
  final bool? jefume;
  final String? frequencealcool;
  final bool? jebois;
  final String? frequencefume;
  final String? religion;
  final String? ethnie;
  final String? hetero;
  final String? presentation;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? avatar;
  final int? v;

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json["_id"] == null ? null : json["_id"],
      langues: json["langues"] == null ? null : List<String>.from(json["langues"].map((x) => x)),
      centredinteret: json["centredinteret"] == null ? null : List<String>.from(json["centredinteret"].map((x) => x)),
      friendsMatch: json["friends_match"] == null ? null : List<String>.from(json["friends_match"].map((x) => x)),
      friendsDoesntMatch: json["friends_doesnt_match"] == null ? null : List<String>.from(json["friends_doesnt_match"].map((x) => x)),
      lastMatchedAt: json["last_matched_at"] == null ? null : DateTime.parse(json["last_matched_at"]),
      phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      country: json["country"] == null ? null : json["country"],
      nom: json["nom"] == null ? null : json["nom"],
      prenom: json["prenom"] == null ? null : json["prenom"],
      age: json["age"] == null ? null : json["age"],
      taille: json["taille"] == null ? null : json["taille"],
      morphologie: json["morphologie"] == null ? null : json["morphologie"],
      jevis: json["jevis"] == null ? null : json["jevis"],
      profession: json["profession"] == null ? null : json["profession"],
      niveaudetudes: json["niveaudetudes"] == null ? null : json["niveaudetudes"],
      nombredenfants: json["nombredenfants"] == null ? null : json["nombredenfants"],
      relationserieuse: json["relationserieuse"] == null ? null : json["relationserieuse"],
      jefume: json["jefume"] == null ? null : json["jefume"],
      frequencealcool: json["frequencealcool"] == null ? null : json["frequencealcool"],
      jebois: json["jebois"] == null ? null : json["jebois"],
      frequencefume: json["frequencefume"] == null ? null : json["frequencefume"],
      religion: json["religion"] == null ? null : json["religion"],
      ethnie: json["ethnie"] == null ? null : json["ethnie"],
      hetero: json["hetero"] == null ? null : json["hetero"],
      presentation: json["presentation"] == null ? null : json["presentation"],
      password: json["password"] == null ? null : json["password"],
      createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      avatar: json["avatar"] == null ? null : json["avatar"],
      v: json["__v"] == null ? null : json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "langues": langues == null ? null : List<dynamic>.from(langues!.map((x) => x)),
    "centredinteret": centredinteret == null ? null : List<dynamic>.from(centredinteret!.map((x) => x)),
    "friends_match": friendsMatch == null ? null : List<dynamic>.from(friendsMatch!.map((x) => x)),
    "friends_doesnt_match": friendsDoesntMatch == null ? null : List<dynamic>.from(friendsDoesntMatch!.map((x) => x)),
    "last_matched_at": lastMatchedAt == null ? null : lastMatchedAt!.toIso8601String(),
    "phone": phone == null ? null : phone!.toJson(),
    "country": country == null ? null : country,
    "nom": nom == null ? null : nom,
    "prenom": prenom == null ? null : prenom,
    "age": age == null ? null : age,
    "taille": taille == null ? null : taille,
    "morphologie": morphologie == null ? null : morphologie,
    "jevis": jevis == null ? null : jevis,
    "profession": profession == null ? null : profession,
    "niveaudetudes": niveaudetudes == null ? null : niveaudetudes,
    "nombredenfants": nombredenfants == null ? null : nombredenfants,
    "relationserieuse": relationserieuse == null ? null : relationserieuse,
    "jefume": jefume == null ? null : jefume,
    "frequencealcool": frequencealcool == null ? null : frequencealcool,
    "jebois": jebois == null ? null : jebois,
    "frequencefume": frequencefume == null ? null : frequencefume,
    "religion": religion == null ? null : religion,
    "ethnie": ethnie == null ? null : ethnie,
    "hetero": hetero == null ? null : hetero,
    "presentation": presentation == null ? null : presentation,
    "password": password == null ? null : password,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "avatar": avatar == null ? null : avatar,
    "__v": v == null ? null : v,
  };

  static List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x){
    return Users.fromJson(x);
  }));

  static String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
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
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    isValid: json["isValid"] == null ? null : json["isValid"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    countryCallingCode: json["countryCallingCode"] == null ? null : json["countryCallingCode"],
    formattedNumber: json["formattedNumber"] == null ? null : json["formattedNumber"],
    nationalNumber: json["nationalNumber"] == null ? null : json["nationalNumber"],
    formatInternational: json["formatInternational"] == null ? null : json["formatInternational"],
    formatNational: json["formatNational"] == null ? null : json["formatNational"],
    uri: json["uri"] == null ? null : json["uri"],
    e164: json["e164"] == null ? null : json["e164"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode == null ? null : countryCode,
    "isValid": isValid == null ? null : isValid,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "countryCallingCode": countryCallingCode == null ? null : countryCallingCode,
    "formattedNumber": formattedNumber == null ? null : formattedNumber,
    "nationalNumber": nationalNumber == null ? null : nationalNumber,
    "formatInternational": formatInternational == null ? null : formatInternational,
    "formatNational": formatNational == null ? null : formatNational,
    "uri": uri == null ? null : uri,
    "e164": e164 == null ? null : e164,
  };
}
