// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'providers/router_provider.dart';
import 'providers/user_state_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userStateProvider = ref.read(userStateProvider.notifier);
    // GoRouterが動く前にUserStateを初期化する
    final snapshot = useFuture(useMemoized(
        () async {
          return await _userStateProvider.initLoad();
        }
    ));
    switch (snapshot.connectionState) {
      case ConnectionState.done:
        final router = ref.watch(routerProvider);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: 'growth tree',
        );
        // TODO: 各状態の画面をきれいに作り直す
      case ConnectionState.waiting:
        return const CircularProgressIndicator();
      case ConnectionState.none:
        return MaterialApp(home: const Scaffold(body: Text('error'),));
      case ConnectionState.active:
        return const CircularProgressIndicator();
    }
  }
}
