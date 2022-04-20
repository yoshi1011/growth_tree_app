import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/router_provider.dart';
import 'providers/user_provider.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // ログイン状態のとき、一度ログイン画面が表示されてから移動するため要修正
    ref.read(userProvider.notifier).readSessionData();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'growth tree',
    );
  }
}
