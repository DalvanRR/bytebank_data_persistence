import 'package:bytebankdatapersistence/database/app_database.dart';
import 'package:bytebankdatapersistence/http/webclient.dart';
import 'package:bytebankdatapersistence/models/transaction.dart';
import 'package:bytebankdatapersistence/screens/contact_form.dart';
import 'package:bytebankdatapersistence/screens/contact_list.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(BytebankAppDatap());
}

class BytebankAppDatap extends StatelessWidget {
  const BytebankAppDatap({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green[700],
            textTheme: ButtonTextTheme.primary,
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green[700])),
      home: Dashboard(),
    );
  }
}
