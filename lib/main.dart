import 'package:client_it/app/ui/main_app_builder.dart';
import 'package:client_it/app/ui/main_app_runner.dart';

void main() {
  final appRunner = MainAppRunner();
  final appBuilder = MainAppBuilder();
  appRunner.run(appBuilder);
}