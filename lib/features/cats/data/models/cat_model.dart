import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/shared/data/models/base_model.dart';

class CatModel extends BaseModel<CatEntity> {
    CatModel({
        required this.approved,
        required this.originalFilename,
        required this.rejected,
        required this.subId,
        required this.pending,
        required this.width,
        required this.breedIds,
        required this.createdAt,
        required this.id,
        required this.url,
        required this.breeds,
        required this.height,
    });

    int? approved;
    String? originalFilename;
    int? rejected;
    String? subId;
    int? pending;
    int? width;
    String? breedIds;
    DateTime? createdAt;
    String id;
    String url;
    List<Breed> breeds;
    int? height;

    factory CatModel.fromJson(Map<dynamic, dynamic> json) => CatModel(
        approved: json["approved"],
        originalFilename: json["original_filename"],
        rejected: json["rejected"],
        subId: json["sub_id"],
        pending: json["pending"],
        width: json["width"],
        breedIds: json["breed_ids"],
        createdAt: DateTime.tryParse(json["created_at"] ?? ''),
        id: json["id"],
        url: json["url"],
        breeds: List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "approved": approved,
        "original_filename": originalFilename,
        "rejected": rejected,
        "sub_id": subId,
        "pending": pending,
        "width": width,
        "breed_ids": breedIds,
        "created_at": createdAt?.toIso8601String() ?? '',
        "id": id,
        "url": url,
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "height": height,
    };

  @override
  CatEntity toEntity() {
    return CatEntity(
        id: id,
        image: url,
    );
  }
}

class Breed {
    Breed({
        required this.suppressedTail,
        required this.wikipediaUrl,
        required this.origin,
        required this.description,
        required this.experimental,
        required this.lifeSpan,
        required this.cfaUrl,
        required this.rare,
        required this.countryCodes,
        required this.lap,
        required this.id,
        required this.shortLegs,
        required this.sheddingLevel,
        required this.dogFriendly,
        required this.natural,
        required this.rex,
        required this.healthIssues,
        required this.hairless,
        required this.weight,
        required this.altNames,
        required this.adaptability,
        required this.vocalisation,
        required this.intelligence,
        required this.socialNeeds,
        required this.countryCode,
        required this.childFriendly,
        required this.vcahospitalsUrl,
        required this.temperament,
        required this.name,
        required this.vetstreetUrl,
        required this.grooming,
        required this.hypoallergenic,
        required this.indoor,
        required this.energyLevel,
        required this.strangerFriendly,
        required this.referenceImageId,
        required this.affectionLevel,
    });

    int? suppressedTail;
    String? wikipediaUrl;
    String? origin;
    String? description;
    int? experimental;
    String? lifeSpan;
    String? cfaUrl;
    int? rare;
    String? countryCodes;
    int? lap;
    String? id;
    int? shortLegs;
    int? sheddingLevel;
    int? dogFriendly;
    int? natural;
    int? rex;
    int? healthIssues;
    int? hairless;
    Weight? weight;
    String? altNames;
    int? adaptability;
    int? vocalisation;
    int? intelligence;
    int? socialNeeds;
    String? countryCode;
    int? childFriendly;
    String? vcahospitalsUrl;
    String? temperament;
    String name;
    String? vetstreetUrl;
    int? grooming;
    int? hypoallergenic;
    int? indoor;
    int? energyLevel;
    int? strangerFriendly;
    String? referenceImageId;
    int? affectionLevel;

    factory Breed.fromJson(Map<dynamic, dynamic> json) => Breed(
        suppressedTail: json["suppressed_tail"],
        wikipediaUrl: json["wikipedia_url"],
        origin: json["origin"],
        description: json["description"],
        experimental: json["experimental"],
        lifeSpan: json["life_span"],
        cfaUrl: json["cfa_url"],
        rare: json["rare"],
        countryCodes: json["country_codes"],
        lap: json["lap"],
        id: json["id"],
        shortLegs: json["short_legs"],
        sheddingLevel: json["shedding_level"],
        dogFriendly: json["dog_friendly"],
        natural: json["natural"],
        rex: json["rex"],
        healthIssues: json["health_issues"],
        hairless: json["hairless"],
        weight: Weight.fromJson(json["weight"]),
        altNames: json["alt_names"],
        adaptability: json["adaptability"],
        vocalisation: json["vocalisation"],
        intelligence: json["intelligence"],
        socialNeeds: json["social_needs"],
        countryCode: json["country_code"],
        childFriendly: json["child_friendly"],
        vcahospitalsUrl: json["vcahospitals_url"],
        temperament: json["temperament"],
        name: json["name"],
        vetstreetUrl: json["vetstreet_url"],
        grooming: json["grooming"],
        hypoallergenic: json["hypoallergenic"],
        indoor: json["indoor"],
        energyLevel: json["energy_level"],
        strangerFriendly: json["stranger_friendly"],
        referenceImageId: json["reference_image_id"],
        affectionLevel: json["affection_level"],
    );

    Map<dynamic, dynamic> toJson() => {
        "suppressed_tail": suppressedTail,
        "wikipedia_url": wikipediaUrl,
        "origin": origin,
        "description": description,
        "experimental": experimental,
        "life_span": lifeSpan,
        "cfa_url": cfaUrl,
        "rare": rare,
        "country_codes": countryCodes,
        "lap": lap,
        "id": id,
        "short_legs": shortLegs,
        "shedding_level": sheddingLevel,
        "dog_friendly": dogFriendly,
        "natural": natural,
        "rex": rex,
        "health_issues": healthIssues,
        "hairless": hairless,
        "weight": weight?.toJson() ?? '',
        "alt_names": altNames,
        "adaptability": adaptability,
        "vocalisation": vocalisation,
        "intelligence": intelligence,
        "social_needs": socialNeeds,
        "country_code": countryCode,
        "child_friendly": childFriendly,
        "vcahospitals_url": vcahospitalsUrl,
        "temperament": temperament,
        "name": name,
        "vetstreet_url": vetstreetUrl,
        "grooming": grooming,
        "hypoallergenic": hypoallergenic,
        "indoor": indoor,
        "energy_level": energyLevel,
        "stranger_friendly": strangerFriendly,
        "reference_image_id": referenceImageId,
        "affection_level": affectionLevel,
    };
}

class Weight {
    Weight({
        required this.metric,
        required this.imperial,
    });

    String metric;
    String imperial;

    factory Weight.fromJson(Map<dynamic, dynamic> json) => Weight(
        metric: json["metric"],
        imperial: json["imperial"],
    );

    Map<dynamic, dynamic> toJson() => {
        "metric": metric,
        "imperial": imperial,
    };
}
