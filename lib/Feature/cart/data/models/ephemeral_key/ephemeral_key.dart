import 'package:collection/collection.dart';

import 'associated_object.dart';

class EphemeralKey {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKey({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKey.fromJson(Map<String, dynamic> json) => EphemeralKey(
        id: json['id'] as String?,
        object: json['object'] as String?,
        associatedObjects: (json['associated_objects'] as List<dynamic>?)
            ?.map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
            .toList(),
        created: json['created'] as int?,
        expires: json['expires'] as int?,
        livemode: json['livemode'] as bool?,
        secret: json['secret'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'associated_objects':
            associatedObjects?.map((e) => e.toJson()).toList(),
        'created': created,
        'expires': expires,
        'livemode': livemode,
        'secret': secret,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EphemeralKey) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      object.hashCode ^
      associatedObjects.hashCode ^
      created.hashCode ^
      expires.hashCode ^
      livemode.hashCode ^
      secret.hashCode;
}
