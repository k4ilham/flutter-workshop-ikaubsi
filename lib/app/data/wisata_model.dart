import 'dart:convert';

//ubah ini
List<WisataModel> wisataModelFromJson(String str) => List<WisataModel>.from(
    json.decode(str).map((x) => WisataModel.fromJson(x)));

//ubah ini
String wisataModelToJson(List<WisataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WisataModel {
  WisataModel({
    required this.idWisata,
    required this.kategoriName,
    required this.title,
    required this.image,
    required this.summary,
    required this.userCreate,
    required this.createdAt,
    required this.hitCount,
  });

  String idWisata;
  String kategoriName;
  String title;
  String image;
  String summary;
  String userCreate;
  String createdAt;
  String hitCount;

  factory WisataModel.fromJson(Map<String, dynamic> json) => WisataModel(
        idWisata: json["id_wisata"],
        kategoriName: json["kategori_name"],
        title: json["title"],
        image: json["image"],
        summary: json["summary"],
        userCreate: json["user_create"],
        createdAt: json["created_at"],
        hitCount: json["hit_count"],
      );

  Map<String, dynamic> toJson() => {
        // ignore: unnecessary_null_in_if_null_operators
        "id_wisata": idWisata,
        // ignore: unnecessary_null_in_if_null_operators
        "kategori_name": kategoriName,
        // ignore: unnecessary_null_in_if_null_operators
        "title": title,
        // ignore: unnecessary_null_in_if_null_operators
        "image": image,
        // ignore: unnecessary_null_in_if_null_operators
        "summary": summary,
        // ignore: unnecessary_null_in_if_null_operators
        "user_create": userCreate,
        // ignore: unnecessary_null_in_if_null_operators
        "created_at": createdAt,
        // ignore: unnecessary_null_in_if_null_operators
        "hit_count": hitCount,
      };
}
