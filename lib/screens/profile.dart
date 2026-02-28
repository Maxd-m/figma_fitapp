import 'package:flutter/material.dart';
import 'package:figma_fitapp/widgets/app_bottom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0D12),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 12),
          Expanded(child: _buildMenuList(context)),
          AppBottomBar(activeTab: BottomTab.home),
          // _buildBottomNavBar(context),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFB8A6FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              SizedBox(width: 6),
              // const SizedBox(height: 12),
              // const Text(
              //   'Back',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 18,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 8),
          const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2E2B3B),
              // TODO: Reemplazar por imagen de perfil (CircleAvatar / Image)
            ),
            child: const Center(
              child: Icon(Icons.person, color: Colors.white30, size: 40),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Madison Smith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'madison@example.com',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          const Text(
            'Birthday: April 1st',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF7C6AE6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(label: 'Weight', value: '75 Kg'),
                _VerticalDivider(),
                _StatItem(label: 'Years Old', value: '28'),
                _VerticalDivider(),
                _StatItem(label: 'Height', value: '1.65 CM'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return ListView(
      // Agregamos el padding directamente al ListView
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        _ProfileMenuItem(
          icon: Icons.person_outline,
          label: 'Profile',
          onTap: () {},
        ),
        _ProfileMenuItem(
          icon: Icons.star_border,
          label: 'Favorite',
          onTap: () {
            Navigator.pushNamed(context, '/favorites');
          },
        ),
        _ProfileMenuItem(
          icon: Icons.lock_outline,
          label: 'Privacy Policy',
          onTap: () {},
        ),
        _ProfileMenuItem(
          icon: Icons.settings_outlined,
          label: 'Settings',
          onTap: () {},
        ),
        _ProfileMenuItem(icon: Icons.help_outline, label: 'Help', onTap: () {}),
        _ProfileMenuItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        // Puedes agregar más items aquí para probar el scroll
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // TODO: implementar navegación
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF7C6AE6),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFB8FF3B)),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: Colors.white24);
  }
}
