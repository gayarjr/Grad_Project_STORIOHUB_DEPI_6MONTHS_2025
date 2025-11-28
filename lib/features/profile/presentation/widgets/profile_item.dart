import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

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
