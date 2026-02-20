import 'package:flutter/material.dart';
import '../models/commodity.dart';
import '../models/learning_module.dart';
import '../models/mitra_location.dart';

class DummyDataService {
  // ==================== KOMODITAS ====================
  static const List<Commodity> commodities = [
    Commodity(
      id: 'tomat-apel',
      name: 'Tomat Apel',
      imagePath: 'assets/images/assets-pageapps/Tomat apel.png',
      category: 'Sayuran',
      description:
          'Tomat apel (Solanum lycopersicum) adalah varietas tomat yang memiliki bentuk bulat menyerupai apel dengan ukuran lebih besar dari tomat biasa. Daging buahnya tebal, padat, dan memiliki rasa yang manis sedikit asam.',
      pricePerKg: 12000,
      harvestSeason: 'Sepanjang tahun (optimal: April-September)',
      growthDurationDays: 70,
      region: 'Jawa Barat, Jawa Tengah, Jawa Timur',
      icon: null, // Has image
    ),
    Commodity(
      id: 'jagung',
      name: 'Jagung',
      imagePath: 'assets/images/assets-pageapps/DIGIMARKET ROOM.png',
      category: 'Serealia',
      description:
          'Jagung (Zea mays) merupakan salah satu tanaman pangan terpenting di Indonesia setelah padi. Digunakan sebagai bahan pangan, pakan ternak, dan bahan baku industri.',
      pricePerKg: 5000,
      harvestSeason: 'Maret-April, September-Oktober',
      growthDurationDays: 100,
      region: 'Jawa Timur, NTB, NTT, Sulawesi',
      icon: null, // Has image
    ),
    Commodity(
      id: 'beras',
      name: 'Beras',
      imagePath: '', // No image
      category: 'Serealia',
      description:
          'Beras merupakan makanan pokok utama masyarakat Indonesia. Produksi beras nasional mencapai 31 juta ton per tahun.',
      pricePerKg: 13000,
      harvestSeason:
          'Februari-Maret (musim hujan), Juli-Agustus (musim kemarau)',
      growthDurationDays: 120,
      region: 'Jawa Barat, Jawa Tengah, Jawa Timur, Sulawesi Selatan',
      icon: Icons.grass, // Icon for Rice
    ),
    Commodity(
      id: 'cabai',
      name: 'Cabai Merah',
      imagePath: '', // No image
      category: 'Sayuran',
      description:
          'Cabai merah (Capsicum annuum) adalah komoditas hortikultura yang memiliki fluktuasi harga tinggi. Permintaan cabai meningkat tajam menjelang hari besar.',
      pricePerKg: 45000,
      harvestSeason: 'Sepanjang tahun',
      growthDurationDays: 80,
      region: 'Jawa Barat, Jawa Tengah, Sumatera Utara',
      icon: Icons.whatshot, // Icon for Chili (spicy)
    ),
    Commodity(
      id: 'semangka',
      name: 'Semangka',
      imagePath: '', // No image
      category: 'Buah',
      description:
          'Semangka (Citrullus lanatus) adalah buah segar yang banyak dibudidayakan di daerah tropis. Cocok untuk dataran rendah dengan iklim panas.',
      pricePerKg: 8000,
      harvestSeason: 'September-November',
      growthDurationDays: 75,
      region: 'Jawa Timur, NTB, Kalimantan',
      icon: Icons.circle, // Icon for Watermelon (round)
    ),
  ];

  // ==================== MODUL AGRILEARN ====================

