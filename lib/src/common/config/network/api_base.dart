import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_kvant/src/common/common.dart';

abstract mixin class ApiBase<T> {

  //Получение данных из Api
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    final List<T> items = List<T>.from(
      json
          .decode(json.encode(response.data))
          .map((item) => getJsonCallback(item)),
    );
    if (response.statusCode == 200) {
      return items;
    } else {
      throw ServerException();
    }
  }
}
