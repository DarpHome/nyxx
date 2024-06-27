import 'package:nyxx/src/models/snowflake_entity/snowflake_entity.dart';
import 'package:nyxx/src/models/user/user.dart';

/// A partial [Relationship] object.
class PartialRelationship extends ManagedSnowflakeEntity<Relationship> {
  @override
  final RelationshipManager manager;

  /// Create a new [PartialRelationship].
  /// @nodoc
  PartialRelationship({required super.id, required this.manager});
}

enum RelationshipType {
  friend._(1),
  blocked._(2),
  incoming._(3),
  outgoing._(4);

  final int value;

  const RelationshipType._(this.value);

  factory RelationshipType.parse(int value) => RelationshipType.values.firstWhere(
        (element) => element.value == value,
        orElse: () => throw FormatException('Unknown relationship type', value),
      );

  @override
  String toString() => 'RelationshipType($value)';
}

/// {@template relationship}
/// A relationship between the current user and another user.
/// 
/// External references:
/// * Discord User API Reference: https://docs.discord.sex/resources/user#relationship-object
/// {@endtemplate}
class Relationship extends PartialRelationship {
  /// The relationship type.
  final RelationshipType type;

  /// The relationship nickname.
  final String? nickname;

  /// The relationship user.
  final User? user;

  final Relationship({required super.manager, required this.type, required this.nickname, required this.user});
}