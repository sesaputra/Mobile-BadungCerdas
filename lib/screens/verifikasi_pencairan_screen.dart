// file: lib/screens/verifikasi_pencairan_screen.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk efek blur

// Import navigasi antar halaman
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/detail_verifikasi_screen.dart';

import 'package:project_pkl/screens/faq_screen.dart';

// --- 🔥 LANGKAH 1: IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

class VerifikasiPencairanScreen extends StatelessWidget {
  const VerifikasiPencairanScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

      body: CustomScrollView(
        slivers: [
          // === APP BAR (Desain "Frosted Glass") ===
          SliverAppBar(
            expandedHeight: 200,
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
              "Verifikasi Pencairan",
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

          // === JUDUL KONTEN ===
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Verifikasi Pencairan Beasiswa',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pilih beasiswa aktif Anda di bawah ini untuk melihat detail pencairan dana dan melakukan verifikasi yang diperlukan.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3E4A59),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Info Box Ditambahkan ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 16.0),
              child: _buildInfoBox(
                "Halaman ini hanya akan menampilkan beasiswa yang telah Anda daftarkan dan statusnya sudah 'Diterima'.",
              ),
            ),
          ),

          // --- KONTEN PUTIH DENGAN ROUNDED CORNER ---
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // === DAFTAR BEASISWA ===
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daftar Beasiswa Aktif",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E2E2E),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildBeasiswaCard(
                          context: context,
                          judul: "Beasiswa Anak Cerdas 2025",
                          status: "Lihat Detail",
                          statusColor: Colors.blue.shade700,
                          imageUrl: 'assets/images/background_floral.jpg',
                        ),
                        const SizedBox(height: 16),
                        _buildBeasiswaCard(
                          context: context,
                          judul: "Beasiswa Prestasi 2024",
                          status: "Selesai",
                          statusColor: Colors.green.shade700,
                          imageUrl: 'assets/images/background_floral.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BARU: Helper untuk Info Box ---
  Widget _buildInfoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200), // Border netral
        boxShadow: [
          // Shadow netral (modern)
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon biru untuk menandakan "Informasi"
          Icon(Icons.info_outline, color: Colors.blue.shade800, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                // Teks hitam (abu-abu gelap) sesuai permintaan
                color: Colors.grey.shade800,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // --- AKHIR WIDGET BARU ---

  // === WIDGET CARD BEASISWA ===
  Widget _buildBeasiswaCard({
    required BuildContext context,
    required String judul,
    required String status,
    required Color statusColor,
    required String imageUrl,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DetailVerifikasiScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias, // Memotong gambar di dalam
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text(
                judul,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
