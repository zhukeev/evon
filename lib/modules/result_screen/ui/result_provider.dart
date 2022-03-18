import 'package:evon/modules/result_screen/repository/result_repository.dart';
import 'package:flutter/foundation.dart';

class ResultPageProvider extends ChangeNotifier {
  final ResultRepository _resultRepository;

  ResultPageProvider({
    required ResultRepository resultRepository,
  }) : _resultRepository = resultRepository {
    fetchRandomNumber();
  }

  //Loading state
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int? _randomNumber;
  int? get randomNumber => _randomNumber;

  set isLoading(bool value) {
    if (isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  void fetchRandomNumber() async {
    isLoading = true;

    try {
      _randomNumber = await _resultRepository.getRandomNUmber();
    } catch (e) {
      debugPrint('getRandomNUmber:   $e');
    } finally {
      isLoading = false;
    }
  }
}
