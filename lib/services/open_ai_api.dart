import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/app_constants.dart';

class ChatGtpApi {
  Future<String> generateChatResponse(prompt) async {
    final apiKey = AppConstants.openAIApiKey;
    var url = Uri.https("api.openai.com", "/v1/chat/completions");

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": prompt}
          ]
        }));
    Map<String, dynamic> result = jsonDecode(response.body);
    return (result['choices'][0]['message']['content'])
        .replaceFirst("\n", "")
        .replaceFirst("\n", "");
  }
}