  // Modul 1: Budidaya Tomat Apel
  static const LearningModule modulBudidayaTomat = LearningModule(
    id: 'modul-budidaya-tomat',
    title: 'Modul Budidaya Tomat Apel',
    commodityId: 'tomat-apel',
    type: ModuleType.budidaya,
    description:
        'Panduan lengkap budidaya tomat apel dari persiapan lahan hingga pasca panen. Cocok untuk petani pemula maupun berpengalaman.',
    steps: [
      ModuleStep(
        stepNumber: 1,
        title: 'Persiapan Lahan',
        description:
            'Pilih lahan dengan ketinggian 300-1000 mdpl, pH tanah 5.5-7.0, dan drainase baik. '
            'Lakukan pengolahan tanah sedalam 30-40 cm, berikan pupuk kandang 20 ton/ha, '
            'dan buat bedengan dengan lebar 100-120 cm, tinggi 30 cm, serta jarak antar bedengan 50 cm. '
            'Pasang mulsa plastik hitam perak untuk menjaga kelembaban dan menekan gulma.',
        tips:
            'Pastikan lahan terkena sinar matahari minimal 8 jam/hari. Hindari lahan bekas tanaman Solanaceae (terong, cabai) untuk mencegah penularan penyakit.',
        iconName: 'landscape',
      ),
      ModuleStep(
        stepNumber: 2,
        title: 'Pembibitan',
        description:
            'Rendam benih dalam air hangat (50°C) selama 15 menit untuk sterilisasi, lalu tiriskan. '
            'Semai benih di tray semai dengan media campuran tanah, kompos, dan sekam (1:1:1). '
            'Letakkan di tempat teduh selama 2-3 hari hingga berkecambah, kemudian pindahkan ke tempat yang mendapat cahaya. '
            'Bibit siap tanam setelah berumur 21-28 hari atau memiliki 4-5 helai daun sejati.',
        tips:
            'Gunakan benih bersertifikat dari produsen terpercaya. Siram bibit 2x sehari pagi dan sore dengan air bersih.',
        iconName: 'eco',
      ),
      ModuleStep(
        stepNumber: 3,
        title: 'Penanaman',
        description:
            'Buat lubang tanam di atas bedengan dengan jarak 50x60 cm. Tanam bibit pada sore hari '
            'untuk mengurangi stres panas. Masukkan bibit beserta media semai ke dalam lubang, '
            'padatkan tanah di sekitar pangkal batang, dan siram segera setelah tanam. '
            'Pasang ajir (tiang penyangga) dari bambu setinggi 150 cm di samping setiap tanaman.',
        tips:
            'Waktu tanam ideal adalah awal musim kemarau (April-Mei). Tanam pada sore hari (setelah pukul 15.00) untuk mengurangi penguapan.',
        iconName: 'grass',
      ),
      ModuleStep(
        stepNumber: 4,
        title: 'Pemupukan',
        description:
            'Pupuk dasar: NPK 15-15-15 sebanyak 300 kg/ha diberikan saat tanam. '
            'Pupuk susulan pertama (14 HST): Urea 150 kg/ha + ZA 100 kg/ha. '
            'Pupuk susulan kedua (28 HST): NPK 16-16-16 sebanyak 200 kg/ha. '
            'Pupuk susulan ketiga (42 HST): KCl 100 kg/ha untuk memperbesar buah. '
            'Berikan pupuk organik cair setiap 2 minggu melalui penyemprotan daun.',
        tips:
            'Pemupukan dilakukan pada pagi hari dengan cara ditugal 10 cm dari pangkal batang. Jangan memberikan pupuk terlalu dekat dengan batang karena dapat menyebabkan kerusakan akar.',
        iconName: 'science',
      ),
      ModuleStep(
        stepNumber: 5,
        title: 'Pengairan',
        description:
            'Siram tanaman 2 kali sehari (pagi dan sore) pada fase vegetatif (0-30 HST). '
            'Kurangi frekuensi menjadi 1 kali sehari saat fase generatif (30-60 HST). '
            'Gunakan sistem irigasi tetes (drip irrigation) untuk efisiensi air. '
            'Kelembaban tanah optimal 60-80%. Hindari penggenangan karena dapat menyebabkan busuk akar.',
        tips:
            'Pengairan terbaik dilakukan pagi hari (06.00-08.00). Pada musim hujan, pastikan drainase berjalan baik untuk mencegah genangan air.',
        iconName: 'water_drop',
      ),
      ModuleStep(
        stepNumber: 6,
        title: 'Pengendalian Hama & Penyakit',
        description:
            'Hama utama: kutu kebul (Bemisia tabaci), ulat buah (Helicoverpa armigera), dan lalat buah. '
            'Penyakit utama: layu fusarium, busuk buah (Phytophthora), dan bercak daun. '
            'Pengendalian terpadu (PHT): rotasi tanaman, pemasangan perangkap kuning, '
            'penyemprotan pestisida nabati (ekstrak mimba/bawang putih), dan pemangkasan daun sakit. '
            'Gunakan fungisida berbahan aktif mankozeb untuk pencegahan penyakit jamur.',
        tips:
            'Lakukan monitoring rutin setiap 3 hari. Buang dan musnahkan bagian tanaman yang terserang penyakit. Jangan menyemprot pestisida saat buah mendekati panen.',
        iconName: 'bug_report',
      ),
      ModuleStep(
        stepNumber: 7,
        title: 'Pemanenan',
        description:
            'Tomat apel siap panen pada umur 60-70 HST (hari setelah tanam). '
            'Ciri buah siap panen: warna berubah dari hijau ke kuning kemerahan (30-50% merah), '
            'buah terasa agak lunak saat ditekan ringan, dan tangkai mudah dilepas. '
            'Panen dilakukan pagi hari (06.00-09.00) saat suhu masih sejuk. '
            'Gunakan gunting stek untuk memotong tangkai buah, sisakan 1-2 cm tangkai pada buah. '
            'Potensi hasil: 20-40 ton/ha per musim tanam.',
        tips:
            'Panen bertahap setiap 2-3 hari sekali selama 4-6 minggu. Letakkan buah hasil panen dalam keranjang plastik berlubang, jangan ditumpuk lebih dari 3 lapis.',
        iconName: 'agriculture',
      ),
      ModuleStep(
        stepNumber: 8,
        title: 'Pasca Panen',
        description:
            'Sortasi: pisahkan buah berdasarkan ukuran (grade A >150g, B 100-150g, C <100g) dan kualitas. '
            'Pencucian: bersihkan buah dengan air mengalir untuk menghilangkan kotoran. '
            'Pengemasan: gunakan kardus berlubang atau peti kayu dengan alas jerami. '
            'Penyimpanan: simpan pada suhu 12-15°C dengan kelembaban 85-90% untuk daya simpan 7-14 hari. '
            'Distribusi: segera distribusikan dalam 24-48 jam untuk menjaga kesegaran.',
        tips:
            'Hindari menyimpan tomat bersama buah yang menghasilkan etilen tinggi (pisang, mangga). Tomat yang sudah dipanen tidak boleh terkena sinar matahari langsung.',
        iconName: 'inventory_2',
      ),
    ],
  );

