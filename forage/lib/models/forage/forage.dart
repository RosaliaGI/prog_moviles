import 'dart:convert';
import 'package:collection/collection.dart';

class Forage {
  String? name;
  String? location;
  String? notes;

  Forage({this.name, this.location, this.notes});

  @override
  String toString() {
    return 'Forage(name: $name, location: $location, notes: $notes)';
  }

  factory Forage.fromMap(Map<String, dynamic> data) => Forage(
        name: data['name'] as String?,
        location: data['location'] as String?,
        notes: data['notes'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'location': location,
        'notes': notes,
      };

  factory Forage.fromJson(String data) {
    return Forage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  Forage copyWith({
    String? name,
    String? location,
    String? notes,
  }) {
    return Forage(
      name: name ?? this.name,
      location: location ?? this.location,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Forage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ location.hashCode ^ notes.hashCode;
}
