import 'package:evon/common/dio_instance.dart';
import 'package:evon/modules/result_screen/api/client/result_api.dart';
import 'package:evon/modules/result_screen/repository/result_repository.dart';
import 'package:evon/modules/result_screen/res/result_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'result_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ResultStrings.title),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ResultPageProvider(
          resultRepository: ResultRepository(
            api: ResultApi(
              DioSettings().dio,
            ),
          ),
        ),
        child: Consumer<ResultPageProvider>(
          builder: (ctx, provider, __) {
            return Center(
              child: provider.isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      '${provider.randomNumber ?? ''}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
            );
          },
        ),
      ),
    );
  }
}
