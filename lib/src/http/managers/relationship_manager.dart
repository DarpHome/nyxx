
import 'package:nyxx/src/http/managers/manager.dart';
import 'package:nyxx/src/models/snowflake.dart';
import 'package:nyxx/src/models/user/relationship.dart';
import 'package:nyxx/src/utils/parsing_helpers.dart';

/// A manager for [Relationship]s.
class RelationshipManager extends ReadOnlyManager<Relationship> {
  /// Create a new [RelationshipManager].
  RelationshipManager(super.config, super.client) : super(identifier: 'relationships');

  @override
  PartialRelationship operator [](Snowflake id) => PartialRelationship(id: id, manager: this);

  @override
  Relationship parse(Map<String, Object?> raw) {
    return Relationship(
      manager: this,
      type: RelationshipType.parse(raw['type'] as int),
      nickname: raw['nickname'] as String,
      user: maybeParse(raw['user'], client.users.parse)
    );
  }
}