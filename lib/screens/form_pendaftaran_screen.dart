import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)

// --- 🔥 GANTI IMPORT INI SESUAI LOKASI FILE ANDA ---
// (Pastikan path ke halaman-halaman ini benar)
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';
// ---

// --- 🔥 TAMBAHAN: Import untuk Halaman FAQ ---
import 'package:project_pkl/screens/faq_screen.dart';
// ---

// 1. Diubah menjadi StatefulWidget karena ini adalah halaman form
class FormPendaftaranScreen extends StatefulWidget {
  const FormPendaftaranScreen({super.key});

  @override
  State<FormPendaftaranScreen> createState() => _FormPendaftaranScreenState();
}

class _FormPendaftaranScreenState extends State<FormPendaftaranScreen> {
  // --- Controller untuk field statis ---
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _alamatController = TextEditingController();
  final _nikController = TextEditingController();
  final _kkController = TextEditingController();
  final _namaIbuController = TextEditingController();
  final _sekolahController = TextEditingController();
  final _alamatSekolahController = TextEditingController();

  // --- List untuk field dinamis ---
  final List<Map<String, dynamic>> _dokumenTambahan = [];

  // Style untuk form field (sebelum di-input)
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide.none, // Dihilangkan agar shadow terlihat
  );

  // Border untuk state "focus" (saat di-input)
  final focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: Colors.blue.shade700, width: 2.0),
  );

  @override
  void dispose() {
    // Dispose semua controller statis
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    _nikController.dispose();
    _kkController.dispose();
    _namaIbuController.dispose();
    _sekolahController.dispose();
    _alamatSekolahController.dispose();

    // Dispose semua controller dinamis
    for (var doc in _dokumenTambahan) {
      doc['namaController'].dispose();
    }
    super.dispose();
  }

  // --- Fungsi untuk menambah dokumen ---
  void _tambahDokumen() {
    setState(() {
      _dokumenTambahan.add({
        'namaController': TextEditingController(),
        'fileName': null,
      });
    });
  }

  // --- Fungsi untuk menghapus dokumen ---
  void _hapusDokumen(int index) {
    setState(() {
      _dokumenTambahan[index]['namaController'].dispose();
      _dokumenTambahan.removeAt(index);
    });
  }

  // Fungsi untuk memilih tanggal (dari gambar)
  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        String formattedDate = "${picked.day}/${picked.month}/${picked.year}";
        _tanggalLahirController.text = formattedDate;
      });
    }
  }

  // Fungsi untuk memilih file (placeholder)
  void _pilihFile() {
    // TODO: Implementasikan logika file picker di sini
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logika pilih file belum diimplementasi.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- 🔥 TAMBAHAN: Tombol FAQ ---
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
      // --- Akhir Tambahan ---

      body: Stack(
        children: [
          // Background floral (sebagai dasar)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_floral.jpg'),
                repeat: ImageRepeat.repeat,
                opacity: 0.4,
              ),
            ),
          ),

          // Konten Scroll
          CustomScrollView(
            slivers: [
              // --- AppBar (Sesuai Desain "Frosted Glass") ---
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
                  "Form Pendaftaran", // Judul Halaman
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
                              icon: const Icon(Icons.menu,
                                  color: Color(0xFF4A4A4A)),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
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

              // --- Konten Form Putih Rounded ---
              SliverToBoxAdapter(
                child: Container(
                  // Dekorasi container putih rounded
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
                        // --- Judul ---
                        const Text(
                          'Form Pendaftaran Beasiswa',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lengkapi data di bawah untuk melanjutkan proses pendaftaran',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF3E4A59),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // --- Info Box (dari kode sebelumnya) ---
                        _buildInfoBox(
                          "Data dari formulir ini akan diambil dari halaman profil Anda. Pastikan data di profil Anda sudah benar.",
                        ),
                        const SizedBox(height: 24),

                        // --- 🔥 PERUBAHAN: Poster (Shadow Dihapus) ---
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/background_floral.jpg'),
                                fit: BoxFit.cover,
                                opacity: 0.3),
                            border: Border.all(color: Colors.grey.shade300),
                            // boxShadow: [...] // <-- Shadow dihapus dari sini
                          ),
                          child: Center(
                            child: Text(
                              'Poster\nBeasiswa Anak Cerdas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                        // --- AKHIR PERUBAHAN ---
                        const SizedBox(height: 24),

                        // --- Form Statis ---
                        _buildTextField("Nama", _namaController),
                        _buildDateField(
                            "Tanggal Lahir", _tanggalLahirController),
                        _buildTextField("Alamat", _alamatController),
                        _buildTextField("NIK", _nikController,
                            keyboardType: TextInputType.number),
                        _buildTextField("No. Kartu Keluarga", _kkController,
                            keyboardType: TextInputType.number),
                        _buildTextField("Nama Ibu", _namaIbuController),
                        _buildTextField(
                            "Sekolah/Universitas", _sekolahController),
                        _buildTextField("Alamat Sekolah/Universitas",
                            _alamatSekolahController),
                        const SizedBox(height: 16),

                        // --- Dokumen Wajib ---
                        const Text(
                          'Dokumen Pelengkap (Wajib)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFileUploadField("Kartu Keluarga",
                            onTap: _pilihFile),
                        _buildFileUploadField("Nilai Raport Terakhir",
                            onTap: _pilihFile),
                        const SizedBox(height: 24),

                        // --- Dokumen Dinamis ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dokumen Tambahan (Opsional)',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            // Tombol "Tambah Dokumen"
                            IconButton(
                              icon: const Icon(Icons.add_circle),
                              color: Colors.green.shade600,
                              onPressed: _tambahDokumen,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // List dinamis
                        Column(
                          children:
                              List.generate(_dokumenTambahan.length, (index) {
                            return _buildDynamicUploadField(
                              index: index,
                              controller: _dokumenTambahan[index]
                                  ['namaController'],
                              onRemove: () => _hapusDokumen(index),
                              onUpload: _pilihFile,
                            );
                          }),
                        ),
                        // --- Akhir Dokumen Dinamis ---

                        const SizedBox(height: 24),
                        // --- Helper Teks ---
                        Text(
                          '*Anda dapat memilih tombol simpan untuk menyimpan sementara dokumen anda sebelum mengupload.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.red.shade700,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '*Tombol Upload untuk langsung melakukan upload dokumen pendaftaran.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.red.shade700,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 24),

                        // --- Tombol Aksi (Disesuaikan) ---
                        Row(
                          children: [
                            // Tombol Upload (dibuat rounded)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade800,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0)), // Rounded
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text('Upload',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(width: 16), // Jarak antar tombol
                            // Tombol Simpan (dibuat rounded)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade600,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0)), // Rounded
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text('Simpan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            // Tombol Kembali (Dihapus)
                          ],
                        ),
                        const SizedBox(height: 24), // Padding Bawah
                      ],
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

  // --- Helper Widget ---

  /// Helper untuk Info Box (Putih + Shadow + Teks Hitam/Netral)
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
                // Teks hitam (abu-abu gelap)
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

  // --- 🔥 PERUBAHAN: Form dengan Shadow ---

  /// Field Teks Biasa
  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      // 1. Bungkus dengan Container untuk shadow
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade700),
            filled: true,
            fillColor: Colors.transparent, // 2. Buat transparan
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: focusedInputBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
      ),
    );
  }

  /// Field Tanggal Lahir
  Widget _buildDateField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      // 1. Bungkus dengan Container untuk shadow
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          readOnly: true,
          onTap: () => _pilihTanggal(context),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade700),
            filled: true,
            fillColor: Colors.transparent, // 2. Buat transparan
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: focusedInputBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.calendar_today, color: Colors.grey.shade700),
            ),
          ),
        ),
      ),
    );
  }

  /// Field Upload File (Statis)
  Widget _buildFileUploadField(String label, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      // 1. Bungkus dengan Container untuk shadow
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade700),
            filled: true,
            fillColor: Colors.transparent, // 2. Buat transparan
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: focusedInputBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 12.0),
              child: Icon(Icons.upload_file, color: Colors.grey.shade700),
            ),
          ),
        ),
      ),
    );
  }
  // --- AKHIR PERUBAHAN HELPER ---

  /// Field Upload File (Dinamis)
  Widget _buildDynamicUploadField({
    required int index,
    required TextEditingController controller,
    required VoidCallback onRemove,
    required VoidCallback onUpload,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          // Field untuk nama dokumen
          Row(
            children: [
              Expanded(
                child: _buildTextField("Nama Dokumen ${index + 1}", controller),
              ),
              const SizedBox(width: 8),
              // Tombol Hapus
              IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Colors.red.shade700,
                onPressed: onRemove,
              ),
            ],
          ),
          // Field untuk upload file-nya
          _buildFileUploadField("Upload File Dokumen ${index + 1}",
              onTap: onUpload),
        ],
      ),
    );
  }
}
