import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  const Song(
      {super.key,
      required this.title,
      required this.author,
      required this.likes});

  final String title;
  final String author;
  final int likes;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://thecatapi.com/api/images/get?format=src'
                    '&size=small&type=jpg#${title.hashCode}'),
                radius: 20.0,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title, style: textTheme.subtitle1),
                    Text(author, style: textTheme.caption),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: const Icon(Icons.play_arrow, size: 40.0),
                onTap: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.favorite, size: 25.0),
                    Text('${likes ?? ''}'),
                  ],
                ),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Song(title: 'Trapadelic lobo', author: 'lillobobeats', likes: 4),
        Song(title: 'Different', author: 'younglowkey', likes: 23),
        Song(title: 'Future', author: 'younglowkey', likes: 2),
        Song(title: 'ASAP', author: 'tha_producer808', likes: 13),
        Song(title: '🌲🌲🌲', author: 'TraphousePeyton', likes: 20),
        Song(title: 'Something sweet...', author: '6ryan', likes: 20),
        Song(title: 'Sharpie', author: 'Fergie_6', likes: 30),
        Song(title: 'Sharpie232', author: 'Fergie_8', likes: 37),
        Song(title: 'Sharpie3443', author: 'Fergie_10', likes: 390),
        Song(title: 'Sharpie3443', author: 'Fergie_189', likes: 65),
        Song(title: 'Sharpie3443ddsd', author: 'Fergie_10343', likes: 78),
      ],
    );
  }
}

class CustomTabBar extends AnimatedWidget implements PreferredSizeWidget {
  const CustomTabBar(
      {super.key, required this.pageController, required this.pageNames})
      : super(listenable: pageController);

  final PageController pageController;
  final List<String> pageNames;

  @override
  final Size preferredSize = const Size(0.0, 40.0);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(pageNames.length, (int index) {
          return InkWell(
              child: Text(pageNames[index],
                  style: textTheme.subtitle1?.copyWith(
                    color: Colors.white.withOpacity(
                      index == pageController.page ? 1.0 : 0.2,
                    ),
                  )),
              onTap: () {
                pageController.animateToPage(
                  index,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              });
        }).toList(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 2);

  @override
  build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget>{
      'My Music': const Center(
        child: Text('My Music not implemented'),
      ),
      'Shared': const Center(
        child: Text('Shared not implemented'),
      ),
      'Feed': const Feed(),
    };
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Color.fromARGB(255, 253, 72, 72),
                Color.fromARGB(255, 87, 97, 249),
              ],
              stops: [0.0, 1.0],
            )),
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'T I Z E',
                    style: textTheme.headline1?.copyWith(
                      color: Colors.grey.shade800.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))),
        Scaffold(
          backgroundColor: const Color(0x00000000),
          appBar: AppBar(
            backgroundColor: const Color(0x00000000),
            elevation: 0.0,
            leading: Center(
              child: ClipOval(
                child: Image.network(
                  'http://i.imgur.com/TtNPTe0.jpg',
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // TODO: implement
                },
              ),
            ],
            title: const Text('tofu\'s songs'),
            bottom: CustomTabBar(
              pageController: _pageController,
              pageNames: pages.keys.toList(),
            ),
          ),
          body: PageView(
            controller: _pageController,
            children: pages.values.toList(),
          ),
        ),
      ],
    );
  }
}
