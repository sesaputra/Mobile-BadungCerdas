// file: lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';

// --- 🔥 IMPORT WIDGET PILL BARU ---
import 'package:project_pkl/widgets/hover_pill_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Tentukan warna tema utama untuk hover
    final Color themeHoverColor = Colors.orange;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Nama Pengguna",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            accountEmail: const Text(
              "email@contoh.com",
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange.shade700,
              child: const Text(
                "NP",
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/background_floral.jpg'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // --- 🔥 GUNAKAN WIDGET HoverPillListTile ---
          // HoverPillListTile(
          //   leadingIcon: Icons.home,
          //   title: 'Beranda',
          //   hoverColor: themeHoverColor,
          //   onTap: () => Navigator.pop(context),
          // ),
          HoverPillListTile(
            leadingIcon: Icons.home,
            title: 'Beranda',
            hoverColor: themeHoverColor,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          HoverPillListTile(
            leadingIcon: Icons.person,
            title: 'Profil Saya',
            hoverColor: themeHoverColor,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilScreen(),
                ),
              );
            },
          ),
          HoverPillListTile(
            leadingIcon: Icons.history,
            title: 'Riwayat Pendaftaran',
            hoverColor: themeHoverColor,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatPendaftaranScreen(),
                ),
              );
            },
          ),
          HoverPillListTile(
            leadingIcon: Icons.fact_check,
            title: 'Verifikasi Pencairan',
            hoverColor: themeHoverColor,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerifikasiPencairanScreen(),
                ),
              );
            },
          ),

          const Divider(indent: 16, endIndent: 16),

          HoverPillListTile(
            leadingIcon: Icons.settings,
            title: 'Pengaturan',
            hoverColor: themeHoverColor,
            onTap: () => Navigator.pop(context),
          ),
          HoverPillListTile(
            leadingIcon: Icons.logout,
            title: 'Keluar',
            hoverColor: Colors.red, // <-- Bisa dikustomisasi
            defaultIconColor: Colors.red.shade700,
            defaultTextColor: Colors.red.shade700,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
