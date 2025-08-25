import 'package:go_router/go_router.dart';
import 'package:membership_app/page/login/login_page.dart';
import 'package:membership_app/utils/router_constant.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutePath.login,
  routes: [
    GoRoute(
      name: AppRouteName.login,
      path: AppRoutePath.login,
      builder: (context, state) => LoginPage(),
    ),
  ],
);
