import 'package:client_it/app/di/init_di.dart';
import 'package:client_it/app/domain/app_builder.dart';
import 'package:client_it/app/domain/app_runner.dart';
import 'package:flutter/cupertino.dart';

class MainAppRunner implements AppRunner {
  final String env;

  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    // TODO: Init app
    initDi(env);
    // TODO: Init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}
