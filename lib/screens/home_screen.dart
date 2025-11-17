// file: lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:project_pkl/screens/faq_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';
import 'package:project_pkl/widgets/beasiswa_card.dart';
import 'dart:ui'; // Import untuk ImageFilter
import 'dart:async'; // Import untuk ScrollController
import 'package:flutter/rendering.dart'; // Import untuk ScrollDirection

import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';

// --- Pastikan Anda meng-import halaman detail Anda ---
import 'package:project_pkl/screens/detail_beasiswa_screen.dart';

// --- 🔥 IMPORT WIDGET DRAWER BARU ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

// --- Diubah menjadi StatefulWidget untuk mengelola state filter ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State untuk melacak filter aktif
  int _selectedFilterIndex = 0; // 0 = Semua, 1 = SD, dst.
  final List<String> _filters = ['Semua', 'SD', 'SMP', 'SMA', 'Kuliah'];

  // Widget helper untuk tombol filter
  Widget _buildFilterButton(int index) {
    bool isSelected = _selectedFilterIndex == index;
    return Padding(
      // Beri jarak di kanan kecuali untuk item terakhir
      padding: EdgeInsets.only(right: index == _filters.length - 1 ? 0 : 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedFilterIndex = index;
            // TODO: Tambahkan logika untuk memfilter daftar BeasiswaCard di bawah
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange.shade800 : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.orange.shade800,
          side: BorderSide(color: Colors.orange.shade800, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          elevation: isSelected ? 4 : 0,
        ),
        child: Text(_filters[index]),
      ),
    );
  }

  // Widget helper untuk membuat baris filter yang bisa di-scroll
  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Row(
        children: List.generate(
          _filters.length,
          (index) => _buildFilterButton(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildQuickLinkButton({
      required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: color, size: 32),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // --- 🔥 PERUBAHAN DI SINI ---
      // 🔹 Drawer (Sekarang jauh lebih rapi)
      drawer: const AppDrawer(),
      // --- AKHIR PERUBAHAN ---

      // --- Tombol FAQ kembali ke versi standar (pojok kanan) ---
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
      // --- Akhir Perubahan ---

      // 🔹 Body utama
      body: Stack(
        children: [
          // 🔸 Background floral
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_floral.jpg'),
                repeat: ImageRepeat.repeat,
                opacity: 0.4,
              ),
            ),
          ),

          // 🔸 Transisi lembut
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 70,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white60,
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),

          // 🔹 Konten utama
          CustomScrollView(
            slivers: [
              // --- APP BAR (Desain Asli HomeScreen) ---
              SliverAppBar(
                expandedHeight: 200.0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                centerTitle: false,
                titleSpacing: 0,
                leadingWidth: 72.0,
                leading: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                  child: Image.asset('assets/images/logo_badung.png'),
                ),
                title: Transform.translate(
                  offset: const Offset(0, 4.0),
                  child: const Text(
                    'SISTEM BEASISWA\nBADUNG CERDAS',
                    style: TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      iconSize: 30.0,
                      icon: const Icon(Icons.menu, color: Color(0xFF4A4A4A)),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
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

              // --- Selamat Datang ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Aplikasi ini dirancang untuk membantu masyarakat Kabupaten Badung dalam memperoleh informasi mengenai beasiswa yang disediakan pemerintah kabupaten Badung.',
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

              // --- Quick Links ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
                  child: Row(
                    children: [
                      _buildQuickLinkButton(
                        icon: Icons.history,
                        title: 'Riwayat\nPendaftaran',
                        color: Colors.blue.shade700,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RiwayatPendaftaranScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildQuickLinkButton(
                        icon: Icons.fact_check_outlined,
                        title: 'Verifikasi\nPencairan',
                        color: Colors.orange.shade800,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VerifikasiPencairanScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // --- Bagian Bawah Dengan Efek Blur ---
              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35.0),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade300.withOpacity(0.5),
                              width: 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Temukan Beasiswa',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E2E2E),
                              ),
                            ),

                            // --- Tombol Filter ---
                            const SizedBox(height: 16),
                            _buildFilterChips(),
                            const SizedBox(height: 16),

                            TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                hintText:
                                    'Cari Beasiswa Berdasarkan Kategori Penerima',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Center(
                              child: Text(
                                'Daftar Beasiswa yang Tersedia',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // --- Daftar BeasiswaCard ---
                            if (_selectedFilterIndex == 0 ||
                                _selectedFilterIndex == 2 ||
                                _selectedFilterIndex == 3)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailBeasiswaScreen(),
                                      ),
                                    );
                                  },
                                  child: const BeasiswaCard(
                                    judul: 'Beasiswa Anak Cerdas SMP dan SMA',
                                    nominal: 'Rp. 5.000.000,00',
                                    tanggal: '12 September 2025',
                                    posterPath:
                                        'assets/images/background_floral.jpg',
                                  ),
                                ),
                              ),

                            if (_selectedFilterIndex == 0 ||
                                _selectedFilterIndex == 1 ||
                                _selectedFilterIndex == 2)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailBeasiswaScreen(),
                                      ),
                                    );
                                  },
                                  child: const BeasiswaCard(
                                    judul: 'Beasiswa Simaksi SD dan SMP',
                                    nominal: 'Rp. 5.000.000,00',
                                    tanggal: '18 September 2025',
                                    posterPath:
                                        'assets/images/background_floral.jpg',
                                  ),
                                ),
                              ),

                            if (_selectedFilterIndex == 0 ||
                                _selectedFilterIndex == 2 ||
                                _selectedFilterIndex == 3 ||
                                _selectedFilterIndex == 4)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailBeasiswaScreen(),
                                      ),
                                    );
                                  },
                                  child: const BeasiswaCard(
                                    judul:
                                        'Beasiswa Anak Emas SMP, SMA, Kuliah',
                                    nominal: 'Rp. 5.000.000,00',
                                    tanggal: '12 September 2025',
                                    posterPath:
                                        'assets/images/background_floral.jpg',
                                  ),
                                ),
                              ),

                            if (_selectedFilterIndex == 0 ||
                                _selectedFilterIndex == 4)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailBeasiswaScreen(),
                                      ),
                                    );
                                  },
                                  child: const BeasiswaCard(
                                    judul: 'Beasiswa Vokasi D3/D4',
                                    nominal: 'Rp. 6.000.000,00',
                                    tanggal: '20 September 2025',
                                    posterPath:
                                        'assets/images/background_floral.jpg',
                                  ),
                                ),
                              ),

                            // Jarak tambahan di akhir list agar tidak tertutup FAB
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
