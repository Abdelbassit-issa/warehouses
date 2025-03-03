import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:warehouses/controllers/dash_board/cubit/dash_board_cubit.dart';
import 'package:warehouses/models/user_profile.dart';
import 'package:warehouses/repos/connections/.keys.dart';
import 'package:warehouses/repos/connections/root_conn.dart';
import 'package:warehouses/controllers/login/logic/cubit/login_cubit.dart';
import 'package:warehouses/sand-box/log_test.dart';
import 'package:warehouses/view/login_page/login.dart';
import 'package:warehouses/view/warehouse_dash_board/dash_board.dart';

final class AppRouter {
  static late final GoRouter goRouter;

  // Initialize Supabase and configure GoRouter
  static Future<void> initializeRouter() async {
    await Supabase.initialize(url: mainURL, anonKey: ANON_KEY);

    final dbConnection = RootConnection.getConnection();

    goRouter = GoRouter(
      redirect: (context, state) => _redirectIfNotAuthenticated(),
      routes: _generateRoutes(dbConnection),
    );
  }

  // Centralized authentication check
  static String? _redirectIfNotAuthenticated() {
    return Supabase.instance.client.auth.currentUser == null ? '/' : null;
  }

  // Generate routes list
  static List<GoRoute> _generateRoutes(RootConnection dbConnection) {
    return [
      GoRoute(
        path: '/',
        name: 'Login',
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const Login(),
            ),
      ),

      GoRoute(
        path: "/WarehouseDashBoard",
        name: "WarehouseDashBoard",
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => DashBoardCubit()),
                // BlocProvider(create: (context) => SubjectBloc()),
              ],
              child: WarehouseDashBoard(),
            ),
      ),

      // // Helper widget for Warehouse Dashboard
      // static Widget _warehouseDashboard(RootConnection dbConnection) {
      //   return BlocProvider(
      //     create:
      //         (context) =>
      //             InventoryBloc(dbConnection.supabaseClient)
      //               ..add(FetchInventoryEvent()),
      //     child: const WarehouseDashboard(),
      //   );
      // }
    ];
  }
}
