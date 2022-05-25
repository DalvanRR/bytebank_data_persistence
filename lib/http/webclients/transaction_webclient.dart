import 'dart:convert';

import 'package:bytebankdatapersistence/screens/transaction_form.dart';
import 'package:http/http.dart';

import '../../models/contact.dart';
import '../../models/transaction.dart';
import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri(
            host: baseHost,
            port: basePort,
            path: 'transactions',
            scheme: 'http'))
        .timeout(Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response);

    return transactions;
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = decodedJson.map((dynamic json) {
      return Transaction.fromJson(json);
    }).toList();

    //final List<Transaction> transactions = [];
    //for (Map<String, dynamic> transactionJson in decodedJson) {
    //transactions.add(Transaction.fromJson(transactionJson));
    //}
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    _toMap(transaction);

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
        Uri(
          host: baseHost,
          port: basePort,
          path: 'transactions',
          scheme: baseScheme,
        ),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

  void _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accounteNumber': transaction.contact.accountNumber
      }
    };
  }
}
