import 'package:news_app/features/home_screen/domain/entity/source_entity.dart';

class SourceModel extends SourceEntity {
  SourceModel({super.id, super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
