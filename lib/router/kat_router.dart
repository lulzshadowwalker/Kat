import 'package:go_router/go_router.dart';
import '../views/attributions/attributions.dart';
import '../controllers/auth_controller.dart';
import '../views/auth/sign_in/sign_in.dart';
import '../views/auth/sign_up/sign_up.dart';
import '../views/home/home.dart';
import '../views/not_found/not_found.dart';
import '../views/profile/comps/profile_comps.dart';
import '../views/settings/comps/settings_comps.dart';
import '../views/splash/comps/splash_comps.dart';
import 'gorouter_refresh_stream.dart';
import 'kat_routes.dart';

class KatRouter {
  static final config = GoRouter(
    errorBuilder: (context, state) => const NotFound(),
    redirect: (context, state) {
      final isOnSplash = state.location == KatRoutes.splash;
      final isAuthenticated = AuthController.isAuthenticated;

      final isGoingToAuthenticate = state.location == KatRoutes.signIn ||
          state.location == KatRoutes.signUp;
      if (!isAuthenticated && !isGoingToAuthenticate && !isOnSplash) {
        return KatRoutes.signUp;
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
        routes: [
          GoRoute(
            name: KatRoutes.profile,
            path: KatRoutes.profile,
            builder: (context, state) => const Profile(),
          ),
          GoRoute(
            name: KatRoutes.settings,
            path: KatRoutes.settings,
            builder: (context, state) => const Settings(),
          ),
          GoRoute(
            name: KatRoutes.attributions,
            path: KatRoutes.attributions,
            builder: (context, state) => const Attributions(),
          ),
        ],
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
