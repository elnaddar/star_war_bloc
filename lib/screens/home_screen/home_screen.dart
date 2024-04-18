import 'package:flutter/material.dart';
import 'widgets/categories_list.dart';
import 'widgets/likes_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButton: const LikesButton(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Star Wars',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Starjedi",
            fontSize: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
            child: const Padding(
                padding: EdgeInsets.only(top: 50.0), child: CategoriesList()),
          )),
        ),
      ),
    );
  }
}
