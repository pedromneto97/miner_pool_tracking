// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      energyCost: (json['energyCost'] as num).toDouble(),
      enableBiometry: json['enableBiometry'] as bool? ?? false,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'energyCost': instance.energyCost,
      'enableBiometry': instance.enableBiometry,
    };
