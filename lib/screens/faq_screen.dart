// file: lib/screens/faq_screen.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)

// Import untuk navigasi Drawer (sesuaikan path jika perlu)
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';

// --- 🔥 LANGKAH 1: IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang utama putih

      // --- 🔥 LANGKAH 2: GANTI SELURUH KODE DRAWER ---
      // 🔹 Drawer (Sekarang menggunakan widget terpusat)
      drawer: const AppDrawer(),
      // --- AKHIR PERUBAHAN DRAWER ---

      // 🔹 Body
      body: CustomScrollView(
        slivers: [
          // --- AppBar "Frosted Glass" ---
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
              "Tanya Jawab (FAQ)",
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
                    'Tanya Jawab',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Temukan jawaban untuk pertanyaan yang sering diajukan mengenai Sistem Beasiswa Badung Cerdas.',
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
                    _buildFaqItem(
                      context: context,
                      question: 'Apa itu Sistem Beasiswa Badung Cerdas?',
                      answer:
                          'Sistem Beasiswa Badung Cerdas adalah platform digital yang dirancang untuk mengelola proses pendaftaran, seleksi, dan verifikasi program beasiswa dari Pemerintah Kabupaten Badung. Sistem ini bertujuan untuk membuat prosesnya lebih transparan dan efisien bagi pendaftar.',
                    ),
                    const SizedBox(height: 16), // Beri jarak antar kartu
                    _buildFaqItem(
                      context: context, // Tambahkan context
                      question: 'Siapa saja yang bisa mendaftar?',
                      answer:
                          'Penerima beasiswa dibagi menjadi beberapa kategori: Siswa SD, Siswa SMP, Siswa SMA/SMK, dan Mahasiswa (D3/D4/S1). Pastikan Anda memeriksa persyaratan khusus untuk setiap kategori di halaman detail beasiswa.',
                    ),
                    const SizedBox(height: 16), // Beri jarak antar kartu
                    _buildFaqItem(
                      context: context, // Tambahkan context
                      question: 'Bagaimana cara mendaftar beasiswa?',
                      answer:
                          '1. Pastikan Anda sudah melengkapi data di "Profil Saya".\n2. Buka halaman "Beranda" untuk melihat beasiswa yang sedang dibuka.\n3. Pilih beasiswa yang sesuai dan klik "Daftar Sekarang".\n4. Unggah semua dokumen yang diperlukan.\n5. Pantau status pendaftaran Anda di halaman "Riwayat Pendaftaran".',
                    ),
                    const SizedBox(height: 16), // Beri jarak antar kartu
                    _buildFaqItem(
                      context: context, // Tambahkan context
                      question:
                          'Bagaimana jika status pendaftaran saya "Perbaikan Berkas"?',
                      answer:
                          'Itu berarti ada dokumen yang Anda unggah tidak valid atau kurang jelas. Segera buka halaman "Riwayat Pendaftaran", klik pada pendaftaran tersebut, dan unggah ulang dokumen yang diminta perbaikan sebelum batas waktu berakhir.',
                    ),
                    const SizedBox(height: 16), // Beri jarak antar kartu
                    _buildFaqItem(
                      context: context, // Tambahkan context
                      question: 'Apa itu "Verifikasi Pencairan"?',
                      answer:
                          'Halaman "Verifikasi Pencairan" digunakan untuk mengunggah bukti penggunaan dana (seperti nota atau kuitansi) setelah dana beasiswa berhasil dicairkan ke rekening Anda. Ini adalah bagian dari laporan pertanggungjawaban Anda sebagai penerima.',
                    ),
                    const SizedBox(height: 24), // Padding bawah
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget untuk Item FAQ (Tidak Berubah) ---
  Widget _buildFaqItem(
      {required BuildContext context,
      required String question,
      required String answer}) {
    // Kontainer untuk shadow, border, dan rounded corners
    return Container(
      decoration: BoxDecoration(
        // Set warna di sini, BUKAN di ExpansionTile, agar shadow terlihat
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey.shade200), // Border netral
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Shadow modern
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        // Memastikan ExpansionTile mengikuti rounded corners
        borderRadius: BorderRadius.circular(16.0),
        child: Theme(
          // Menghilangkan garis divider default
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            // Buat background transparan agar warna Container terlihat
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.white, // Saat terbuka, ganti jadi putih

            // Padding untuk judul
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),

            iconColor: Colors.orange.shade800, // Warna panah saat terbuka
            collapsedIconColor:
                Colors.grey.shade700, // Warna panah saat tertutup

            title: Text(
              question,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
                fontSize: 16,
              ),
            ),
            children: [
              Padding(
                // Padding untuk jawaban
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
