// To parse this JSON data, do
//
//     final puzzImg = puzzImgFromJson(jsonString);

import 'dart:convert';

List<PuzzImg> puzzImgFromJson(String str) => List<PuzzImg>.from(json.decode(str).map((x) => PuzzImg.fromJson(x)));

String puzzImgToJson(List<PuzzImg> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PuzzImg {
  int? chapterNumber;
  String? name;
  List<String>? image;

  PuzzImg({
    this.chapterNumber,
    this.name,
    this.image,
  });

  factory PuzzImg.fromJson(Map<String, dynamic> json) => PuzzImg(
    chapterNumber: json["chapter_number"],
    name: json["name"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "chapter_number": chapterNumber,
    "name": name,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
  };
}
