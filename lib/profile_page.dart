import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = "Dhani Kusuma Wardana Putra";
  final String role = "Mahasiswa Software Engineering";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Pengguna"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ProfileAvatar(),

              const SizedBox(height: 16),
              
              ProfileInfo(
                  name: userName,
                  role: role,
              ),

              const SizedBox(height: 24),
              ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Fitur edit belum aktif"),
                      ),
                    );
                  },
                icon: const Icon(Icons.edit),
                label: const Text("edit profile"),
              ),
              const SizedBox(height: 24),
              const ProfileStats(),
            ],
          ),
        ),
      ),
    );
  }
}

//widget reusable untuk profileavatar tinggal di panggil2 aja nanti
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(
        Icons.person,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

//widget reusable untuk profileinfo
class ProfileInfo extends StatelessWidget {
  final String name;
  final String role;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          role,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Row(
        children: const [
          Expanded(
              child: StatItem(
                count: "12",
                label: "Proyek"
              ),
          ),
          Expanded(
            child: StatItem(
              count: "8.8K",
              label: "Followers",
            ),
          ),
          Expanded(
            child: StatItem(
              count: '24',
              label: 'Following',
            ),
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}


