// ignore: camel_case_types
enum APP_PAGE {
  loading,
  groupPlayer,
  singlePlayer,
  settings,
  onboarding,
  login,
}

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.loading:
        return "/loading";
      case APP_PAGE.groupPlayer:
        return "/";
      case APP_PAGE.singlePlayer:
        return "/singlePlayer";
      case APP_PAGE.settings:
        return "/settings";
      case APP_PAGE.onboarding:
        return "/onboarding";
      case APP_PAGE.login:
        return "/login";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case APP_PAGE.loading:
        return 'LOADING';
      case APP_PAGE.groupPlayer:
        return 'GROUP_PLAYER';
      case APP_PAGE.singlePlayer:
        return 'SINGLE_PLAYER';
      case APP_PAGE.settings:
        return 'SETTINGS';
      case APP_PAGE.onboarding:
        return 'ONBOARDING';
      case APP_PAGE.login:
        return 'LOGIN';
      default:
        return 'GROUP_PLAYER';
    }
  }
}
