import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
            child: orientation == Orientation.portrait
                ? const Column(
                    children: [ProfilePic(), PhotoGraphy()],
                  )
                : const Row(
                    children: [ProfilePic(), PhotoGraphy()],
                  )));
  }
}

class PhotoGraphy extends StatelessWidget {
  const PhotoGraphy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: orientation == Orientation.portrait
          ? size.width / 1.2
          : size.width / 1.7,
      child: Column(
        children: [
          const Center(
              child: Text(
            "John Doe",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
            ),
          ),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing:
                    10.0, // Adjust this value to reduce main axis spacing
                crossAxisSpacing: 10.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9rpQDNSwZQAbXaZwxN6AgHWan5HBoj-9uKQ&usqp=CAU');
              },
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircleAvatar(
          radius: orientation == Orientation.portrait ? 200 : size.width / 6,
          backgroundImage: const NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwLU8Bv0Xrg8zWF8OmdAE31XhRQJlw9rJfWQ&usqp=CAU"),
        ),
      ),
    );
  }
}
