import 'package:go_router/go_router.dart';
import 'package:new_vetmobile_app/features/presentation/screens/about_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/change_password_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/disease_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/fertilization_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/flash_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/forgot_password.dart';
import 'package:new_vetmobile_app/features/presentation/screens/forgot_password_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/grass_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/hens_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/horses_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/lives_stock_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/login_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/menu_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/register_screen.dart';
import 'package:new_vetmobile_app/features/presentation/screens/sheep_screen.dart'
   ;
import 'package:new_vetmobile_app/features/presentation/screens/user_account.dart';
import 'package:new_vetmobile_app/features/presentation/screens/user_account_edit.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => FlashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
        path: '/forgot-password',
        builder: (context, state) => ForgotPasswordScreen()),
    GoRoute(
        path: '/forgot-pass', builder: (context, state) => ForgotPassword()),
    GoRoute(
        path: '/change-password',
        builder: (context, state) => ChangePasswordScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/user', builder: (context, state) => UserAccount()),
    GoRoute(path: '/menu', builder: (context, state) => MenuScreen()),
    GoRoute(
        path: '/user-account', builder: (context, state) => UserAccountEdit()),
    GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
    GoRoute(path: '/grass', builder: (context, state) => const GrassScreen()),
    GoRoute(
        path: '/fertilization',
        builder: (context, state) => const FertilizationScreen()),
    GoRoute(
        path: '/disease', builder: (context, state) => const DiseaseScreen()),
    GoRoute(
        path: '/livestock',
        builder: (context, state) => const LivesStockScreen()),
    GoRoute(path: '/sheep', builder: (context, state) => const SheepScreen()),
    GoRoute(path: '/horses', builder: (context, state) => const HorsesScreen()),
    GoRoute(path: '/hens', builder: (context, state) => const HensScreen()),
  ],
);
