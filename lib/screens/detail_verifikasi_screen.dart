// file: lib/screens/detail_verifikasi_screen.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)

// Import navigasi antar halaman
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/profile_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';

// --- 🔥 IMPORT WIDGET APP_DRAWER ANDA ---
import 'package:project_pkl/widgets/app_drawer.dart';

// --- 🔥 PENAMBAHAN: Enum untuk Status ---
// Mendefinisikan status yang mungkin untuk mempermudah pengelolaan
enum StatusVerifikasi { Terverifikasi, Menunggu, Tolak }
// --- AKHIR PENAMBAHAN ---

class DetailVerifikasiScreen extends StatefulWidget {
  const DetailVerifikasiScreen({super.key});

  @override
  State<DetailVerifikasiScreen> createState() => _DetailVerifikasiScreenState();
}

class _DetailVerifikasiScreenState extends State<DetailVerifikasiScreen> {
  // --- 🔥 PENAMBAHAN: Controller untuk modal tambah ---
  final _keteranganController = TextEditingController();
  final _nominalController = TextEditingController();

  @override
  void dispose() {
    // Jangan lupa dispose controller
    _keteranganController.dispose();
    _nominalController.dispose();
    super.dispose();
  }
  // --- AKHIR PENAMBAHAN ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- 🔥 DRAWER SUDAH DIPERBARUI ---
      // 🔹 Drawer (Sekarang menggunakan widget terpusat)
      drawer: const AppDrawer(),
      // --- AKHIR PERUBAHAN DRAWER ---

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
              "Detail Verifikasi",
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

