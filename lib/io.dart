/// Copyright (c) 2019 - Èrik Campobadal Forés
/// /// Version null safety by João Pedro Freire (@djpfs on github)
library websok.io;

import 'package:websokNullSafety/websok.dart';
import 'package:web_socket_channel/io.dart';

class IOWebsok extends Websok<IOWebSocketChannel> {
  /// HTTP request headers when [connect()] is called.
  final Map<String, String> headers;

  /// Determines the ping interval for the websocket.
  /// Null means no ping will be sent to the server.
  final Duration? pingInterval;

  /// Creates a new IO Websocket.
  IOWebsok({
    required String host,
    int port = -1,
    String path = '',
    Map<String, String> query = const <String, String>{},
    Iterable<String> protocols = const <String>[],
    this.headers = const <String, String>{},
    this.pingInterval = null,
    bool tls = false,
  }) : super(
          host: host,
          port: port,
          path: path,
          query: query,
          protocols: protocols,
          tls: tls,
        );

  /// Connects to the websocket given the following options.
  IOWebSocketChannel connectWith(String url, Iterable<String> protocols) =>
      IOWebSocketChannel.connect(
        url,
        protocols: protocols,
        headers: this.headers,
        pingInterval: this.pingInterval,
      );
}
