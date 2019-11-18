// To parse this JSON data, do
//
//     final menuListModel = menuListModelFromJson(jsonString);

import 'dart:convert';

List<MenuListModel> menuListModelFromJson(String str) => List<MenuListModel>.from(json.decode(str).map((x) => MenuListModel.fromJson(x)));

String menuListModelToJson(List<MenuListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuListModel {
    String heading;
    List<Content> content;

    MenuListModel({
        this.heading,
        this.content,
    });

    factory MenuListModel.fromJson(Map<String, dynamic> json) => MenuListModel(
        heading: json["heading"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "heading": heading,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class Content {
    String id;
    String name;
    String price;
    String image;

    Content({
        this.id,
        this.name,
        this.price,
        this.image,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
    };
}
