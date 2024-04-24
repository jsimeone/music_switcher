/*
Joseph Simeone
# CITE: J. Sande, Dart Apprentice: Fundamentals: Modern Cross-Platform Programming with Dart, 1st ed. Kodeco, 2022. 
*/

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:music_switcher/apple/apple_authentication.dart';
import 'package:music_switcher/spotify/spotify_api.dart';
import 'package:music_switcher/url_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Swapper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Music Swapper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // The title to be displayed at the top of the home page.

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false; // Whether or not the app is processing a URL.

  // Called once upon app startup. Do all logging into third party stuff here
  @override
  void initState() {
    super.initState();

    // Get credentials for both APIs on app launch
    callSpotifyLoginApi();
    generateAppleToken();
  }

  // Get an authentication token from Spotify on app startup.
  callSpotifyLoginApi() async {
    await SpotifyApi().apiLogin();
  }

  // Generate an authentication token for the Apple Music API
  generateAppleToken() {
    AppleAuthentication.generateJwt();
  }

  // Send whatever is in the clipboard to the URL Parser for conversion.
  convertUrl() async {
    // Set the loading variable and force a UI update.
    setState(() {
      loading = true;
    });

    String urlToConvert = await FlutterClipboard.paste();
    String convertedUrl = await UrlParser.parseUrl(urlToConvert);
    await FlutterClipboard.copy(convertedUrl);

    // Reset the loading variable and force UI update to dismiss loading spinner
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: const Text(
              'Copy a link from either Spotify or Apple Music to your clipboard, and click the button below!',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            // Show either a loading spinner or the convert button depending on the loading variable.
            child: loading
                ? CircularProgressIndicator()
                : FilledButton(
                    onPressed: convertUrl,
                    child: Text('Convert!'),
                  ),
          ),
        ],
      ),
    );
  }
}
