// file: lib/screens/status_pendaftaran_screen.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)

// Import untuk navigasi Drawer
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';

import 'package:project_pkl/screens/faq_screen.dart';

// --- 🔥 LANGKAH 1: IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

class StatusPendaftaranScreen extends StatelessWidget {
  const StatusPendaftaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk timeline
    final List<Map<String, dynamic>> timelineSteps = [
      {
        "title": "Pendaftaran",
        "subtitle": "Lulus",
        "date": "(12 Agustus 2025)",
        "color": Colors.green.shade700,
        "icon": Icons.check,
      },
      {
        "title": "Verifikasi Dokumen",
        "subtitle": "Lulus",
        "date": "(12 Agustus 2025)",
        "color": Colors.green.shade700,
        "icon": Icons.check,
      },
      {
        "title": "Seleksi Penerima",
        "subtitle": "Lulus",
        "date": "(12 Agustus 2025)",
        "color": Colors.green.shade700,
        "icon": Icons.check,
      },
      {
        "title": "Pencairan Dana",
        "subtitle": "Selesai",
        "date": "(12 Agustus 2025)",
        "color": Colors.green.shade700,
        "icon": Icons.check,
      },
      {
        "title": "Verifikasi Pencairan Dana",
        "subtitle": "Terverifikasi",
        "date": "(12 Agustus 2025)",
        "color": Colors.blue.shade700,
        "icon": Icons.check_circle, // Icon berbeda untuk step terakhir
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // --- 🔥 LANGKAH 2: GANTI SELURUH KODE DRAWER ---
      // 🔹 Drawer (Sekarang menggunakan widget terpusat)
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

      // 🔹 Body
      body: CustomScrollView(
        slivers: [
          // --- APP BAR (Sama seperti halaman lain) ---
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
              "Status Pendaftaran",
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
          // --- AKHIR APP BAR ---

          // --- Judul Halaman ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status Pendaftaran Beasiswa',
                    style: TextStyle(
                      fontSize: 30, // Sedikit lebih kecil agar pas
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pada halaman ini anda dapat melihat status pendaftaran anda.',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF3E4A59),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Info Box ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 16.0),
              child: _buildInfoBox(),
            ),
          ),

          // --- Poster (Sesuai Desain) ---
          SliverToBoxAdapter(
            child: Padding(
              // Sesuaikan padding atas agar ada jarak dari info box
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background_floral.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.6, // Dibuat sedikit lebih jelas
                  ),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Text(
                    'Poster\nBeasiswa Anak Cerdas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- Timeline Status ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
              child: Column(
                children: List.generate(timelineSteps.length, (index) {
                  final step = timelineSteps[index];
                  return _buildTimelineStep(
                    title: step["title"],
                    subtitle: step["subtitle"],
                    date: step["date"],
                    color: step["color"],
                    icon: step["icon"],
                    isLastStep: index == timelineSteps.length - 1,
                  );
                }),
              ),
            ),
          ),

          // --- Tombol Kembali Dihapus ---
        ],
      ),
    );
  }

  // --- WIDGET Info Box ---
  /// Helper untuk membangun Info Box
  Widget _buildInfoBox() {
    return Container(
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
              'Status di bawah ini diperbarui secara real-time. Jika status Anda "Perbaikan Berkas", harap perbarui dokumen Anda di halaman profil.',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper untuk membangun satu baris timeline status
  Widget _buildTimelineStep({
    required String title,
    required String subtitle,
    required String date,
    required Color color,
    required IconData icon,
    bool isLastStep = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kiri: Ikon dan Garis
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 16),
              ),
              if (!isLastStep)
                Expanded(
                  child: Container(
                    width: 2,
                    color: color,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Kanan: Teks
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
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
}
