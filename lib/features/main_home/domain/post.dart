import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Posts {
  Posts(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  final int userId;
  final int id;
  final String title;
  final String body;

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}
