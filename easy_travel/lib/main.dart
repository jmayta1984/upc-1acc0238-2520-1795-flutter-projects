import 'package:easy_travel/features/auth/data/repositories/login_repository_impl.dart';
import 'package:easy_travel/features/auth/data/services/login_service.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_bloc.dart';
import 'package:easy_travel/features/auth/presentation/pages/login_page.dart';
import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:easy_travel/features/home/data/dao/destination_dao.dart';
import 'package:easy_travel/features/home/data/repositories/destination_repository_impl.dart';
import 'package:easy_travel/features/home/data/services/destination_service.dart';
import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
import 'package:easy_travel/shared/domain/repositories/destination_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final MaterialTheme appMaterialTheme = MaterialTheme(
  ThemeData(useMaterial3: true).textTheme,
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = appMaterialTheme;
    final DestinationRepository destinationRepository =
        DestinationRepositoryImpl(
          service: DestinationService(),
          dao: DestinationDao(),
        );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(repository: destinationRepository)
                ..add(GetDestinationsByCategory(category: CategoryType.all)),
        ),

        BlocProvider(
          create: (context) => LoginBloc(
            repository: LoginRepositoryImpl(service: LoginService()),
          ),
        ),

        BlocProvider(
          create: (context) =>
              FavoritesBloc(repository: destinationRepository)
                ..add(GetAllFavorites()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        darkTheme: theme.dark(),
        highContrastTheme: theme.lightHighContrast(),
        home: const Scaffold(body: LoginPage()),
      ),
    );
  }
}
