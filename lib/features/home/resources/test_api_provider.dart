import 'package:testapp/common/http/api_provider.dart';
import 'package:testapp/common/utils/url_utils.dart';

class TransactionApiProvider {
  TransactionApiProvider({required this.baseUrl, required this.apiProvider});

  final ApiProvider apiProvider;

  final String baseUrl;

  fetchTransactionLimit() async {
    final url = baseUrl;
    return await apiProvider.get(UrlUtils.getUri(url: url), token: '');
  }
}
