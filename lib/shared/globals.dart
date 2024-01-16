import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int ELEMENTS_PER_PAGE = 10;
const String APP_THEME_STORAGE_KEY = 'AppTheme';
