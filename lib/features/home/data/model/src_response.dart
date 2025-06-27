import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper_hub/features/home/domain/entities/src_data.dart';

part 'src_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class SrcResponse extends SrcData {
  SrcResponse({
    required super.original,
    required super.large,
    required super.medium,
    required super.small,
    required super.portrait,
    required super.landscape,
  });

  factory SrcResponse.fromJson(Map<String, dynamic> json) =>
      _$SrcResponseFromJson(json);
}
