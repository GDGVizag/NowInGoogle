import 'package:flutter/material.dart';
import 'package:nowingoogle/widgets/appbar.dart';
import 'package:nowingoogle/widgets/registersnippet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefAppBar(),
      body: Container(
        child: Column(children: [RegisterSnippet()]),
      ),
      drawer: Text('Hello'),
    );
  }
}
