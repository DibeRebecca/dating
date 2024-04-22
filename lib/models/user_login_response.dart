import 'dart:convert';

class UserLoginResponse {
    final String? id;
    final List<String>? langues;
    final List<String>? centredinteret;
    final List<String>? friendsMatch;
    final List<String>? friendsDoesntMatch;
    final DateTime? lastMatchedAt;
    final Phone? phone;
    final String? country;
    final String? nom;
    final String? prenom;
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
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? avatar;
    final int? v;
    final int? allLikeCount;

    UserLoginResponse({
        this.id,
        this.langues,
        this.centredinteret,
        this.friendsMatch,
        this.friendsDoesntMatch,
        this.lastMatchedAt,
        this.phone,
        this.country,
        this.nom,
        this.prenom,
        this.age,
        this.taille,
        this.morphologie,
        this.jevis,
        this.profession,
        this.niveaudetudes,
        this.nombredenfants,
        this.relationserieuse,
        this.jefume,
        this.frequencealcool,
        this.jebois,
        this.frequencefume,
        this.religion,
        this.ethnie,
        this.hetero,
        this.presentation,
        this.createdAt,
        this.updatedAt,
        this.avatar,
        this.v,
        this.allLikeCount,
    });

    UserLoginResponse copyWith({
        String? id,
        List<String>? langues,
        List<String>? centredinteret,
        List<String>? friendsMatch,
        List<String>? friendsDoesntMatch,
        DateTime? lastMatchedAt,
        Phone? phone,
        String? country,
        String? nom,
        String? prenom,
        int? age,
        int? taille,
        String? morphologie,
        String? jevis,
        String? profession,
        String? niveaudetudes,
        int? nombredenfants,
        String? relationserieuse,
        bool? jefume,
        String? frequencealcool,
        bool? jebois,
        String? frequencefume,
        String? religion,
        String? ethnie,
        String? hetero,
        String? presentation,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? avatar,
        int? v,
        int? allLikeCount,
    }) => 
        UserLoginResponse(
            id: id ?? this.id,
            langues: langues ?? this.langues,
            centredinteret: centredinteret ?? this.centredinteret,
            friendsMatch: friendsMatch ?? this.friendsMatch,
            friendsDoesntMatch: friendsDoesntMatch ?? this.friendsDoesntMatch,
            lastMatchedAt: lastMatchedAt ?? this.lastMatchedAt,
            phone: phone ?? this.phone,
            country: country ?? this.country,
            nom: nom ?? this.nom,
            prenom: prenom ?? this.prenom,
            age: age ?? this.age,
            taille: taille ?? this.taille,
            morphologie: morphologie ?? this.morphologie,
            jevis: jevis ?? this.jevis,
            profession: profession ?? this.profession,
            niveaudetudes: niveaudetudes ?? this.niveaudetudes,
            nombredenfants: nombredenfants ?? this.nombredenfants,
            relationserieuse: relationserieuse ?? this.relationserieuse,
            jefume: jefume ?? this.jefume,
            frequencealcool: frequencealcool ?? this.frequencealcool,
            jebois: jebois ?? this.jebois,
            frequencefume: frequencefume ?? this.frequencefume,
            religion: religion ?? this.religion,
            ethnie: ethnie ?? this.ethnie,
            hetero: hetero ?? this.hetero,
            presentation: presentation ?? this.presentation,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            avatar: avatar ?? this.avatar,
            v: v ?? this.v,
            allLikeCount: allLikeCount ?? this.allLikeCount,
        );

    factory UserLoginResponse.fromJson(String str) => UserLoginResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserLoginResponse.fromMap(Map<String, dynamic> json) => UserLoginResponse(
        id: json["_id"],
        langues: json["langues"] == null ? [] : List<String>.from(json["langues"]!.map((x) => x)),
        centredinteret: json["centredinteret"] == null ? [] : List<String>.from(json["centredinteret"]!.map((x) => x)),
        friendsMatch: json["friends_match"] == null ? [] : List<String>.from(json["friends_match"]!.map((x) => x)),
        friendsDoesntMatch: json["friends_doesnt_match"] == null ? [] : List<String>.from(json["friends_doesnt_match"]!.map((x) => x)),
        lastMatchedAt: json["last_matched_at"] == null ? null : DateTime.parse(json["last_matched_at"]),
        phone: json["phone"] == null ? null : Phone.fromMap(json["phone"]),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        avatar: json["avatar"],
        v: json["__v"],
        allLikeCount: json["all_like_count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "langues": langues == null ? [] : List<dynamic>.from(langues!.map((x) => x)),
        "centredinteret": centredinteret == null ? [] : List<dynamic>.from(centredinteret!.map((x) => x)),
        "friends_match": friendsMatch == null ? [] : List<dynamic>.from(friendsMatch!.map((x) => x)),
        "friends_doesnt_match": friendsDoesntMatch == null ? [] : List<dynamic>.from(friendsDoesntMatch!.map((x) => x)),
        "last_matched_at": lastMatchedAt?.toIso8601String(),
        "phone": phone?.toMap(),
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "avatar": avatar,
        "__v": v,
        "all_like_count": allLikeCount,
    };
}

class Phone {
    final String? countryCode;
    final bool? isValid;
    final String? phoneNumber;
    final String? countryCallingCode;
    final String? formattedNumber;
    final String? nationalNumber;
    final String? formatInternational;
    final String? formatNational;
    final String? uri;
    final String? e164;

    Phone({
        this.countryCode,
        this.isValid,
        this.phoneNumber,
        this.countryCallingCode,
        this.formattedNumber,
        this.nationalNumber,
        this.formatInternational,
        this.formatNational,
        this.uri,
        this.e164,
    });

    Phone copyWith({
        String? countryCode,
        bool? isValid,
        String? phoneNumber,
        String? countryCallingCode,
        String? formattedNumber,
        String? nationalNumber,
        String? formatInternational,
        String? formatNational,
        String? uri,
        String? e164,
    }) => 
        Phone(
            countryCode: countryCode ?? this.countryCode,
            isValid: isValid ?? this.isValid,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            countryCallingCode: countryCallingCode ?? this.countryCallingCode,
            formattedNumber: formattedNumber ?? this.formattedNumber,
            nationalNumber: nationalNumber ?? this.nationalNumber,
            formatInternational: formatInternational ?? this.formatInternational,
            formatNational: formatNational ?? this.formatNational,
            uri: uri ?? this.uri,
            e164: e164 ?? this.e164,
        );

    factory Phone.fromJson(String str) => Phone.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Phone.fromMap(Map<String, dynamic> json) => Phone(
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

    Map<String, dynamic> toMap() => {
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
