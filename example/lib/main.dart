import 'package:flutter/material.dart';
import 'package:fiona_i18n/fiona_i18n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Fionai18n().initialize(locale: "es");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i18n Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'i18n Example Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.empty(growable: true);

    String msgTitle = Fionai18n.message("title");
    String msgExample = Fionai18n.message("example");

    children.add(Center(
        child: Text(
      msgTitle,
      style: const TextStyle(fontSize: 20),
    )));
    children.add(Center(child: Text(msgExample)));

    children.add(Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 5,
            child: ElevatedButton(
              onPressed: () async {
                await Fionai18n().initialize(locale: "es");
                setState(() {});
              },
              child: const Text("ES"),
            )),
        Expanded(
            flex: 5,
            child: ElevatedButton(
              onPressed: () async {
                await Fionai18n().initialize(locale: "en");
                setState(() {});
              },
              child: const Text("EN"),
            )),
      ],
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
