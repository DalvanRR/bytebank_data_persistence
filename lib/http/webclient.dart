import 'dart:convert';

import 'package:bytebankdatapersistence/models/contact.dart';
import 'package:bytebankdatapersistence/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

const String baseHost = '192.168.0.104';
const int basePort = 8080;
const String baseScheme = 'http';
