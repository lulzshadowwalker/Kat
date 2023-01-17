import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';
import '../views/auth/sign_in/sign_in.dart';
import '../views/auth/sign_up/sign_up.dart';
import '../views/home/comp/home_comp.dart';
import '../views/not_found/not_found.dart';
import '../views/splash/splash.dart';
import 'gorouter_refresh_stream.dart';
import 'kat_routes.dart';

class KatRouter {
  /// TODO add custom platform-dependent page transitions
  ///  ios, slide right to go back
  ///  other, scale up
  ///  (use a proper animation curve)
  static final config = GoRouter(
    errorBuilder: (context, state) => const NotFound(),
    redirect: (context, state) {
      /// TODO if a user is logged out, when they login they have to go back to
      ///  the page the came from. If none, they should be redirected to the
      ///  home screen
      final isOnSplash = state.location == KatRoutes.splash;
      final isAuthenticated = AuthController.isAuthenticated;
      final isGoingToAuthenticate = state.location == KatRoutes.signIn ||
          state.location == KatRoutes.signUp;
      if (!isAuthenticated && !isGoingToAuthenticate && !isOnSplash) {
        return KatRoutes.signIn;
      } else if (isAuthenticated && isGoingToAuthenticate) {
        return KatRoutes.home;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(AuthController.authState),
    initialLocation: KatRoutes.splash,
    routes: [
      GoRoute(
        name: KatRoutes.home,
        path: KatRoutes.home,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: KatRoutes.signIn,
        path: KatRoutes.signIn,
        builder: (context, state) => SignIn(),
      ),
      GoRoute(
        name: KatRoutes.signUp,
        path: KatRoutes.signUp,
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        name: KatRoutes.splash,
        path: KatRoutes.splash,
        builder: (context, state) => const Splash(),
      ),
    ],
  );
}
