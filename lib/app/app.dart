import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/core/di/injection.dart';
import 'package:hospital_app/core/theme/app_theme.dart';
import 'package:hospital_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:hospital_app/features/home/presentation/pages/home_page.dart';

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'Hospital App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomePage(),
      ),
    );
  }
}
