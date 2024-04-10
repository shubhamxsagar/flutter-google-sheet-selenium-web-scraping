import 'dart:convert';

import 'package:automation/models/post_id.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final postDataHelperProvider = Provider<PostDataHelper>((ref) {
  return PostDataHelper(ref.read(messageNotifierProvider));
});

final messageNotifierProvider =
    ChangeNotifierProvider((ref) => MessageNotifier());

class MessageNotifier extends ChangeNotifier {
  String? _message;

  String? get message => _message;

  // Method to update the message
  void updateMessage(String? newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}

class PostDataHelper {
  final MessageNotifier _messageNotifier;
  PostDataHelper(this._messageNotifier);

  Future<void> postData(PostData postData) async {
    final Uri url = Uri.parse("http://192.168.29.53:5000/api/print_name");

    try {
      String jsonBody = jsonEncode(postData.toJson());

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        print("Data posted successfully");
        Map<String, dynamic> responseData = jsonDecode(response.body);
        _messageNotifier.updateMessage(responseData['message']);
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error posting data: $e");
    }
  }
}
