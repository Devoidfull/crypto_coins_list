import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coin.dart';

class CryptoCoinDetails extends CryptoCoin {
  const CryptoCoinDetails({
    required super.name,
    required super.priceInUSD,
    required super.imageURL,
    required this.high24Hours,
    required this.low24Hours,
  });

  final double high24Hours;
  final double low24Hours;

  @override
  List<Object?> get props => [...super.props, high24Hours, low24Hours];
}
