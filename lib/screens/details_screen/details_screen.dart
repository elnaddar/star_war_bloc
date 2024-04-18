import 'package:flutter/material.dart';
import '../../models/swapi_object.dart';
import '../../widgets/like_button.dart';
import '../../services/swapi_service.dart';
import '../../models/swapi_object_details.dart';

class DetailsScreenArguments {
  final SwapiObject object;

  DetailsScreenArguments({required this.object});
}

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  final SwapiObject object;
  const DetailsScreen({required this.object, super.key});

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
        title: Text(object.name, style: Theme.of(context).textTheme.displayLarge),
        actions: [
          LikeButton(
            object: object,
          ),
        ],
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: FutureBuilder<SwapiObjectDetails>(
            future: SwapiService().getDetails(object.url),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> convertedDetails =
                    snapshot.data!.convertKeyNames();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    for (var property in convertedDetails.entries)
                      FutureBuilder(
                          future: property.value is List
                              ? snapshot.data!.getListNames(property.value)
                              : property.value.toString().startsWith("http")
                                  ? snapshot.data!
                                      .getListNames([property.value])
                                  : Future.value(property.value),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data.toString().isNotEmpty) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    children: [
                                      TextSpan(
                                        text: '${property.key}: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFE08F),
                                        ),
                                      ),
                                      TextSpan(
                                        text: snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          })
                  ],
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
