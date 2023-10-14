import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  Posts(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}
