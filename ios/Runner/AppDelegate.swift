import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    var apiKeys: ApiKeys = ApiKeys()
	  
	  // Attempt to load from the "api_keys.json" file.
	  do
	  {
		  apiKeys = try RunnerUtils.loadApiKeys()
	  }
	  catch let e as JSONDecoderError
	  {
		  RunnerUtils.logFlutterMessage("JSONDecoderError: \(e.errorType): \(e.message)")
	  }
	  catch
	  {
		  RunnerUtils.logFlutterMessage(error.localizedDescription)
	  }
	  
	  RunnerUtils.logFlutterMessage("About to provide Google Maps API Key...")
	  
	  GMSServices.provideAPIKey(apiKeys.googleMapsApiKey ?? "")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
