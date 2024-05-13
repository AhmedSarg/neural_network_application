import '../../app/date_ntp.dart';
import '../network/app_prefs.dart';

// const String _onBoardingFirstTimeKey = "onBoardingFirstTimeKey";

abstract class CacheDataSource {

  // Future<bool> getOnBoardingFirstTime();

}

class CacheDataSourceImpl implements CacheDataSource {
  final AppPrefs _preferences;
  final DateNTP _dateNTP;

  CacheDataSourceImpl(this._preferences, this._dateNTP);

  // @override
  // Future<void> setOnBoardingFirstTime() async {
  //   await _preferences.setBool(_onBoardingFirstTimeKey, true);
  // }

}