  // Modul 2: Video Budidaya Tomat Apel
  static const LearningModule modulVideoTomat = LearningModule(
    id: 'modul-video-tomat',
    title: 'Video Budidaya Tomat Apel',
    commodityId: 'tomat-apel',
    type: ModuleType.video,
    description:
        'Kumpulan video pembelajaran budidaya tomat apel dari petani berpengalaman dan pakar pertanian.',
    videos: [
      VideoItem(
        id: 'vid-1',
        title: 'Teknik Pembibitan Tomat Apel Unggulan',
        duration: '0:59',
        description:
            'Pelajari cara memilih benih berkualitas, teknik penyemaian yang benar, dan perawatan bibit hingga siap tanam. Dipandu oleh Pak Hadi, petani tomat berpengalaman 20 tahun dari Bandung.',
        thumbnailIcon: 'eco',
        youtubeUrl: 'https://youtube.com/shorts/3pSzbot8_HE',
      ),
      VideoItem(
        id: 'vid-2',
        title: 'Persiapan Lahan & Penanaman yang Tepat',
        duration: '0:58',
        description:
            'Video tutorial lengkap pengolahan tanah, pembuatan bedengan, pemasangan mulsa, dan teknik penanaman bibit tomat apel yang benar untuk hasil optimal.',
        thumbnailIcon: 'landscape',
        youtubeUrl: 'https://youtube.com/shorts/U2zw-M9Mhv4',
      ),
      VideoItem(
        id: 'vid-3',
        title: 'Pemupukan Optimal untuk Tomat Apel',
        duration: '10:45',
        description:
            'Panduan dosis dan jadwal pemupukan yang tepat mulai dari pupuk dasar hingga susulan. Termasuk tips penggunaan pupuk organik cair untuk meningkatkan kualitas buah.',
        thumbnailIcon: 'science',
        youtubeUrl: 'https://youtube.com/shorts/cPnO94gEv3U',
      ),
      VideoItem(
        id: 'vid-4',
        title: 'Pengendalian Hama & Penyakit Terpadu',
        duration: '18:10',
        description:
            'Kenali hama dan penyakit utama tomat apel serta cara pengendaliannya secara terpadu. Termasuk pembuatan pestisida nabati dari bahan lokal.',
        thumbnailIcon: 'bug_report',
        youtubeUrl: 'https://youtube.com/shorts/5vR3cHHOy5E',
      ),
      VideoItem(
        id: 'vid-5',
        title: 'Teknik Panen & Pasca Panen Profesional',
        duration: '14:55',
        description:
            'Cara memanen tomat apel dengan benar, teknik sortasi dan grading, pengemasan, serta penyimpanan untuk memaksimalkan nilai jual dan daya simpan.',
        thumbnailIcon: 'agriculture',
        youtubeUrl: 'https://youtube.com/shorts/I30jlBFGi8Q',
      ),
    ],
  );

