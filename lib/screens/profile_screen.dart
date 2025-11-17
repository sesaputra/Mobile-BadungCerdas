import 'package:flutter/material.dart';
import 'dart:ui'; // Diperlukan untuk ImageFilter (efek blur)

// Import untuk navigasi Drawer
import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/riwayat_pendaftaran_screen.dart';
import 'package:project_pkl/screens/verifikasi_pencairan_screen.dart';

// --- 🔥 PERUBAHAN 1: Import halaman FAQ (untuk tombol dan Drawer) ---
import 'package:project_pkl/screens/faq_screen.dart';
// ---

// 1. Diubah menjadi StatefulWidget karena ini adalah halaman form
class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  // 2. Buat controller untuk setiap field
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _alamatPribadiController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponPribadiController = TextEditingController();
  final _sekolahController = TextEditingController();
  final _alamatSekolahController = TextEditingController();
  final _nikController = TextEditingController();
  final _kkController = TextEditingController();
  final _namaAyahController = TextEditingController();
  final _pekerjaanAyahController = TextEditingController();
  final _gajiAyahController = TextEditingController();
  final _teleponAyahController = TextEditingController();
  final _namaIbuController = TextEditingController();
  final _pekerjaanIbuController = TextEditingController();
  final _gajiIbuController = TextEditingController();
  final _teleponIbuController = TextEditingController();
  final _alamatOrtuController = TextEditingController();
  final _jenisTinggalController = TextEditingController();
  final _jenisKepemilikanController = TextEditingController();
  final _alamatSewaController = TextEditingController();
  final _biayaSewaController = TextEditingController();

  // (ScrollController tidak diperlukan jika tombolnya statis)

  // Form lebih rounded (30.0)
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: Colors.grey.shade400.withOpacity(0.7)),
  );

  // Border untuk state "focus" (UX lebih baik)
  final focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: Colors.blue.shade700, width: 2.0),
  );

  // 4. Fungsi untuk menampilkan Date Picker
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

  // 5. Dispose semua controller
  @override
  void dispose() {
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatPribadiController.dispose();
    _emailController.dispose();
    _teleponPribadiController.dispose();
    _sekolahController.dispose();
    _alamatSekolahController.dispose();
    _nikController.dispose();
    _kkController.dispose();
    _namaAyahController.dispose();
    _pekerjaanAyahController.dispose();
    _gajiAyahController.dispose();
    _teleponAyahController.dispose();
    _namaIbuController.dispose();
    _pekerjaanIbuController.dispose();
    _gajiIbuController.dispose();
    _teleponIbuController.dispose();
    _alamatOrtuController.dispose();
    _jenisTinggalController.dispose();
    _jenisKepemilikanController.dispose();
    _alamatSewaController.dispose();
    _biayaSewaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 Drawer (disalin dari halaman lain, 'Profil Saya' disesuaikan)
      drawer: Drawer(
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
                  image:
                      const AssetImage('assets/images/background_floral.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey.shade700),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.grey.shade700),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context); // Sudah di halaman profil
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.grey.shade700),
              title: const Text('Riwayat Pendaftaran'),
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
            ListTile(
              leading: Icon(Icons.fact_check, color: Colors.grey.shade700),
              title: const Text('Verifikasi Pencairan'),
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
            // --- 🔥 TAMBAHAN: Link ke FAQ di Drawer ---
            ListTile(
              leading: Icon(Icons.quiz, color: Colors.grey.shade700),
              title: const Text('Tanya Jawab (FAQ)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FaqScreen()),
                );
              },
            ),
            // ---
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey.shade700),
              title: const Text('Pengaturan'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade700),
              title: const Text('Keluar'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // --- 🔥 PERUBAHAN 2: Tambahkan Tombol FAQ (Statis) ---
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

      // 🔹 Body dengan Stack (Background + Konten Scroll)
      body: Stack(
        children: [
          // Background floral
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
            // (Controller tidak diperlukan lagi untuk FAB statis)
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
                  "Profil Saya",
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

              // --- Judul Halaman ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Halaman Profile',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lengkapi data di bawah sebelum anda melakukan daftar beasiswa. Dimohon mengisi dengan jujur dan sesuai dengan data real.',
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
                    'Pastikan data yang Anda masukkan valid dan sesuai dengan dokumen resmi (KTP & Kartu Keluarga) Anda.',
                  ),
                ),
              ),

              // --- Konten Form (Bagian Bawah Dengan Efek Blur Tipis) ---
              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35.0),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade300.withOpacity(0.4),
                              width: 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // --- Foto Profil ---
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Foto\nProfile User",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange.shade800,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: const Text("Unggah Foto"),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    "Silakan gunakan foto berlatar belakang merah, dengan menggunakan seragam sekolah atau kemeja putih berdasi hitam.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade800,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // --- Data Pribadi ---
                            _buildSectionHeader("Data Pribadi"),
                            _buildTextField("Nama", "contoh: Rizky Haryanto",
                                _namaController,
                                prefixIcon: Icons.person_outline_rounded),
                            _buildDateField("Tanggal Lahir",
                                "contoh: 12/01/2001", _tanggalLahirController),
                            _buildTextField(
                                "Alamat",
                                "contoh: JL. Pulau Nias No 12, Petang, Badung",
                                _alamatPribadiController,
                                prefixIcon: Icons.home_outlined),
                            _buildTextField(
                                "Email",
                                "contoh: RizkyHaryanto@example.com",
                                _emailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email_outlined),
                            _buildTextField(
                                "No. Telepon",
                                "contoh: 081 001 002 003",
                                _teleponPribadiController,
                                keyboardType: TextInputType.phone,
                                prefixIcon: Icons.phone_outlined),
                            _buildTextField(
                                "Sekolah/ Universitas",
                                "contoh: Politeknik Negeri Bali",
                                _sekolahController,
                                prefixIcon: Icons.school_outlined),
                            _buildTextField(
                                "Alamat Sekolah/ Universitas",
                                "contoh: JL. Pulau Kawe No 12, Jimbaran, Badung",
                                _alamatSekolahController,
                                prefixIcon: Icons.map_outlined),
                            _buildTextField("NIK",
                                "contoh: 1234 1234 1234 1234", _nikController,
                                keyboardType: TextInputType.number,
                                prefixIcon: Icons.badge_outlined),
                            _buildTextField("No. Kartu Keluarga",
                                "contoh: 1234 1234 1234 5678", _kkController,
                                keyboardType: TextInputType.number,
                                prefixIcon: Icons.group_outlined),

                            // --- Data Orang Tua ---
                            _buildSectionHeader("Data Orang Tua"),
                            _buildTextField("Nama Ayah",
                                "contoh: Agus Prasetyo", _namaAyahController,
                                prefixIcon: Icons.person_outline_rounded),
                            _buildTextField(
                                "Pekerjaan",
                                "contoh: Karyawan Swasta",
                                _pekerjaanAyahController,
                                prefixIcon: Icons.work_outline_rounded),
                            _buildTextField("Gaji", "contoh: 5.000.000,00",
                                _gajiAyahController,
                                keyboardType: TextInputType.number,
                                prefixIcon:
                                    Icons.account_balance_wallet_outlined),
                            _buildTextField(
                                "No. Telepon",
                                "contoh: 081 001 002 003",
                                _teleponAyahController,
                                keyboardType: TextInputType.phone,
                                prefixIcon: Icons.phone_outlined),
                            _buildTextField("Nama Ibu", "contoh: Sari Utami",
                                _namaIbuController,
                                prefixIcon: Icons.person_outline_rounded),
                            _buildTextField(
                                "Pekerjaan",
                                "contoh: Ibu Rumah Tangga",
                                _pekerjaanIbuController,
                                prefixIcon: Icons.work_outline_rounded),
                            _buildTextField("Gaji", "contoh: 1.000.000,00",
                                _gajiIbuController,
                                keyboardType: TextInputType.number,
                                prefixIcon:
                                    Icons.account_balance_wallet_outlined),
                            _buildTextField(
                                "No. Telepon",
                                "contoh: 081 001 002 003",
                                _teleponIbuController,
                                keyboardType: TextInputType.phone,
                                prefixIcon: Icons.phone_outlined),
                            _buildTextField(
                                "Alamat",
                                "contoh: JL. Nusa Indah No 12, Petang, Badung",
                                _alamatOrtuController,
                                prefixIcon: Icons.home_outlined),

                            // --- Data Pelengkap ---
                            _buildSectionHeader("Data Pelengkap"),
                            _buildTextField(
                                "Jenis Tinggal",
                                "contoh: Bersama Orang Tua",
                                _jenisTinggalController,
                                prefixIcon: Icons.home_work_outlined),
                            _buildTextField(
                                "Jenis Kepemilikan",
                                "contoh: Milik Pribadi",
                                _jenisKepemilikanController,
                                prefixIcon: Icons.verified_user_outlined),
                            _buildTextField(
                                "Alamat",
                                "contoh: JL. Nusa Indah No 12, Petang, Badung",
                                _alamatSewaController,
                                prefixIcon: Icons.map_outlined),
                            _buildTextField("Biaya Sewa Perbulan",
                                "contoh: 500.000,00", _biayaSewaController,
                                keyboardType: TextInputType.number,
                                prefixIcon: Icons.price_change_outlined),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "* Jika jenis kepemilikan dari tempat tinggal anda adalah sewa, maka anda wajib mengisi tarif sewa dalam 1 bulan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade800,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // --- Tombol Simpan (Warna Oranye) ---
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // TODO: Aksi Simpan
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange.shade800,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: const Text(
                                      "Simpan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                // Tombol Kembali dihapus
                              ],
                            ),

                            // --- Jarak untuk FAB ---
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

  // --- 🔥 PERUBAHAN DI SINI 🔥 ---
  /// Helper untuk Info Box (Putih + Shadow + Teks Hitam/Netral)
  Widget _buildInfoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(12.0),
        // Border abu-abu netral
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          // Shadow abu-abu netral (hitam transparan)
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
          // Ikon tetap biru untuk menandakan "Informasi"
          Icon(Icons.info_outline, color: Colors.blue.shade800, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                // Teks diubah menjadi hitam lembut (abu-abu gelap)
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

  // Helper untuk Judul Section
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  // Helper untuk TextField biasa
  Widget _buildTextField(
    String label,
    String hintText,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF4A4A4A)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey.shade700)
              : null,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: focusedInputBorder,
          filled: true,
          fillColor: Colors.white.withOpacity(0.95),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }

  // Helper khusus untuk Tanggal Lahir
  Widget _buildDateField(
      String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () => _pilihTanggal(context),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF4A4A4A)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon:
              Icon(Icons.calendar_today_outlined, color: Colors.grey.shade700),
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: focusedInputBorder,
          filled: true,
          fillColor: Colors.white.withOpacity(0.95),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }
}
