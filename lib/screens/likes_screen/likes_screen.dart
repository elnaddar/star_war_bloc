import 'package:flutter/material.dart';
import '/models/swapi_object.dart';
import '../../widgets/swapi_object_list_item.dart';

class LikesScreen extends StatelessWidget {
  static const routeName = "/likes";
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Likes", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 1,
            opacity: 0.3,
            image: AssetImage('assets/background.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: SwapiObjectListItem(
                      object: SwapiObject(
                        name: "Luke Skywalker",
                        url: "https://swapi.dev/api/people/1/",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
