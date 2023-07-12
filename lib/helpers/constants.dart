import 'dart:io' show Platform;

const REFRESH_TOKEN_KEY = 'refresh_token';
const BACKEND_TOKEN_KEY = 'backend_token';
const GOOGLE_ISSUER = 'https://accounts.google.com';
const GOOGLE_CLIENT_ID_IOS = '143789830025-33nfd2ok3bh5b1f50fqo8sgrpmlp13dm';
const GOOGLE_REDIRECT_URI_IOS = 'com.googleusercontent.apps.143789830025-33nfd2ok3bh5b1f50fqo8sgrpmlp13dm:/oauthredirect';
const GOOGLE_CLIENT_ID_ANDROID = '143789830025-9esva7gbtiom20v1qjj8djde3ctf37i7';
const GOOGLE_REDIRECT_URI_ANDROID = 'com.googleusercontent.apps.143789830025-9esva7gbtiom20v1qjj8djde3ctf37i7:/oauthredirect';

String clientID() {
  if(Platform.isAndroid) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_CLIENT_ID_IOS;
  }
  return '';
}

String redirectUrl() {
  if(Platform.isAndroid) {
    return GOOGLE_REDIRECT_URI_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_REDIRECT_URI_IOS;
  }
  return '';
}