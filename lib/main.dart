import 'package:client_it/app/ui/main_app_builder.dart';
import 'package:client_it/app/ui/main_app_runner.dart';

void main() {
  const env = String.fromEnvironment("env", defaultValue: "dev");
  const appRunner = MainAppRunner(env);
  final appBuilder = MainAppBuilder();
  appRunner.run(appBuilder);
}