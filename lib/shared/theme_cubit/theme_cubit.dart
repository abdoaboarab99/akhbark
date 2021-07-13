import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void toggleTheme({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBool(key: 'isDark', value: isDark).then((value) {});
      emit(AppThemeState());
    }
  }
}
