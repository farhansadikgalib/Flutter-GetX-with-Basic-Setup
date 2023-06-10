

import 'package:getx_architecture/app/core/utils/helper/shared_value_helper.dart';

class AuthHelper {
  rememberMe(
    String id,
    String password,bool needToRemember
  ) {
    mUserId.$ = id;
    mUserId.save();
    isRemembered.$ = needToRemember;
    isRemembered.save();

    userPassword.$ = password;
    userPassword.save();
  }

  clearRememberMe(

  ) {
    isRemembered.$ = false;
    isRemembered.save();
    mUserId.$ = "";
    mUserId.save();
    userPassword.$ = "";
    userPassword.save();
  }

  setUserData( loginResponse, bool needToKeepSignedIn) {
/*
    "name": "Ahmad Zamri Bin Yaakob",
    "designation": "CAPTAIN",
    "image": "exp.png",
    "usBangla": "1000:00",
    "total": "1000:00",
    "aircraftType": "ATR 72"*/

    if (loginResponse?.token != null) {
      isLoggedIn.$ = true;
      isLoggedIn.save();

      keepSignedIn.$ = needToKeepSignedIn;
      keepSignedIn.save();

      userId.$ = loginResponse?.user?.id ?? 0;
      userId.save();

      userName.$ = loginResponse?.user?.name ?? "";
      userName.save();

      crewCode.$ = loginResponse?.user?.crewCode ?? "";
      crewCode.save();

      userEmail.$ = "";
      userEmail.save();

      avatarOriginal.$ = loginResponse?.user?.image ?? "";
      avatarOriginal.save();

      designation.$ = loginResponse?.user?.designation ?? "";
      designation.save();

      flyTimeInUsBangla.$ = loginResponse?.user?.usBangla ?? "";
      flyTimeInUsBangla.save();

      totalFlyTime.$ = loginResponse?.user?.total ?? "";
      totalFlyTime.save();

      aircraftType.$ = loginResponse?.user?.aircraftType ?? "";
      aircraftType.save();

      token.$ = "Bearer ${loginResponse?.token}";
      token.save();

      refreshToken.$ = "Bearer ${loginResponse?.refreshToken}";
      refreshToken.save();
    }
  }

  clearUserData() {
    keepSignedIn.$ = false;
    keepSignedIn.save();

    isLoggedIn.$ = false;
    isLoggedIn.save();

    userName.$ = "";
    userName.save();

    crewCode.$ = "";
    crewCode.save();

    userId.$ = 0;
    userId.save();

    userEmail.$ = "";
    userEmail.save();

    avatarOriginal.$ = "";
    avatarOriginal.save();

    designation.$ = "";
    designation.save();

    flyTimeInUsBangla.$ = "";
    flyTimeInUsBangla.save();

    totalFlyTime.$ = "";
    totalFlyTime.save();

    aircraftType.$ = "";
    aircraftType.save();

    token.$ = "";
    token.save();

    refreshToken.$ = "";
    refreshToken.save();
  }
}
