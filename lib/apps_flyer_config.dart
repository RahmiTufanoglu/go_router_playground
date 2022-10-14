import 'package:appsflyer_sdk/appsflyer_sdk.dart';

AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
  // Your application's devKey provided by AppsFlyer (required)
  // afDevKey: 'afDevKey',
  afDevKey: 'XXX',
  // ios
  // Your application's App ID (required for iOS only) that you configured in your AppsFlyer dashboard
  appId: 'YYY',
  // Debug mode - set to true for testing only, do not release to production with this parameter set to true!
  showDebug: true,
  // for iOS 14.5
  // Delays the SDK start for x seconds until the user either accepts the consent dialog, declines it, or the timer runs out.
  timeToWaitForATTUserAuthorization: 50,
  // Optional field
  // The OneLink template ID that is used to generate a User Invite, this is not a required field in the AppsFlyerOptions, you may choose to set it later via the appropriate API.
  appInviteOneLink: 'oneLinkID',
  // Optional field
  // Opt-out of the collection of Advertising Identifiers, which include OAID, AAID, GAID and IDFA.
  disableAdvertisingIdentifier: false,
  // Optional field
  disableCollectASA: false, // Opt-out of the Apple Search Ads attributions.
);

final appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
