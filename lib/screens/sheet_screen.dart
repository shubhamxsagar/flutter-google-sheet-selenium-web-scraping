import 'dart:convert';

import 'package:automation/helper/get_sheet_request.dart';
import 'package:automation/helper/post_id_data_helper.dart';
import 'package:automation/models/post_id.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SheetScreen extends ConsumerStatefulWidget {
  const SheetScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SheetScreen();
}

class _SheetScreen extends ConsumerState<SheetScreen> {
  @override
  Widget build(BuildContext context) {
    final postDataHelper = ref.read(postDataHelperProvider);
    final brandDetailsAsyncValue = ref.watch(brandDetailsProvider);
    return Scaffold(
        appBar: AppBar(
          // Use Consumer to listen to changes in the message
          title: Consumer(
            builder: (context, watch, _) {
              final message = ref.watch(messageNotifierProvider).message;
              return Text(message ?? 'No Message');
            },
          ),
        ),
        body: brandDetailsAsyncValue.when(
          data: (brandDetails) => ListView.builder(
            itemCount: brandDetails.length,
            itemBuilder: (context, index) {
              final brand = brandDetails[index];
              return ListTile(
                title: Text(brand.name),
                subtitle: InkWell(
                  child: Text(brand.vendorCode),
                  onTap: () {
                    postDataHelper.postData(PostData(name: brand.vendorCode));
                    // sendData(brand.vendorCode);
                  },
                ),
              );
            },
          ),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ));
  }
}
