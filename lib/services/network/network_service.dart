import 'package:connectivity/connectivity.dart';

abstract class NetworkService {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;
  
  Stream<ConnectivityResult> get onConnectivityChanged;
}