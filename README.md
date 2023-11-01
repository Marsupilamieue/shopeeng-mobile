# shopeeng
<hr>

# Tugas 7

1.  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

    StatelessWidget adalah sebuah widget yang menjelaskan bagian dari antarmuka pengguna yang dapat didefinisikan ulang berdasarkan perubahan konfigurasi. StatelessWidget tidak pernah berubah (yaitu, tidak ada status internal yang dapat berubah), sehingga mereka dijalankan ulang setiap kali perubahan terjadi, seperti perubahan orientasi layar atau perubahan data.

    StatefulWidget adalah sebuah widget yang dapat berubah sepanjang waktu. StatefulWidget menciptakan dan mengelola objek State yang kemudian digunakan untuk membangun antarmuka pengguna. Ketika status berubah, widget ini dibangun kembali untuk mencerminkan perubahan tersebut.

2.  Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    - MaterialApp adalah Widget root dari aplikasi Flutter. Biasanya digunakan untuk mengatur tema dan navigasi.

    - ThemeData adalah widget yang digunakan untuk mengatur tema aplikasi.

    - ColorScheme adalah widget yang digunakan untuk mendefinisikan skema warna yang akan digunakan oleh tema.

    - Scaffold adalah kerangka dasar visual Material Design untuk aplikasi Flutter. Biasanya digunakan untuk menyediakan struktur dasar aplikasi, seperti AppBar, Drawer, dan BottomNavigationBar.

    - AppBar adalah bar di bagian atas Scaffold yang biasanya berisi judul aplikasi.

    - Text adalah widget yang digunakan untuk menampilkan teks dengan berbagai gaya dan format.

    - Padding adalah widget yang digunakan untuk memberikan padding ke widget lain.

    - Column adalah widget yang digunakan untuk menampilkan sejumlah widget childern dalam urutan vertikal.

    - GridView.count adalah widget yang digunakan untuk menampilkan grid item dengan jumlah kolom yang ditentukan.

    - Material adalag widget yang digunakan untuk memberikan efek visual Material Design ke widget lain.

    - InkWell adalah widget yang digunakan untuk memberikan efek visual Material Design dan juga dapat menangani gestur tap.

    - Container adalah widget yang digunakan untuk menggabungkan beberapa widget dalam satu kotak dan juga dapat memberikan padding, margin, dan dekorasi.

    - Center adalah widget yang digunakan untuk memusatkan widget anaknya.

    - Icon adalah widget yang digunakan untuk menampilkan ikon dengan berbagai gaya dan ukuran.

    - SnackBar adalah widget yang digunakan untuk menampilkan pesan ringkas di bagian bawah layar.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    - Membuat project flutter, masuk ke folder project, dan membukanya di visual studio code dengan menjalankan
    ```
    flutter create Shopeeng
    cd Shopeeng
    code .
    ```
    - Membuat file ```menu.dart``` pada ```<projectfolder>/lib```
    - Menambahkan import material flutter
    ```dart
    import 'package:flutter/material.dart';
    ```
    - Menambahkan class ShopItem untuk class tombol dengan ikon dan teks
    ```dart
    class ShopItem {
        final String name;
        final IconData icon;
        final Color color;

        ShopItem(this.name, this.icon, this.color);
    }
    ```
    - Menghapus line 39 sampai line akhir
    - Mengganti properti ```home``` menjadi
    ```dart
    home: MyHomePage(),
    ```
    - Menambahkan class MyHomePage pada file menu.dart sebagai statelessWidget
    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);
    }
    ```
    - Menambahkan variable list yang menampung object item yang nantinya akan digunakan untuk membuat tombol di bawah ```MyHomePage({Key? key}) : super(key: key);```.
    ```dart
    ...
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.yellow),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green),
        ShopItem("Logout", Icons.logout, Colors.blue),
    ];
    ```
    - Menambahkan widget build yang melakukan return scaffold(widget untuk menyediakan struktur visual)
    ```dart
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Shopeeng',
            style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Welcome to Shopeeng', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    }
    ```
    ```appBar``` merupakan bar di bagian atas dengan text berisi Shopeeng berwarna putih dan background berwarna oranye.
    ```SingleChildScrollView()``` adalah widget yang digunakan agar dapat dilakukan scroll ketika konten lebih besar dari ruang yang tersedia
    ```body``` memiliki child padding dan juga kolom
    ```padding: const EdgeInsets.all(10.0)``` digunakan untuk mengeset padding yang sama pada kanan,kiri,bawah,dan atas.
    Di dalam widget coloum terdapat ```children: <Widget>[const Padding()]``` yang artinya setiap widget yang ditampilkan secara vertikal memiliki widget padding yang sama dan style yang sama.
    ```GridView.count()``` merupakan widget yang menampilkan child-nya dalam grid dengan jumlah kolom yang ditentukan oleh crossAxisCount dan memiliki children yang melakukan iterasi pada item pada list items dengean stateless widgets yang bernama ShopCard. ```.toList()``` mengubah hasil dari iterasi menjadi list widget.
    - Menambahkan class ShopCard sebagai stateless widget untuk menampilkan card
    ```dart
    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ```
    ```InkWell``` merupakan widget yang merespons sentuhan
    ```onTap(){}``` adalah fungsi yang dipanggil ketika InkWell diklik, menampilakan SnackBar ketika diclick
    ```child: Container()``` untuk menyimpan icon dan text dan mempunya padding, serta child ```Center()``` untuk menampilkan item di tengah. ```Center()``` memiliki child ```Column()``` untuk menampilkan item secara vertikal dan memunyai childern yang berisi Icon dan Text untuk tombol.

