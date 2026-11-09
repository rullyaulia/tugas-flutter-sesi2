
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// HALAMAN UTAMA
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - Rully Aulia (20240040261)',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Profil Mahasiswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ProfileCard(),
            SizedBox(height: 24),
            Text(
              'Produk Pilihan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

// KARTU PROFIL - STATELESSWIDGET
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Rully Aulia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text('NIM: 20240040261'),
            const Text('Informatika / TI24D'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// KARTU PRODUK - STATEFULWIDGET
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  int jumlahLike = 12;
  int jumlahProduk = 1;

  final int hargaProduk = 150000;

  @override
  Widget build(BuildContext context) {
    int totalHarga = hargaProduk * jumlahProduk;

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.teal.shade50,
                child: const Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: Colors.teal,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'PROMO 20%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tas Selempang Premium',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text('Kategori: Fashion & Aksesoris'),
                const SizedBox(height: 8),
                const Text(
                  'Rp150.000',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          jumlahLike += isFavorite ? 1 : -1;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                    Text('$jumlahLike Like'),
                  ],
                ),
                const Divider(),
                const Text(
                  'Jumlah Produk:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: jumlahProduk > 1
                          ? () {
                              setState(() {
                                jumlahProduk--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      '$jumlahProduk',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          jumlahProduk++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Total Harga: Rp$totalHarga',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(14),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$jumlahProduk produk berhasil ditambahkan ke keranjang!',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
