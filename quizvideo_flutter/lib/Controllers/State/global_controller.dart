import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class GlobalController extends GetxController {
  Client client = (Client(
    'http://localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor());

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //streamInit();
  }

  late StreamingConnectionHandler? onlineUserHandler;

  streamInit() {
    onlineUserHandler = StreamingConnectionHandler(
      client: client,
      listener: (state) {
        if (state.status == StreamingConnectionStatus.disconnected) {
          //onlineUserHandler.connect();
        }
      },
    );
  }

  streamConnect() {
    onlineUserHandler?.connect();
    radarStream ??= client.online.stream.asBroadcastStream();

    competitionStream ??= client.competition.stream.asBroadcastStream();
  }

  streamDisconnect() {
    onlineUserHandler?.close();
    //onlineUserHandler?.dispose();
    //onlineUserHandler = null;
  }

  Stream<SerializableModel>? radarStream;
  Stream<SerializableModel>? competitionStream;
}
