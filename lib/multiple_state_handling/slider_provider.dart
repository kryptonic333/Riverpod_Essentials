import 'package:riverpod/riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: .5, showPassword: false);
});

class AppState {
  final double slider;
  final bool showPassword;
  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
