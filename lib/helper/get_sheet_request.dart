import 'dart:convert';

import 'package:automation/models/brandModel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final brandDetailsProvider = FutureProvider<List<BrandModel>>((ref) async {
  final Uri url = Uri.parse(
      "https://script.googleusercontent.com/macros/echo?user_content_key=y067Hq2c7LlcJHOKG5z-u_ebAKzwM1fCFZUDSuR6wZGRoJeQGPRFbmXHKzKf1BfEUSES6xxQ0RGFWOdrhPomyqx_j3Rf8c8Pm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnHSxjtjbtsg5QGGTdoSxhkHxRNWej1KJ86QBT_ZqP0X9HYW5QilfOpjsS99nEM-C42AtnkqycbCvpLZXcTXevz7PUJ9HiikRbdz9Jw9Md8uu&lib=M3Uhd40ro3qRtbHdfIixKU7h2TAQAg5fN");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => BrandModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
});
