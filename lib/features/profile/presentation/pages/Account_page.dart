import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/My_Order_Cubit/my_order_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order_main_page.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account', style: AppStyles.textSemiBold24),
      ),
      body: ListView(
        children: [
          const Divider(),
          ProfileItem(
            icon: Icons.list_alt_outlined,
            title: 'My Orders',
            onTap: () {
              context.push(
                AppRoutes.order,
                extra: BlocProvider(
                  create: (context) =>
                      MyOrderCubit(profileRepo: context.read<ProfileRepo>())
                        ..getOrder(),
                  child: MyOrderMainPage(),
                ),
              );
            },
          ),
          const Divider(),
          ProfileItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {
              context.push(AppRoutes.editProfile);
            },
          ),
          const Divider(),
          ProfileItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            onTap: () {
              context.push(AppRoutes.changePassword);
            },
          ),
          const Divider(),
          ProfileItem(
            icon: Icons.home_outlined,
            title: 'Address Book',
            onTap: () {
              context.push(AppRoutes.adressBook);
            },
          ),
          const Divider(),
          ProfileItem(
            icon: Icons.question_answer_outlined,
            title: 'Help Center',
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              "assets/icons/logout2.png",
              width: 20,
              height: 20,
            ),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () async {
              context.go(AppRoutes.login);
              await Prefs.clearUserData();
            },
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: AppStyles.textRegular16),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
