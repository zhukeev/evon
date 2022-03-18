import 'package:dio/dio.dart';
import 'package:evon/modules/result_screen/api/result_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'result_api.g.dart';

@RestApi()
abstract class ResultApi {
  factory ResultApi(Dio dio, {String baseUrl}) = _ResultApi;

  @GET(ResultUrls.random)
  Future<List<int>> getRandomNUmber(@Query('max') int max);
}
