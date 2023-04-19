import 'api_service.dart';
import 'base_services.dart';

mixin ConfigMixin {
  BaseServices? api;

  void setAppConfig() {
    api = ApiServices();
  }
}
