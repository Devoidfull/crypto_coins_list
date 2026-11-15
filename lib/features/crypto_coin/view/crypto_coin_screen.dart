import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:crypto_coins_list/features/crypto_coin/widgets/base_card.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  final _coinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    _coinDetailsBloc.add(LoadCryptoCoinDetails(coinName: coinName!));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailsLoaded) {
            final coinDetails = state.coinDetails;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails.imageURL),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coinDetails.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '${coinDetails.priceInUSD} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'High 24 Hours',
                          value: '${coinDetails.high24Hours} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hours',
                          value: '${coinDetails.low24Hours} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
