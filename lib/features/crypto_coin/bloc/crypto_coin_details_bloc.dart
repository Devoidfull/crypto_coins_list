import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
    : super(const CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoinDetails>((event, emit) async {
      try {
        if (state is! CryptoCoinDetailsLoaded) {
          emit(const CryptoCoinDetailsLoading());
        }
        final coinDetails = await coinsRepository.getCoinDetails(
          event.coinName,
        );
        emit(CryptoCoinDetailsLoaded(coinDetails: coinDetails));
      } catch (e) {
        emit(CryptoCoinDetailsLoadingFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
