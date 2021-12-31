import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@immutable
@JsonSerializable()
class Settings {
  ///Energy cost in USD
  final double energyCost;

  ///Enable biometry to unlock app
  final bool enableBiometry;

  const Settings({
    required this.energyCost,
    this.enableBiometry = false,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  Settings copyWith({
    double? energyCost,
    bool? enableBiometry,
  }) =>
      Settings(
        energyCost: energyCost ?? this.energyCost,
        enableBiometry: enableBiometry ?? this.enableBiometry,
      );
}
