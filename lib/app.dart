import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_war_bloc/logic/likes_bloc.dart';
import 'screens/likes_screen/likes_screen.dart';
import 'screens/categories_screen/category_screen.dart';
import 'screens/details_screen/details_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LikesBloc>(
      create: (context) => LikesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: primaryColor,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: primaryColor,
              fontSize: 40,
            ),
            bodyLarge: TextStyle(
              color: primaryColor,
              fontSize: 30,
            ),
            bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        home: const HomeScreen(),
        onGenerateRoute: ((settings) {
          if (settings.name == CategoryScreen.routeName) {
            final CategoryScreenArguments args =
                settings.arguments as CategoryScreenArguments;
            return MaterialPageRoute(
              builder: (context) => CategoryScreen(category: args.category),
            );
          }
          if (settings.name == DetailsScreen.routeName) {
            final DetailsScreenArguments args =
                settings.arguments as DetailsScreenArguments;
            return MaterialPageRoute(
              builder: (context) => DetailsScreen(object: args.object),
            );
          }
          if (settings.name == LikesScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) => const LikesScreen(),
            );
          }
          return null;
        }),
      ),
    );
  }
}
