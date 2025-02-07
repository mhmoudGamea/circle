import 'package:go_router/go_router.dart';

import '../../presentation/views/login/views/login_view.dart';
import '../../presentation/views/splash/views/splash_view.dart';

abstract class NavigationService {
  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.rn,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: LoginView.rn,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
