import 'package:flutter/material.dart';
import '../../widgets/swapi_object_list_item.dart';
import '../../models/swapi_object.dart';
import '../../services/swapi_service.dart';
import '../../utils/categories.dart';

class CategoryScreenArguments {
  final Category category;

  CategoryScreenArguments(this.category);
}

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/categories';
  final Category category;
  const CategoryScreen({super.key, required this.category});

  Future<List<SwapiObject>> _getObjects(Category category) async {
    return await SwapiService().getAll(category);
  }

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
        title: Text(getCategoryName(category),
            style: Theme.of(context).textTheme.displayLarge),
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
        child: FutureBuilder<List<SwapiObject>>(
            future: _getObjects(category),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: SwapiObjectListItem(
                              object: snapshot.data![index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
