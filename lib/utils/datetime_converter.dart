import 'package:json_annotation/json_annotation.dart';

class DateTimeEpochConverter implements JsonConverter<DateTime, int> {
  const DateTimeEpochConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
