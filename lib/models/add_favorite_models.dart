// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddFavoriteData {
  bool value;
  String title;
  String imageUrl;
  AddFavoriteData({
    required this.value,
    required this.title,
    required this.imageUrl,
  });

  AddFavoriteData copyWith({
    bool? value,
    String? title,
    String? imageUrl,
  }) {
    return AddFavoriteData(
      value: value ?? this.value,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory AddFavoriteData.fromMap(Map<String, dynamic> map) {
    return AddFavoriteData(
      value: map['value'] as bool,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddFavoriteData.fromJson(String source) => AddFavoriteData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddFavoriteData(value: $value, title: $title, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant AddFavoriteData other) {
    if (identical(this, other)) return true;
  
    return 
      other.value == value &&
      other.title == title &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => value.hashCode ^ title.hashCode ^ imageUrl.hashCode;
}
