import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String apiKey = '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';

  Future<String> generateRecipe(String prompt) async {
    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode({
          'model': 'gpt-4',
          'messages': [
            {'role': 'system', 'content': 'You are a chef assistant.'},
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 300,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        throw Exception('Failed to fetch recipe: ${response.body}');
      }
    } catch (e) {
      return 'Error generating recipe: $e';
    }
  }
}