          // --- Judul Halaman (Sesuai Desain Baru) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Verifikasi Pencairan Beasiswa',
                    style: TextStyle(
                      fontSize: 26, // Sedikit lebih kecil agar pas
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pada halaman ini, Anda dapat melacak status pencairan dana beasiswa.',
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
              child: _buildInfoBox(
                "Unggah bukti penggunaan dana Anda di sini. Pastikan bukti yang diunggah jelas dan sesuai.",
              ),
            ),
          ),
          // --- AKHIR Info Box ---

          // --- Bagian Putih (Konten Sesuai Desain Baru) ---
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(35.0),
                ),
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Status Verifikasi ---
                    const Text(
                      'Status Verifikasi dana Beasiswa',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3E4A59),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildStatusRow(Icons.check_circle, 'Terverifikasi',
                        Colors.green.shade700),
                    const SizedBox(height: 8),
                    _buildStatusRow(Icons.hourglass_empty,
                        'Menunggu Verifikasi', Colors.amber.shade700),
                    const SizedBox(height: 8),
                    _buildStatusRow(Icons.cancel, 'Tolak', Colors.red.shade700),
                    const SizedBox(height: 24),

                    // --- Header Beasiswa + Tombol ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Beasiswa Anak Emas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E2E2E),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 16),
                          label: const Text('Verifikasi Pencairan'),
                          onPressed: () {
                            // Panggil modal tambah
                            _showTambahVerifikasiModal(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade800,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // --- Daftar Verifikasi ---
                    const Text(
                      'Daftar Verifikasi Pencairan Dana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4A59),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        // Contoh item yang terverifikasi
                        _buildVerifikasiItem(
                            context,
                            '12 Agustus 2025',
                            'Pembayaran kost semester genap tahun ajaran 2025/2026', // <-- CONTOH TEKS PANJANG
                            '500.000,00',
                            StatusVerifikasi.Terverifikasi),

                        const SizedBox(height: 12), // Memberi "space"

                        // Contoh item yang menunggu
                        _buildVerifikasiItem(
                            context,
                            '11 Agustus 2025',
                            'Pembelian buku referensi mata kuliah wajib', // <-- CONTOH TEKS PANJANG
                            '250.000,00',
                            StatusVerifikasi.Menunggu),

                        const SizedBox(height: 12), // Memberi "space"

                        // Contoh item yang ditolak
                        _buildVerifikasiItem(
                            context,
                            '10 Agustus 2025',
                            'Transportasi (Nota tidak jelas)',
                            '150.000,00',
                            StatusVerifikasi.Tolak),

                        const Divider(height: 32, color: Color(0xFFE0E0E0)),

                        // Saldo Footer
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Saldo',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              Text(
                                'Rp. 3.500.000,00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // --- Penambahan Jarak Bawah ---
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper untuk Info Box ---
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

  /// Helper untuk status (Terverifikasi / Tolak)
  Widget _buildStatusRow(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }

  /// Helper untuk item di dalam daftar verifikasi (Card Individual)
  Widget _buildVerifikasiItem(
    BuildContext context,
    String tanggal,
    String keterangan,
    String nominal,
    StatusVerifikasi status,
  ) {
    // Logika untuk menentukan ikon & warna (Tidak berubah)
    IconData statusIcon;
    Color statusColor;

    switch (status) {
      case StatusVerifikasi.Terverifikasi:
        statusIcon = Icons.check_circle;
        statusColor = Colors.green.shade700;
        break;
      case StatusVerifikasi.Menunggu:
        statusIcon = Icons.hourglass_empty;
        statusColor = Colors.amber.shade700;
        break;
      case StatusVerifikasi.Tolak:
        statusIcon = Icons.cancel;
        statusColor = Colors.red.shade700;
        break;
    }

    return InkWell(
      onTap: () {
        _showDetailModal(context, tanggal, keterangan, nominal, status);
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          // --- 🔥 PERUBAHAN 1: Ratakan ke atas ---
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tanggal
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                tanggal,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800),
              ),
            ),
            const SizedBox(width: 12),
            // Keterangan
            Expanded(
              child: Text(
                keterangan,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                // --- 🔥 PERUBAHAN 2: Hapus overflow agar teks bisa wrap ---
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            // Ikon Status
            Icon(statusIcon, color: statusColor, size: 20),
            const SizedBox(width: 12),
            // Nominal
            Text(
              nominal,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade900),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper untuk Modal Row
  Widget _buildModalRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 15)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  // --- 🔥 WIDGET BARU: Helper untuk Modal Row Status (dengan warna) ---
  Widget _buildModalStatusRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 15)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: color, // Warna dinamis
              ),
            ),
          ),
        ],
      ),
    );
  }
  // --- AKHIR WIDGET BARU ---

  /// Fungsi untuk menampilkan Modal DETAIL
  void _showDetailModal(
    BuildContext context,
    String tanggal,
    String keterangan,
    String nominal,
    StatusVerifikasi status,
  ) {
    // Logika untuk teks & warna status
    String statusText;
    Color statusColor;

    switch (status) {
      case StatusVerifikasi.Terverifikasi:
        statusText = 'Terverifikasi';
        statusColor = Colors.green.shade700;
        break;
      case StatusVerifikasi.Menunggu:
        statusText = 'Menunggu Verifikasi';
        statusColor = Colors.amber.shade700;
        break;
      case StatusVerifikasi.Tolak:
        statusText = 'Tolak';
        statusColor = Colors.red.shade700;
        break;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 12,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Handle
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Judul Modal
              const Text(
                'Detail Verifikasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 24),

              // 3. Konten Detail
              _buildModalRow('Tanggal:', tanggal),
              _buildModalRow('Keterangan:', keterangan),
              _buildModalRow('Nominal:', 'Rp. $nominal'),
              _buildModalStatusRow('Status:', statusText, statusColor),
              const Divider(height: 32),

              // 4. Contoh Bukti
              const Text(
                'Bukti Pembayaran:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background_floral.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                    child: Text(
                  '[Contoh Bukti Nota]',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                )),
              ),
              const SizedBox(height: 24),

              // 5. Tombol Tutup
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    // Warna tombol tetap orange
                    backgroundColor: Colors.orange.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Tutup',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- 🔥 FUNGSI BARU: Menampilkan modal TAMBAH VERIFIKASI ---
  void _showTambahVerifikasiModal(BuildContext context) {
    // Bersihkan controller setiap kali modal dibuka
    _keteranganController.clear();
    _nominalController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Penting agar keyboard tidak menutupi
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 12,
            // Ini membuat modal naik di atas keyboard
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Handle
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Judul Modal
              const Text(
                'Tambah Verifikasi Pencairan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 24),

              // 3. Form Input
              TextField(
                controller: _keteranganController,
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                  hintText: 'Contoh: Pembayaran UKT Semester 5',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.description_outlined),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nominalController,
                decoration: InputDecoration(
                  labelText: 'Nominal',
                  hintText: 'Contoh: 500000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.attach_money_outlined),
                  prefixText: 'Rp. ',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // 4. Tombol Upload Bukti
              OutlinedButton.icon(
                icon: const Icon(Icons.upload_file_outlined),
                label: const Text('Unggah Bukti Pembayaran'),
                onPressed: () {
                  // TODO: Implementasi logika untuk memilih file/gambar
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  foregroundColor: Colors.grey.shade800,
                  side: BorderSide(color: Colors.grey.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 5. Tombol Aksi (Batal & Simpan)
              Row(
                children: [
                  // Tombol Batal
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          foregroundColor: Colors.grey.shade700,
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Batal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Simpan
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.orange.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        // TODO: Implementasi logika simpan data
                        final keterangan = _keteranganController.text;
                        final nominal = _nominalController.text;
                        print('Keterangan: $keterangan, Nominal: $nominal');

                        Navigator.pop(ctx); // Tutup modal setelah simpan
                      },
                      child: const Text('Simpan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  // --- AKHIR FUNGSI BARU ---
}
