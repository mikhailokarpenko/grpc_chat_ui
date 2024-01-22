import 'package:client_it/app/domain/app_config.dart';
import 'package:client_it/generated/auth.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class RemoteDataProvider {
  AuthRpcClient? _authClient;
  final List<ClientInterceptor> _interceptors;

  late final ClientChannel _channel;

  RemoteDataProvider(AppConfig appConfig) : _interceptors = [] {
    _createChannel(appConfig);
  }

  AuthRpcClient get authClient {
    return _authClient ??= _createClient((p0, p1) => AuthRpcClient(_channel));
  }

  void _createChannel(AppConfig appConfig) {
    _channel = ClientChannel(
      appConfig.baseUrl,
      port: appConfig.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  void dispose() async {
    await _channel.shutdown();
  }

  void addInterceptor(ClientInterceptor interceptor) {
    removeInterceptorOfType(interceptor.runtimeType);
    _interceptors.add(interceptor);
    _createClient((p0, p1) => AuthRpcClient(_channel));
  }

  void removeInterceptorOfType(Type interceptorType) {
    _interceptors.removeWhere((interceptor) => interceptor.runtimeType == interceptorType);
    _authClient = _createClient((p0, p1) => AuthRpcClient(_channel));
  }

  T _createClient<T extends Client>(T Function(ClientChannel, List<ClientInterceptor>) clientCreator) {
    return clientCreator(
      ClientChannel(
        _channel.host,
        port: _channel.port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
      _interceptors,
    );
  }
}