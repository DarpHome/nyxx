import 'package:nyxx/src/client.dart';
import 'package:nyxx/src/gateway/gateway.dart';
import 'package:nyxx/src/models/gateway/event.dart';
import 'package:nyxx/src/models/interaction.dart';

/// {@template interaction_create_event}
/// Emitted when an interaction is received by the client.
/// {@endtemplate}
class InteractionCreateEvent<T extends Interaction<dynamic>> extends DispatchEvent {
  // The created interaction.
  final T interaction;

  /// The client that handled this event.
  final Nyxx client;

  /// The gateway that handled this event. Throws if interaction was received through HTTP.
  @override
  Gateway get gateway => (client as NyxxGateway).gateway;

  /// {@macro interaction_create_event}
  /// @nodoc
  InteractionCreateEvent({super.gateway, required this.client, required this.interaction});
}
