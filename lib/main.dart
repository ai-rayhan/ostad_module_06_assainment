import 'package:flutter/material.dart';

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
       primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static const List<String> imageLink = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjGEIKf5RT-lxMxx_qOrK4opqQMOecvvGn9w&usqp=CAU',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/RedCat_8727.jpg/1200px-RedCat_8727.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAtxqSrBSeFoj-zXpQdUjxqhLJU86mkhndwg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThddPBu4Y7Z_msmV_fE_HXLS5QG4IXJaj5aw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5ZNus26cImi0EkSyzjxSIKjgILsc8lbExjg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU4cXYbxLC5LU7i-9tjPQBxSAszrI1ZJCctg&usqp=CAU'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for photos',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: imageLink.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) {
                      return GridTile(
                        footer: Container(color: Colors.white,child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(child: Text("Photo $index",style: const TextStyle(fontSize: 20),)),
                        ),),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Image $index clicked!'),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            color: Colors.grey,
                            child: Image.network(
                              imageLink[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:  (context, iindex) =>  ListTile(
                    leading: CircleAvatar(backgroundImage:NetworkImage(imageLink[iindex]),),
                  title: Text('Photo ${iindex+1}'),
                  subtitle: Text('Description of photo ${iindex+1}'),
                ),
                         ),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
              onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                child: const Icon(Icons.upload),
              ),
            ],
          ),
        ),
      );
  }
}