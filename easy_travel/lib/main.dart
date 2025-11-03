import 'package:easy_travel/features/auth/register_page.dart';
import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/home/data/repositories/destination_repository_impl.dart';
import 'package:easy_travel/features/home/data/services/destination_service.dart';
import 'package:easy_travel/features/home/domain/models/category.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
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

    return BlocProvider(
      create: (context) => HomeBloc(
        repository: DestinationRepositoryImpl(service: DestinationService()),
      )..add(GetDestinationsByCategory(category: CategoryType.all)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: ThemeMode.system,
        highContrastTheme: theme.lightHighContrast(),
        home: const Scaffold(body: SafeArea(child: RegisterPage())),
      ),
    );
  }
}
