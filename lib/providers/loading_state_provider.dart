// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingStateProvider = StateNotifierProvider<LoadingStateProvider, bool>((ref) {
  return LoadingStateProvider();
});

class LoadingStateProvider extends StateNotifier<bool> {
  LoadingStateProvider() : super(false);

  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future().whenComplete(toIdle));
  }

  void toLoading() {
    if (state) return;
    state = true;
  }

  void toIdle() {
    if (!state) return;
    state = false;
  }
}
