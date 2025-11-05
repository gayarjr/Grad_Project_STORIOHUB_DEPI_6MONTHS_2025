import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => CategoriesRepository(),
      child: BlocProvider(
        create: (context) =>
            CategoriesCubit(context.read<CategoriesRepository>())
              ..fetchCategories(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Storio', style: AppStyles.textSemiBold32),
          ),
          body: const HomeViewBody(),
        ),
      ),
    );
  }
}
