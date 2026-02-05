import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:hospital_app/features/home/presentation/widgets/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homeTitle'.tr()),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            tooltip: 'language'.tr(),
            onSelected: (locale) => context.setLocale(locale),
            itemBuilder: (context) => [
              PopupMenuItem(value: const Locale('en'), child: Text('english'.tr())),
              PopupMenuItem(value: const Locale('th'), child: Text('thai'.tr())),
            ],
          ),
        ],
      ),
      body: BlocProvider.value(
        value: context.read<HomeBloc>()
          ..add(const HomeLoadRequested()),
        child: const HomeContent(),
      ),
    );
  }
}
