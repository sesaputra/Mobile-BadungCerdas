// file: lib/screens/detail_beasiswa_screen.dart

import 'package:flutter/material.dart';
import 'package:project_pkl/screens/form_pendaftaran_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'dart:ui';

import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';
import 'package:project_pkl/screens/faq_screen.dart';

// --- 🔥 LANGKAH 1: IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

class DetailBeasiswaScreen extends StatelessWidget {
  const DetailBeasiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color buttonOrange = Colors.orange.shade800;

    return Scaffold(
      backgroundColor: Colors.white,

      // --- 🔥 LANGKAH 2: GANTI SELURUH KODE DRAWER ---
      // Semua kode Drawer dari UserAccountsDrawerHeader sampai ListTile 'Keluar'
      // dihapus dan diganti dengan satu baris ini:
      drawer: const AppDrawer(),
      // --- AKHIR PERUBAHAN DRAWER ---

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FaqScreen()),
          );
        },
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        elevation: 4.0,
        tooltip: 'Bantuan (FAQ)',
        child: const Icon(Icons.help_outline),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF4A4A4A),
                        size: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
            title: const Text(
              "Detail Beasiswa",
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Builder(
                        builder: (context) => IconButton(
                          iconSize: 24.0,
                          icon:
                              const Icon(Icons.menu, color: Color(0xFF4A4A4A)),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            floating: true,
            pinned: true,
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/background_floral.jpg'),
                            fit: BoxFit.cover,
                            opacity: 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- Sisa kode Anda (tidak perlu diubah) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: const Text(
                'Detail Beasiswa\nAnak Cerdas',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  height: 1.3,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade800),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Sebelum melakukan pendaftaran, pastikan anda sudah melengkapi data profil anda terlebih dahulu.',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background_floral.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Poster\nBeasiswa Anak Cerdas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _buildInfoCard(
            icon: Icons.school_outlined,
            iconColor: Colors.blueGrey.shade700,
            title: "Beasiswa Anak Cerdas",
            children: [
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ],
          ),
          _buildInfoCard(
            icon: Icons.groups_outlined,
            iconColor: Colors.blueGrey.shade700,
            title: "Target Pendaftar",
            children: [
              _buildBulletPoint("Pelajar SMP dan SMA se Kabupaten Badung."),
              _buildBulletPoint(
                  "Mempunyai Prestasi Akademik maupun Non Akademik."),
              _buildBulletPoint("Tidak sedang menerima beasiswa lain."),
            ],
          ),
          _buildInfoCard(
            icon: Icons.workspace_premium_outlined,
            iconColor: Colors.brown.shade600,
            title: "Keuntungan Beasiswa",
            children: [
              _buildBulletPoint("Tunjangan hidup dalam 1 Semester."),
              _buildBulletPoint(
                  "Dana pengembangan diri (nontok buku, riset, atau seminar)."),
              _buildBulletPoint(
                  "Program mentoring eksklusif & jejaring profesional."),
            ],
          ),
          _buildInfoCard(
            icon: Icons.description_outlined,
            iconColor: Colors.blueGrey.shade700,
            title: "Berkas yang Diperlukan",
            children: [
              _buildBulletPoint(
                  "Kartu Pelajar, KK, dan Transkrip Nilai Raport terbaru."),
              _buildBulletPoint("Surat Keterangan dari Sekolah."),
              _buildBulletPoint("Sertifikat Prestasi."),
            ],
          ),
          _buildTimelineCard(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FormPendaftaranScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- CARD BUILDER ---
  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Widget> children,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: iconColor, size: 24),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSectionTitle(title, size: 20.0)),
                  ],
                ),
                const SizedBox(height: 12),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- TIMELINE BUILDER ---
  Widget _buildTimelineCard() {
    final List<Map<String, dynamic>> steps = [
      {
        "icon": Icons.how_to_reg,
        "title": "Masa Pendaftaran",
        "date": "15 - 30 September 2025",
        "color": Colors.blue.shade700,
      },
      {
        "icon": Icons.check_circle_outline,
        "title": "Verifikasi & Perbaikan Berkas",
        "date": "1 - 28 Oktober 2025",
        "color": Colors.orange.shade800,
      },
      {
        "icon": Icons.campaign,
        "title": "Pengumuman Akhir",
        "date": "1 Desember 2025",
        "color": Colors.green.shade700,
      },
    ];

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.timeline, color: Colors.deepPurple, size: 24),
                    SizedBox(width: 10),
                    Text(
                      "Masa Penerimaan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: List.generate(steps.length, (index) {
                    final step = steps[index];
                    final bool isLast = index == steps.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: step["color"].withOpacity(0.15),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: step["color"],
                                    width: 1.5,
                                  ),
                                ),
                                child: Icon(
                                  step["icon"],
                                  color: step["color"],
                                  size: 22,
                                ),
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: step["color"].withOpacity(0.4),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step["title"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: step["color"],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    step["date"],
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- SECTION TITLE ---
  Widget _buildSectionTitle(String title, {double size = 18.0}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF333333),
      ),
    );
  }

  // --- BULLET POINT ---
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "•  ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
