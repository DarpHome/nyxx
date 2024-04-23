import 'package:nyxx/src/builders/builder.dart';
import 'package:nyxx/src/models/emoji.dart';
import 'package:nyxx/src/models/guild/onboarding.dart';
import 'package:nyxx/src/models/snowflake.dart';

class OnboardingPromptOptionBuilder extends CreateBuilder<OnboardingPromptOption> {
  /// The ID of this option.
  Snowflake? id;

  /// The title of this option.
  String title;

  /// A description of this option.
  String? description;

  /// The emoji associated with this onboarding prompt.
  Emoji? emoji;

  /// The IDs of the roles the user is given.
  List<Snowflake>? roleIds;

  /// The IDs of the channels the user is granted access to.
  List<Snowflake>? channelIds;

  OnboardingPromptOptionBuilder({
    this.id,
    required this.title,
    this.description,
    this.emoji,
    this.channelIds,
    this.roleIds,
  });

  @override
  Map<String, Object?> build() => {
        if (id != null) 'id': id.toString(),
        'title': title,
        if (description != null) 'description': description,
        if (emoji is GuildEmoji) 'emoji_id': emoji!.id.toString(),
        if (emoji is TextEmoji) 'emoji_name': emoji!.name, // Guild emojis require only ID
        if (roleIds != null) 'role_ids': roleIds!.map((s) => s.toString()).toList(),
        if (channelIds != null) 'channel_ids': channelIds!.map((s) => s.toString()).toList(),
      };
}

class OnboardingPromptBuilder extends CreateBuilder<OnboardingPrompt> {
  /// The title of this prompt.
  String title;

  /// The options available for this prompt.
  List<OnboardingPromptOptionBuilder> options;

  /// Whether the user can select at most one option.
  bool? isSingleSelect;

  /// Whether selecting an option is required.
  bool? isRequired;

  /// Whether this prompt should appear in the onboarding flow.
  ///
  /// If `false`, this prompt will only be visible in the Roles & Channels tab of the Discord client.
  bool? isInOnboarding;

  /// The type of this prompt.
  OnboardingPromptType? type;

  /// The ID of this prompt.
  // The onboarding API is weird... it should be nullable or optional. See https://github.com/discord/discord-api-docs/issues/6320
  Snowflake id;

  OnboardingPromptBuilder({
    required this.title,
    required this.options,
    this.isSingleSelect,
    this.isRequired,
    this.isInOnboarding,
    this.type,
    required this.id,
  });

  @override
  Map<String, Object?> build() => {
        'title': title,
        'options': options.map((o) => o.build()).toList(),
        if (isSingleSelect != null) 'single_select': isSingleSelect,
        if (isRequired != null) 'required': isRequired,
        if (isInOnboarding != null) 'in_onboarding': isInOnboarding,
        if (type != null) 'type': type!.value,
        'id': id.toString(),
      };
}

class OnboardingBuilder extends CreateBuilder<Onboarding> {
  /// The list of prompts shown during onboarding and in customize community.
  List<OnboardingPromptBuilder>? prompts;

  /// The list of channel IDs that members get opted into automatically.
  List<Snowflake>? defaultChannelIds;

  /// Whether onboarding is enabled in the guild.
  bool? isEnabled;

  /// The mode of onboarding.
  OnboardingMode? mode;

  OnboardingBuilder({
    this.prompts,
    this.defaultChannelIds,
    this.isEnabled,
    this.mode,
  });

  @override
  Map<String, Object?> build() => {
        if (prompts != null) 'prompts': prompts!.map((p) => p.build()).toList(),
        if (defaultChannelIds != null) 'default_channel_ids': defaultChannelIds!.map((s) => s.toString()).toList(),
        if (isEnabled != null) 'enabled': isEnabled,
        if (mode != null) 'mode': mode!.value,
      };
}
