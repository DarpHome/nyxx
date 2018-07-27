part of nyxx.commands;

class AnnotCommand {
  /// Name of command
  final String cmd;

  /// Indicates if commands is restricted to admins
  final bool isAdmin;

  /// List of roles required to execute command
  final List<Role> requiredRoles;

  /// Cooldown for command in seconds
  final int cooldown;

  /// Indicated if command is hidden from help
  final bool isHidden;

  const AnnotCommand(this.cmd, [this.isAdmin = false, this.requiredRoles = null,
    this.cooldown, this.isHidden = false]);
}

/// Defines new subcommand.
class Subcommand extends AnnotCommand {
  const Subcommand(String cmd, {bool isAdmin, List<Role> requiredRoles,
    int cooldown, bool isHidden})
      : super(cmd, isAdmin, requiredRoles,
      cooldown, isHidden);
}

/// Creates main execution command
class Maincommand extends AnnotCommand {
  const Maincommand({bool isAdmin, List<Role> requiredRoles,
    int cooldown, bool isHidden})
      : super(null, isAdmin, requiredRoles,
      cooldown, isHidden);
}
