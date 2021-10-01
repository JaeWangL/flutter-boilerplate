import 'package:connectivity/connectivity.dart';
import 'package:flutter_boilerplate/services/network/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  final Connectivity _connectivity;

  NetworkServiceImpl(this._connectivity);

  @override
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return _connectivity.checkConnectivity();
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
    _connectivity.onConnectivityChanged;
}