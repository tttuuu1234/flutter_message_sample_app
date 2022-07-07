import 'package:flutter_message_sample_app/states/bottomNavBar/bottom_nav_bar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarController, BottomNavBarState>((ref) {
  return BottomNavBarController();
});

class BottomNavBarController extends StateNotifier<BottomNavBarState> {
  BottomNavBarController() : super(const BottomNavBarState());

  void changeCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
