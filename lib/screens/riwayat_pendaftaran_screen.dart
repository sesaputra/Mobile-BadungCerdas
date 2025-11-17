// file: lib/screens/riwayat_pendaftaran_screen.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';

import 'package:project_pkl/screens/status_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';

import 'package:project_pkl/screens/faq_screen.dart';

// --- 🔥 LANGKAH 1: IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

class RiwayatPendaftaranScreen extends StatefulWidget {
  const RiwayatPendaftaranScreen({super.key});

  @override
  State<RiwayatPendaftaranScreen> createState() =>
      _RiwayatPendaftaranScreenState();
}

class _RiwayatPendaftaranScreenState extends State<RiwayatPendaftaranScreen> {
  int _selectedIndex = 0; // 0 = Sedang Berjalan, 1 = Selesai

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
          // --- APP BAR (Sudah Sesuai Desain "Frosted Glass") ---
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
              "Riwayat Pendaftaran",
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

          // --- Judul Halaman (Tidak berubah) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar Beasiswa',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pada halaman ini, Anda dapat melihat beasiswa yang telah Anda daftarkan serta status penerimaannya.',
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

          // --- Info Box Ditambahkan ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 16.0),
              child: _buildInfoBox(
                'Klik pada salah satu item di bawah untuk melihat detail progres pendaftaran Anda.',
              ),
            ),
          ),

          // --- KONTEN PUTIH DENGAN ROUNDED CORNER ---
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildToggleButtons(),
                    const SizedBox(height: 24),
                    IndexedStack(
                      index: _selectedIndex,
                      children: [
                        _buildListSedangBerjalan(context),
                        _buildListSelesai(context),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Toggle Buttons (Warna Oranye) ---
  Widget _buildToggleButtons() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 0
                    ? Colors.orange.shade800
                    : Colors.transparent,
                foregroundColor:
                    _selectedIndex == 0 ? Colors.white : Colors.grey.shade700,
                elevation: _selectedIndex == 0 ? 2 : 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Sedang Berjalan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 1
                    ? Colors.orange.shade800
                    : Colors.transparent,
                foregroundColor:
                    _selectedIndex == 1 ? Colors.white : Colors.grey.shade700,
                elevation: _selectedIndex == 1 ? 2 : 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Selesai',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }

  // --- List "Sedang Berjalan" ---
  Widget _buildListSedangBerjalan(BuildContext context) {
    return Column(
      children: [
        _buildRiwayatCard(
          context,
          "Beasiswa Anak Cerdas",
          "Diproses",
          Colors.orange.shade700,
          'assets/images/background_floral.jpg', // Path gambar
        ),
        const SizedBox(height: 16),
        _buildRiwayatCard(
          context,
          "Beasiswa Simaksi",
          "Perbaikan Berkas",
          Colors.red.shade700,
          'assets/images/background_floral.jpg', // Path gambar
        ),
        const SizedBox(height: 16),
        _buildRiwayatCard(
          context,
          "Beasiswa Generasi Emas",
          "Verifikasi",
          Colors.blue.shade700,
          'assets/images/background_floral.jpg', // Path gambar
        ),
      ],
    );
  }

  // --- List "Selesai" ---
  Widget _buildListSelesai(BuildContext context) {
    return Column(
      children: [
        _buildRiwayatCard(
          context,
          "Beasiswa Prestasi 2024",
          "Diterima",
          Colors.green.shade700,
          'assets/images/background_floral.jpg', // Path gambar
        ),
        const SizedBox(height: 16),
        _buildRiwayatCard(
          context,
          "Beasiswa Kurang Mampu 2024",
          "Ditolak",
          Colors.grey.shade700,
          'assets/images/background_floral.jpg', // Path gambar
        ),
      ],
    );
  }

  // Widget Card (Tidak berubah)
  Widget _buildRiwayatCard(
    BuildContext context,
    String judul,
    String status,
    Color statusColor,
    String imageUrl,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StatusPendaftaranScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 6,
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
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.0),
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

  // --- Widget Info Box ---
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
}
