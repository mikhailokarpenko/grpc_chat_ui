import 'package:client_it/app/domain/app_config.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
@prod
class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => "localhost";

  @override
  String get host => Environment.prod;

  @override
  int get port => 443;
}

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => "localhost";

  @override
  String get host => Environment.dev;

  @override
  int get port => 443;
}

@Singleton(as: AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => "_";

  @override
  String get host => Environment.test;

  @override
  int get port => 443;
}