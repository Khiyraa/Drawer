import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Sample user data
  final String _userName = "Khiyraa";
  final String _userEmail = "segitigamas@gmail.com";
  final String _userAvatar = "IR";

  // Pages for navigation
  final List<Widget> _pages = [
    // Dashboard page
    const DashboardPage(),
    // Profile page
    const ProfilePage(),
    // Messages page
    const MessagesPage(),
    // Notifications page
    const NotificationsPage(),
    // Settings page
    const SettingsPage(),
  ];

  // Navigation titles
  final List<String> _titles = ["Dashboard", "Profile", "Messages", "Notifications", "Calls", "Settings"];

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close the drawer
    });
  }

  void _logout() {
    // TODO: Implement logout logic
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex]), elevation: 2),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with user info
            UserAccountsDrawerHeader(
              accountName: Text(_userName),
              accountEmail: Text(_userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userAvatar,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            // Dashboard option
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () => _onDrawerItemTapped(0),
            ),
            // Profile option
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () => _onDrawerItemTapped(1),
            ),
            // Settings option
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              selected: _selectedIndex == 2,
              onTap: () => _onDrawerItemTapped(2),
            ),
            // Settings option
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              selected: _selectedIndex == 3,
              onTap: () => _onDrawerItemTapped(3),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: _selectedIndex == 4,
              onTap: () => _onDrawerItemTapped(4),
            ),
            // Divider
            const Divider(),
            // Logout option
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

// Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome message
          Text(
            'Selamat Datang Kembali!',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Apa yang terjadi hari ini ?',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // Stats cards
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Stat card 1
              _buildStatCard(
                context,
                Icons.trending_up,
                'Total Order',
                '45',
                Colors.blue,
              ),
              // Stat card 2
              _buildStatCard(
                context,
                Icons.people,
                'Akun Baru',
                '12',
                Colors.green,
              ),
              // Stat card 3
              _buildStatCard(
                context,
                Icons.attach_money,
                'Revenue',
                '\$1,240',
                Colors.orange,
              ),
              // Stat card 4
              _buildStatCard(
                context,
                Icons.star,
                'Rating',
                '4.8',
                Colors.purple,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Recent activities
          Text(
            'Aktivitas sebelumnya',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Activity list
          _buildActivityItem(
            context,
            Icons.shopping_cart,
            'Orderan diterima',
            '5 menit yang lalu',
            Colors.blue,
          ),
          const Divider(),
          _buildActivityItem(
            context,
            Icons.person_add,
            'akun baru ditambahkan',
            '1 Jam yang lalu',
            Colors.green,
          ),
          const Divider(),
          _buildActivityItem(
            context,
            Icons.payment,
            'Pembayaran berhasil',
            '3 jam yang lalu',
            Colors.orange,
          ),
          const SizedBox(height: 16),

          // View all button
          Center(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Lihat semua Aktivitas'),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build stat cards
  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build activity items
  Widget _buildActivityItem(
    BuildContext context,
    IconData icon,
    String title,
    String time,
    Color color,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile picture
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Text(
              'IR',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            'Khiyraa',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          // Email
          Text(
            'segitigamas@gmail.com',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          // Edit profile button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profil'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(height: 32),
          // Profile info sections
          const Divider(),
          _buildProfileInfoItem(context, 'Nomor Telepon', '+62 812 345 6789'),
          const Divider(),
          _buildProfileInfoItem(
            context,
            'Alamat',
            'jalan kanan dan kiri, Kecamatan atas',
          ),
          const Divider(),
          _buildProfileInfoItem(context, 'Tanggal Lahir', '07/07/1997'),
          const Divider(),
          _buildProfileInfoItem(context, 'Bergabung', 'January 2020'),
          const Divider(),
        ],
      ),
    );
  }

  // Helper method to build profile info items
  Widget _buildProfileInfoItem(
    BuildContext context,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Messages Page
class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = [
      {'sender': 'Admin', 'message': 'Selamat datang di aplikasi kami!'},
      {'sender': 'Sistem', 'message': 'Akun Anda telah diperbarui.'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ListTile(
          leading: const Icon(Icons.message),
          title: Text(msg['sender']!),
          subtitle: Text(msg['message']!),
        );
      },
    );
  }
}

// Notifications Page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = [
      'Update aplikasi terbaru telah tersedia.',
      'Jangan lupa lengkapi profil Anda.',
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(notifications[index]),
        );
      },
    );
  }
}

// Settings Page
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _biometricEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Settings section title
        Text(
          'Setting Keseluruhan',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Notifications setting
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SwitchListTile(
            title: const Text('Notifikasi'),
            subtitle: const Text('Hidupkan atau matikan notifikasi'),
            secondary: const Icon(Icons.notifications),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(height: 8),

        // Dark mode setting
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SwitchListTile(
            title: const Text('Mode Gelap'),
            subtitle: const Text('Hidupkan atau matikan mode gelap'),
            secondary: const Icon(Icons.dark_mode),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(height: 8),

        // Biometric login setting
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SwitchListTile(
            title: const Text('Biometric Login'),
            subtitle: const Text(
              'Gunakan fingerprint atau face ID untuk login',
            ),
            secondary: const Icon(Icons.fingerprint),
            value: _biometricEnabled,
            onChanged: (value) {
              setState(() {
                _biometricEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(height: 24),

        // Account settings section
        Text(
          'Setting Akun',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Change password option
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ganti Kata Sandi'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),

        // Privacy policy option
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),

        // Terms of service option
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),

        // Delete account option
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text(
              'Hapus Akun',
              style: TextStyle(color: Colors.red),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Delete Account?'),
                      content: const Text(
                        'Langkah ini akan menghapus seluruh data pada akun.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // TODO: Implement delete account logic
                          },
                          child: const Text(
                            'DELETE',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),

        // App information section
        Text(
          'Tentang',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // App version
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const ListTile(
            leading: Icon(Icons.info),
            title: Text('Versi Aplikasi'),
            trailing: Text('1.0.0'),
          ),
        ),
      ],
    );
  }
}
