import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

const apiKey = 'YTJkZDZjNTM2OGIwNGJiOWEwNTNkNThlNDllNWQ2M2I';

class CoinData {

  Future getCoinData() async {
    http.Response response = await http.get('$bitcoinAverageURL/BTCUSD');

    if (response.statusCode == 200) {
      String responseData = response.body;
      return jsonDecode(responseData)['last'];
    } else {
      print(response.statusCode);
      throw 'problem get request';
    }
  }

  Future getCoinDataInCurrency(String currencySymbol) async {
    http.Response response = await http.get('$bitcoinAverageURL/BTC$currencySymbol');

    if (response.statusCode == 200) {
      String responseData = response.body;
      return jsonDecode(responseData)['last'];
    } else {
      throw 'get request problem';
    }
  }

  Future getCryptoDataInCurrency(String crypto, String currencySymbol) async {
    http.Response response = await http.get('$bitcoinAverageURL/$crypto$currencySymbol');

    if (response.statusCode == 200) {
      String responseData = response.body;
      return jsonDecode(responseData)['last'];
    } else {
      throw 'get request problem';
    }
  }
}
