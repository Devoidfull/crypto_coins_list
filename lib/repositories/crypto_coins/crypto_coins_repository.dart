import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await dio.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=15&page=1&sparkline=false&locale=en',
      options: Options(
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        },
      ),
    );

    final data = response.data as List<dynamic>;

    final cryptoCoinsList = data.map((e) {
      final map = e as Map<String, dynamic>;
      return CryptoCoin(
        name: map['name'],
        priceInUSD: (map['current_price'] as num).toDouble(),
        imageURL: map['image'],
      );
    }).toList();

    return cryptoCoinsList;
  }
}
