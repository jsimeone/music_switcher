import 'package:flutter/material.dart';
import 'package:music_switcher/apple/apple_api.dart';
import 'package:music_switcher/apple/apple_authentication.dart';
import 'package:music_switcher/spotify/spotify_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Music Swap'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldController = TextEditingController();

  // Called once upon app startup. Do all logging into third party stuff here
  @override
  void initState() {
    super.initState();
    callSpotifyLoginApi();
    generateAppleToken();
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  // Get an authentication token from Spotify on app startup.
  callSpotifyLoginApi() async {
    await SpotifyApi().apiLogin();
  }

  // Generate an authentication token for the Apple Music API
  generateAppleToken() {
    AppleAuthentication.generateJwt();
  }

  searchApple() async {
    await AppleApi().searchApple(textFieldController.text).then(
        (result) => print(result.results.songs.data.first.attributes.url));
  }

  //Search Spotify for a song that matches a certain query
  searchSpotify() async {
    await SpotifyApi()
        .spotifySearch(textFieldController.text)
        .then((result) => print(result.tracks.items.first.externalUrls.url));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
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
              'Enter a song\'s name to generate a Spotify link.',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Song name',
              ),
              controller: textFieldController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: searchApple,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
