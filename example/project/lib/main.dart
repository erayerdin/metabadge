import 'package:flutter/material.dart';
import 'package:metabadge/metabadge.dart';

// see `examples` constant below

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metabadge Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// this class is just a helper for rendering on the screen
class MetabadgeExample {
  final String title;
  final Metabadge metabadge;

  const MetabadgeExample({
    required this.title,
    required this.metabadge,
  });
}

const TextStyle whiteTextStyle = TextStyle(color: Colors.white);

// THESE ARE THE EXAMPLES
// ignore `MetabadgeExample` class, it is just a helper for rendering
// just look at `metabadge` attributes to see how it is done
final List<MetabadgeExample> examples = [
  const MetabadgeExample(
    title: 'Without Header',
    metabadge: Metabadge(
      body: Text(
        'hello',
        style: whiteTextStyle,
      ),
    ),
  ),
  const MetabadgeExample(
    title: 'With Header',
    metabadge: Metabadge(
      header: Text(
        'hello',
        style: whiteTextStyle,
      ),
      body: Text(
        'world',
        style: whiteTextStyle,
      ),
    ),
  ),
  const MetabadgeExample(
    title: 'Different Body Color',
    metabadge: Metabadge(
      body: Text(
        'red',
        style: whiteTextStyle,
      ),
      decoration: MetabadgeDecoration(
        bodyColor: Colors.red,
      ),
    ),
  ),
  const MetabadgeExample(
    title: 'Different Header Color',
    metabadge: Metabadge(
      body: Text(
        'green',
        style: whiteTextStyle,
      ),
      header: Text(
        'blue',
        style: whiteTextStyle,
      ),
      decoration: MetabadgeDecoration(
        headerColor: Colors.blue,
      ),
    ),
  ),
  const MetabadgeExample(
    title: 'Border Radius without Header',
    metabadge: Metabadge(
      body: Text(
        'radius',
        style: whiteTextStyle,
      ),
      decoration: MetabadgeDecoration(radius: 5),
    ),
  ),
  const MetabadgeExample(
    title: 'Border Radius with Header',
    metabadge: Metabadge(
      header: Text(
        'header',
        style: whiteTextStyle,
      ),
      body: Text(
        'body',
        style: whiteTextStyle,
      ),
      decoration: MetabadgeDecoration(radius: 5),
    ),
  ),
  const MetabadgeExample(
    title: 'Different Padding',
    metabadge: Metabadge(
      header: Text(
        'hello',
        style: whiteTextStyle,
      ),
      body: Text(
        'world',
        style: whiteTextStyle,
      ),
      decoration: MetabadgeDecoration(padding: 10),
    ),
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metabadge Examples'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Text(
              examples[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            examples[index].metabadge,
          ],
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(color: Colors.black54),
        ),
        itemCount: examples.length,
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
