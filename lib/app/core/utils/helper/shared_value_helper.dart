import 'package:shared_value/shared_value.dart';

final SharedValue<bool> isLoggedIn = SharedValue(
  value: false,
  key: "is_logged_in",
);
final SharedValue<bool> keepSignedIn = SharedValue(
  value: false,
  key: "keep_signed_in",
);

final SharedValue<String> token = SharedValue(
  value: "",
  key: "access_token",
);
final SharedValue<String> expireIn = SharedValue(
  value: "",
  key: "expireIn",
);

final SharedValue<int> userId = SharedValue(
  value: 0,
  key: "user_id",
);
final SharedValue<String> mUserId = SharedValue(
  value: "",
  key: "mUserId",
);
final SharedValue<String> userPassword = SharedValue(
  value: "",
  key: "user_password",
);
final SharedValue<bool> isRemembered = SharedValue(
  value: false,
  key: "is_Remembered",
);

final SharedValue<String> userName = SharedValue(
  value: "",
  key: "user_name",
);
final SharedValue<String> crewCode = SharedValue(
  value: "",
  key: "crew_code",
);
final SharedValue<String> designation = SharedValue(
  value: "",
  key: "designation",
);
final SharedValue<String> flyTimeInUsBangla = SharedValue(
  value: "",
  key: "flyTimeInUsBangla",
);
final SharedValue<String> totalFlyTime = SharedValue(
  value: "",
  key: "totalFlyTime",
);
final SharedValue<String> aircraftType = SharedValue(
  value: "",
  key: "aircraftType",
);

final SharedValue<String> userEmail = SharedValue(
  value: "",
  key: "user_email",
);

final SharedValue<String> userPhone = SharedValue(
  value: "",
  key: "user_phone",
);
final SharedValue<String> avatarOriginal = SharedValue(
  value: "",
  key: "avatar_original",
);

final SharedValue<String> refreshToken = SharedValue(
  value: "",
  key: "refresh_token",
);