  // Modul 3: Materi Pembelajaran
  static const LearningModule modulMateriTomat = LearningModule(
    id: 'modul-materi-tomat',
    title: 'Materi Pembelajaran',
    commodityId: 'tomat-apel',
    type: ModuleType.materi,
    description:
        'Artikel dan referensi ilmiah tentang budidaya, teknologi digital pertanian, pemasaran, dan manajemen agro-ekonomi.',
    articles: [
      ArticleItem(
        id: 'art-1',
        title: 'Mengenal Varietas Tomat Apel: Karakteristik dan Keunggulan',
        content:
            'Tomat apel merupakan salah satu varietas tomat yang paling diminati di pasar Indonesia. '
            'Berbeda dengan tomat biasa, tomat apel memiliki beberapa keunggulan:\n\n'
            '• Ukuran buah lebih besar (150-250 gram per buah)\n'
            '• Daging buah tebal dan padat, cocok untuk berbagai olahan\n'
            '• Rasa manis sedikit asam dengan kandungan likopen tinggi\n'
            '• Daya simpan lebih lama (7-14 hari pada suhu ruang)\n'
            '• Harga jual lebih tinggi dibanding tomat biasa\n\n'
            'Varietas populer di Indonesia antara lain Servo F1, Permata F1, dan Mutiara F1. '
            'Tomat apel tumbuh optimal pada ketinggian 300-1000 mdpl dengan suhu 20-30°C dan curah hujan 750-1250 mm/tahun.\n\n'
            'Kandungan gizi per 100g tomat apel:\n'
            '• Kalori: 18 kkal\n'
            '• Vitamin C: 21 mg\n'
            '• Likopen: 2.573 mg\n'
            '• Kalium: 237 mg\n'
            '• Serat: 1.2 g',
        category: 'Pengetahuan Dasar',
        readTime: '5 menit',
      ),
      ArticleItem(
        id: 'art-2',
        title: 'Iklim dan Kondisi Optimal untuk Budidaya Tomat',
        content:
            'Keberhasilan budidaya tomat apel sangat dipengaruhi oleh kondisi iklim dan lingkungan. '
            'Berikut panduan lengkap kondisi optimal:\n\n'
            'SUHU:\n'
            '• Suhu optimal siang: 25-30°C\n'
            '• Suhu optimal malam: 15-20°C\n'
            '• Suhu terlalu tinggi (>35°C) menyebabkan kerontokan bunga\n'
            '• Suhu terlalu rendah (<10°C) menghambat pertumbuhan\n\n'
            'KETINGGIAN:\n'
            '• Ideal: 300-1000 mdpl\n'
            '• Dataran rendah: bisa, tapi perlu varietas toleran panas\n'
            '• Dataran tinggi (>1200 mdpl): pertumbuhan lambat\n\n'
            'TANAH:\n'
            '• Jenis: lempung berpasir (sandy loam) terbaik\n'
            '• pH: 5.5-7.0 (optimal 6.0-6.8)\n'
            '• Kandungan organik: minimal 2%\n'
            '• Drainase: harus baik, tidak boleh tergenang\n\n'
            'CAHAYA:\n'
            '• Minimal 8 jam sinar matahari per hari\n'
            '• Full sun untuk hasil terbaik\n'
            '• Intensitas cahaya optimal: 10.000-20.000 lux\n\n'
            'MUSIM TANAM:\n'
            '• Terbaik: awal musim kemarau (April-Mei)\n'
            '• Bisa sepanjang tahun dengan greenhouse\n'
            '• Hindari musim hujan berkepanjangan',
        category: 'Teknik Budidaya',
        readTime: '7 menit',
      ),
      ArticleItem(
        id: 'art-3',
        title: 'Teknologi Digital dalam Pertanian Modern',
        content:
            'Revolusi industri 4.0 membawa transformasi besar dalam sektor pertanian. '
            'Berikut teknologi digital yang dapat diterapkan:\n\n'
            'PRECISION FARMING:\n'
            '• Sensor tanah untuk monitoring kelembaban dan nutrisi real-time\n'
            '• Drone untuk pemetaan lahan dan penyemprotan presisi\n'
            '• GPS-guided tractors untuk efisiensi pengolahan lahan\n\n'
            'IoT (Internet of Things):\n'
            '• Sistem irigasi otomatis berbasis sensor\n'
            '• Monitoring cuaca mikro dengan weather station\n'
            '• Early warning system untuk serangan hama\n\n'
            'MARKETPLACE DIGITAL:\n'
            '• Platform B2B untuk menghubungkan petani dengan buyer\n'
            '• Transparansi harga pasar real-time\n'
            '• Sistem pembayaran digital untuk transaksi aman\n\n'
            'TRACEABILITY:\n'
            '• QR code untuk tracking asal-usul produk\n'
            '• Blockchain untuk keamanan data rantai pasok\n'
            '• Sertifikasi digital untuk jaminan kualitas\n\n'
            'Digmar hadir sebagai solusi terintegrasi yang menggabungkan semua teknologi di atas '
            'dalam satu platform yang mudah digunakan oleh petani.',
        category: 'Teknologi Digital',
        readTime: '8 menit',
      ),
      ArticleItem(
        id: 'art-4',
        title: 'Strategi Pemasaran Hasil Panen Tomat',
        content:
            'Pemasaran yang tepat menentukan keuntungan petani. Berikut strategi pemasaran efektif:\n\n'
            'GRADING & SORTASI:\n'
            '• Grade A (premium): buah >150g, bentuk sempurna → pasar modern, hotel, restoran\n'
            '• Grade B (standar): buah 100-150g, sedikit cacat → pasar tradisional\n'
            '• Grade C (olahan): buah <100g, cacat → industri saus, pasta tomat\n\n'
            'CHANNEL PEMASARAN:\n'
            '1. Pasar tradisional: volume besar, margin kecil\n'
            '2. Supermarket/minimarket: kualitas ketat, harga lebih baik\n'
            '3. Hotel/restoran/katering (HOREKA): kontrak tetap, stabil\n'
            '4. Online marketplace: jangkauan luas, potensial\n'
            '5. Program MBG (Makan Bergizi Gratis): kontrak pemerintah\n\n'
            'TIPS MENINGKATKAN NILAI JUAL:\n'
            '• Pengemasan menarik dengan label dan info nutrisi\n'
            '• Sertifikasi organik untuk premium market\n'
            '• Kontrak panen (forward contract) untuk stabilitas harga\n'
            '• Diversifikasi produk: tomat segar, tomat kering, saus\n\n'
            'ESTIMASI KEUNTUNGAN PER MUSIM:\n'
            '• Modal: Rp 25-35 juta/ha\n'
            '• Hasil panen: 20-40 ton/ha\n'
            '• Harga jual rata-rata: Rp 8.000-15.000/kg\n'
            '• Potensi pendapatan: Rp 160-600 juta/ha\n'
            '• Keuntungan bersih: Rp 100-400 juta/ha',
        category: 'Pemasaran',
        readTime: '6 menit',
      ),
      ArticleItem(
        id: 'art-5',
        title: 'Manajemen Agro-Ekonomi untuk Petani Kecil',
        content:
            'Pengelolaan keuangan pertanian yang baik sangat penting untuk keberlanjutan usaha tani.\n\n'
            'PERENCANAAN KEUANGAN:\n'
            '• Buat catatan pengeluaran dan pemasukan rutin\n'
            '• Pisahkan keuangan usaha tani dengan pribadi\n'
            '• Alokasikan 20% keuntungan untuk modal musim tanam berikutnya\n'
            '• Sisihkan 10% untuk dana darurat (gagal panen, bencana)\n\n'
            'EFISIENSI BIAYA:\n'
            '• Kelompok tani: pembelian input bersama untuk harga lebih murah\n'
            '• Kompos sendiri dari limbah pertanian → hemat pupuk\n'
            '• Rotasi tanaman untuk mengurangi biaya pestisida\n'
            '• Sistem tumpang sari untuk diversifikasi pendapatan\n\n'
            'AKSES PEMBIAYAAN:\n'
            '• KUR (Kredit Usaha Rakyat) sektor pertanian: bunga 3%/tahun\n'
            '• Pembiayaan syariah melalui BMT\n'
            '• Program bantuan pemerintah (PUPM, PATB)\n'
            '• Kemitraan dengan off-taker (pembeli tetap)\n\n'
            'MANAJEMEN RISIKO:\n'
            '• Asuransi Usaha Tani (AUTP) premi Rp 36.000/ha\n'
            '• Diversifikasi komoditas (jangan hanya satu jenis)\n'
            '• Kontrak penjualan sebelum tanam\n'
            '• Gabung kelompok tani untuk sharing risiko',
        category: 'Manajemen',
        readTime: '6 menit',
      ),
    ],
  );

