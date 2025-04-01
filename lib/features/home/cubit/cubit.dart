import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/common/cubit/data_state.dart';
import 'package:testapp/common/http/response.dart';
import 'package:testapp/features/home/model/model.dart';
import 'package:testapp/features/home/resources/test_repository.dart';

class TransactionLimitCubit extends Cubit<CommonState> {
  TransactionLimitCubit({required this.transactionRepository})
    : super(CommonInitial());

  final TransactionRepository transactionRepository;

  fetchTransactionLimit() async {
    emit(CommonLoading());
    final res = await transactionRepository.fetchTransactionLimit();
    if (res.status == Status.success && res.data != null) {
      emit(CommonStateSuccess<FetchedList>(data: res.data!));
    } else {
      emit(CommonError(message: res.message ?? 'Unable to load data'));
    }
  }
}
