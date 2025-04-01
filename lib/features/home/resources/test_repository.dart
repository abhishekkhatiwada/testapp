import 'package:testapp/common/constants/env.dart';
import 'package:testapp/common/http/api_provider.dart';
import 'package:testapp/common/http/dio_exception.dart';
import 'package:testapp/common/http/response.dart';
import 'package:testapp/features/home/model/model.dart';
import 'package:testapp/features/home/resources/test_api_provider.dart';

class TransactionRepository {
  ApiProvider apiProvider;
  late TransactionApiProvider transactionApiProvider;
  Env env;

  TransactionRepository({required this.env, required this.apiProvider}) {
    transactionApiProvider = TransactionApiProvider(
      baseUrl: env.baseUrl,
      apiProvider: apiProvider,
    );
  }

  Future<DataResponse> fetchTransactionLimit() async {
    try {
      final res = await transactionApiProvider.fetchTransactionLimit();
      final data = res as Map<String, dynamic>;

      FetchedList datas = FetchedList.fromJson(data);

      return DataResponse.success(datas);
    } on CustomException catch (e) {
      if (e is SessionExpireErrorException) {
        rethrow;
      }
      return DataResponse.error(e.message, e.statusCode);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
