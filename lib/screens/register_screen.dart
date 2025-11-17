import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();
  final _sekolahController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _setujuKebijakan = false;

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        String formattedDate = "${picked.day}-${picked.month}-${picked.year}";
        _tanggalLahirController.text = formattedDate;
      });
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    _emailController.dispose();
    _teleponController.dispose();
    _sekolahController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.orange.shade800;

    // Style border umum
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/background_floral.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),
                      const Text(
                        'SISTEM BEASISWA KABUPATEN BADUNG',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Image.asset(
                        'assets/images/logo_badung.png',
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'DINAS KOMUNIKASI DAN INFORMATIKA\nKABUPATEN BADUNG',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),

            // FORM REGISTER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildTextField(
                    "Nama",
                    "Masukkan nama Anda",
                    controller: _namaController,
                    inputBorder: inputBorder,
                  ),

                  // FIELD TANGGAL LAHIR
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tanggal Lahir",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _tanggalLahirController,
                          readOnly: true,
                          onTap: () {
                            _pilihTanggal(context);
                          },
                          decoration: InputDecoration(
                            hintText: "Pilih tanggal",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            border: inputBorder,
                            enabledBorder: inputBorder,
                            focusedBorder: inputBorder.copyWith(
                              borderSide: BorderSide(
                                color: Colors.orange.shade800,
                                width: 1.4,
                              ),
                            ),
                            suffixIcon:
                                const Icon(Icons.calendar_today, size: 20),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                          ),
                        ),
                      ],
                    ),
                  ),

                  _buildTextField(
                    "Alamat",
                    "Masukkan alamat Anda",
                    controller: _alamatController,
                    inputBorder: inputBorder,
                    hintColor: Colors.grey.shade400, // 👈 hint lebih soft
                  ),

                  _buildTextField(
                    "Email",
                    "Masukkan email Anda",
                    controller: _emailController,
                    inputBorder: inputBorder,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  _buildTextField(
                    "No. Telepon",
                    "08...",
                    controller: _teleponController,
                    inputBorder: inputBorder,
                    keyboardType: TextInputType.phone,
                  ),

                  _buildTextField(
                    "Sekolah / Universitas",
                    "Nama sekolah/universitas",
                    controller: _sekolahController,
                    inputBorder: inputBorder,
                  ),

                  _buildTextField(
                    "Password",
                    "Buat password Anda",
                    controller: _passwordController,
                    inputBorder: inputBorder,
                    obscureText: true,
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: _setujuKebijakan,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _setujuKebijakan = newValue ?? false;
                          });
                        },
                        activeColor: buttonColor,
                      ),
                      const Flexible(
                        child: Text(
                          'Saya setuju dengan Kebijakan & Privasi',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // BUTTON REGISTER
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // LINK LOGIN
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade800,
                          fontFamily: 'Poppins',
                        ),
                        children: [
                          const TextSpan(text: 'Sudah mempunyai akun? '),
                          TextSpan(
                            text: 'Masuk ke Akun',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper untuk membuat TextField dengan hint yang bisa diatur warnanya
  Widget _buildTextField(
    String label,
    String hintText, {
    bool obscureText = false,
    IconData? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
    required OutlineInputBorder inputBorder,
    Color? hintColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF444444),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: hintColor ?? Colors.grey.shade500),
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder.copyWith(
                borderSide: BorderSide(
                  color: Colors.orange.shade800,
                  width: 1.4,
                ),
              ),
              filled: false,
              suffixIcon:
                  suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
