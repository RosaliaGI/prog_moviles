import 'dart:convert';

import 'package:collection/collection.dart';

class Amphibian {
	String? name;
	String? type;
	String? description;

	Amphibian({this.name, this.type, this.description});

	@override
	String toString() {
		return 'Amphibian(name: $name, type: $type, description: $description)';
	}

	factory Amphibian.fromMap(Map<String, dynamic> data) => Amphibian(
				name: data['name'] as String?,
				type: data['type'] as String?,
				description: data['description'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'name': name,
				'type': type,
				'description': description,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Amphibian].
	factory Amphibian.fromJson(String data) {
		return Amphibian.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Amphibian] to a JSON string.
	String toJson() => json.encode(toMap());

	Amphibian copyWith({
		String? name,
		String? type,
		String? description,
	}) {
		return Amphibian(
			name: name ?? this.name,
			type: type ?? this.type,
			description: description ?? this.description,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Amphibian) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => name.hashCode ^ type.hashCode ^ description.hashCode;
}
