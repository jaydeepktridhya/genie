import 'package:floor/floor.dart';

enum ChatMessageType { user, bot }

@entity
class ChatMessage {
  final int? userId;
  final String text;
  final String dateTime;
  late final String dateLabel;
  final ChatMessageType chatMessageType;
  @PrimaryKey(autoGenerate: true)
  final int? id;

  ChatMessage({
    this.userId,
    required this.text,
    required this.dateTime,
    required this.dateLabel,
    required this.chatMessageType,
    this.id,
  });
}
