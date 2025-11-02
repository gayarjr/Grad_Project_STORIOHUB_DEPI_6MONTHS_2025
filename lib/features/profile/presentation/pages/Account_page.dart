import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order_pages_withouts_data.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("icons/myorder.png", width: 20, height: 20),
            title: const Text('My Orders'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrder()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset("/icons/mydetails.png", width: 20, height: 20),
            title: const Text('My Details'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              "icons/changepassowordandaddressbook.png",
              width: 20,
              height: 20,
            ),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              "icons/changepassowordandaddressbook.png",
              width: 20,
              height: 20,
            ),
            title: const Text('Address Book'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset("icons/FAQS.png", width: 20, height: 20),
            title: const Text('FAQs'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              "/icons/Helpcenter.png",
              width: 20,
              height: 20,
            ),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Image.asset("icons/logout2.png", width: 20, height: 20),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