  // ==================== HELPER METHODS ====================

  static Commodity? getCommodityById(String id) {
    try {
      return commodities.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<LearningModule> getModulesForCommodity(String commodityId) {
    final allModules = [modulBudidayaTomat, modulVideoTomat, modulMateriTomat];
    return allModules.where((m) => m.commodityId == commodityId).toList();
  }

  static List<LearningModule> getAllModules() {
    return [modulBudidayaTomat, modulVideoTomat, modulMateriTomat];
  }

  // ==================== MITRA LOCATIONS ====================
  static const List<MitraLocation> mitraLocations = [
    MitraLocation(
      id: 'm1',
      name: 'KUD Tani Makmur',
      address: 'Jl. Raya Pertanian No. 15, Sumedang',
      region: 'Sumedang',
      latitude: -6.8384,
      longitude: 107.9253,
      commodities: ['Beras', 'Sayur', 'Jagung'],
      contactName: 'Bapak Suryono',
      phone: '+62 812-3456-7890',
      imagePath: 'assets/images/assets-pageapps/Tomat apel.png',
      rating: 4.8,
    ),
    MitraLocation(
      id: 'm2',
      name: 'Mitra Tani Sejahtera',
      address: 'Desa Kedungsari, Kab Muna',
      region: 'Muna',
      latitude: -4.8380,
      longitude: 122.6560,
      commodities: ['Beras', 'Sayur', 'Buah'],
      contactName: 'Ibu Rahma',
      phone: '+62 813-9876-5432',
      imagePath: 'assets/images/assets-pageapps/Tomat apel.png',
      rating: 4.6,
    ),
    MitraLocation(
      id: 'm3',
      name: 'Koperasi Sumber Pangan',
      address: 'Kecamatan Lembang, Bandung Barat',
      region: 'Bandung',
      latitude: -6.8166,
      longitude: 107.6191,
      commodities: ['Beras', 'Sayur', 'Tomat'],
      contactName: 'Bapak Ahmad',
      phone: '+62 856-1122-3344',
      imagePath: 'assets/images/assets-pageapps/Tomat apel.png',
      rating: 4.9,
    ),
  ];
}
