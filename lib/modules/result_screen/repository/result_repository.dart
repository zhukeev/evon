import 'package:evon/modules/result_screen/api/client/result_api.dart';

class ResultRepository {
  ResultRepository({required ResultApi api}) : _api = api;

  final ResultApi _api;

  static const maxNumber = 10;

  // Get random number
  Future<int> getRandomNUmber() => _api.getRandomNUmber(maxNumber).then((value) => value.first);
}
