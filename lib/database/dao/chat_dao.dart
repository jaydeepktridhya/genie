import 'package:floor/floor.dart';
import 'package:genie/model/chat_model.dart';

@dao
abstract class ChatDao {
  @Query('SELECT * FROM ChatMessage')
  Future<List<ChatMessage>> getChats();

  @Query('SELECT * FROM ChatMessage WHERE userId = :userId')
  Future<List<ChatMessage>> getChatsById(int userId);

  @Query(
      "SELECT * FROM ChatMessage WHERE userId = :userId ORDER BY id DESC LIMIT 10 OFFSET :offset")
  Future<List<ChatMessage>> getChatsByIdWithLimit(int userId, int offset);

  @insert
  Future<void> insertSingleChatMessage(ChatMessage chatMessage);
}
