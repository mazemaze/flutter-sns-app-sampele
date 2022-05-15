import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/amplifyconfiguration.dart';
import 'package:sns_app/app.dart';
import 'package:sns_app/models/ModelProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(
    const ProviderScope(
      child: SNSApp(),
    ),
  );
}

Future<void> _configureAmplify() async {
  try {
    AmplifyAuthCognito cognitoPlug = AmplifyAuthCognito();
    AmplifyDataStore datastorePlug =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    AmplifyAPI apiPlug = AmplifyAPI(modelProvider: ModelProvider.instance);

    await Amplify.addPlugins([
      cognitoPlug,
      datastorePlug,
      apiPlug,
    ]);

    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    print('An error occurred configuring Amplify: $e');
  }
}
