import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../model/chat_model.dart';
import '../database/dao/chat_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [
  ChatMessage,
])
abstract class AppDatabase extends FloorDatabase {
  ChatDao get chatDao;
}
