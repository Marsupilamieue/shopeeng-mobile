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
    <hr>
    
# Tugas 8

1. Jelaskan perbedaan antara ```Navigator.push()``` dan ```Navigator.pushReplacement()```, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!<br>
Jawab: 
- ```Navigator.push()``` : Menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna
    ```dart
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HalamanKedua()),
    );

    ```
- ```Navigator.pushReplacement()``` : Menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.
    ```dart
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HalamanKedua()),
    );

    ```

    ```push()``` akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan ```pushReplacement()``` menggantikan route yang sudah ada pada atas stack dengan route baru tersebut
2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!<br>
Jawab:
- Container: Kita dapat menambahkan padding, margin, border, dan warna latar belakang seperti properti dalam widget ini dan kita dapat menyesuaikannya sesuai kebutuhan kita1.

- Row dan Column: Widget ini digunakan untuk menata sejumlah widget anak secara horizontal (Row) atau vertikal (Column). Anda dapat menentukan bagaimana widget anak harus ditempatkan dan berapa banyak ruang yang harus mereka tempati2.

- ListView: Untuk menampilkan anak-anaknya satu demi satu dalam arah scroll.

- Padding: Digunakan untuk memberikan jarak antara widget dan widget lainnya di sekelilingnya2.

- Align: Digunakan untuk menyelaraskan widget anaknya dalam dirinya sendiri dan secara opsional mengatur ukurannya berdasarkan ukuran anaknya2.

- Center: Digunakan untuk memusatkan widget anaknya dalam dirinya sendiri-sendiri.


3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!<br>
Jawab:

- Nama Item: Elemen input ini menggunakan widget TextFormField dengan validator yang memeriksa apakah nilai input kosong atau tidak. Elemen ini digunakan untuk memasukkan nama item yang akan ditambahkan ke daftar belanja.

- Jumlah: Elemen input ini juga menggunakan widget TextFormField. Validatornya memeriksa apakah nilai input kosong dan apakah nilai tersebut berupa angka. Elemen ini digunakan untuk memasukkan jumlah item yang akan dibeli.

- Harga: Sama seperti elemen input “Jumlah”, elemen input “Harga” juga menggunakan widget TextFormField dengan validator yang sama. Elemen ini digunakan untuk memasukkan harga per item.

- Deskripsi: Elemen input ini menggunakan widget TextFormField dengan validator yang memeriksa apakah nilai input kosong atau tidak. Elemen ini digunakan untuk memasukkan deskripsi item.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?<br>
Jawab:
Clean Architecture adalah prinsip desain perangkat lunak yang mempromosikan pemisahan tanggung jawab dan bertujuan untuk menciptakan basis kode yang modular, dapat diskalakan, dan dapat diuji1. Berikut adalah cara penerapannya dalam Flutter:

- Layer Domain: Layer ini berfungsi sebagai inti dari aplikasi yang berisi logika bisnis dan model data2.

- Layer Aplikasi: Layer ini mengimplementasikan use case dari aplikasi dan menjembatani layer infrastruktur dan presentasi2.

- Layer Infrastruktur: Layer ini berurusan dengan interaksi dengan dunia luar termasuk database, server web, antarmuka pengguna2.

- Layer Presentasi: Layer ini berisi kode yang merender antarmuka pengguna di mana permintaan dibuat dan respons dikembalikan2.

- Penerapan Prinsip-Prinsip: Prinsip-prinsip seperti Single Responsibility Principle dan Dependency Injection diterapkan untuk memastikan setiap bagian sistem memenuhi peran yang bermakna dan intuitif sambil memaksimalkan kemampuannya untuk beradaptasi dengan perubahan3.

- Aturan Ketergantungan: Kode sumber hanya bergantung ke dalam. Ini berarti modul ke dalam tidak sadar atau bergantung pada modul luar. Namun, modul luar sadar dan bergantung pada modul dalam3.

- Pembagian Layer: Membagi setiap layer menjadi sub-layer dan menetapkan hierarki ketergantungan yang jelas adalah aspek penting dalam membangun aplikasi yang kuat

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)<br>
Jawab:

- Membuat ```shoplist_form.dart``` pada folder ```lib```
- Menambahkan tiga elemen input, yaitu name, price, amount dan description
    ```dart
    String _name = "";
    int _price = 0;
    int _amount = 0;
    String _description = "";
    ```
- Menambahkan tombol save
    ```dart
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: () {
            if (_formKey.currentState!.validate()) {
                items.add(Item(
                name: _name,
                price: _price,
                amount: _amount,
                description: _description,
                ));
                showDialog(
                    context: context,
                    builder: (context) {
                    return AlertDialog(
                        title: const Text('Item berhasil tersimpan'),
                        content: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Nama: $_name'),
                            Text('Harga: $_price'),
                            Text('Jumlah: $_amount'),
                            Text('Harga: $_description'),
                            ],
                        ),
                        ),
                        actions: [
                        TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                            Navigator.pop(context);
                            },
                        ),
                        ],
                    );
                    });
                _formKey.currentState!.reset();
            }
            },
            child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
            ),
        ),
        ),
    ),
    ```
- Menambahkan validasi input 
```dart
Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Nama Item",
        labelText: "Nama Item",
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    onChanged: (String? value) {
        setState(() {
        _name = value!;
        });
    },
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return "Nama tidak boleh kosong!";
        }
        return null;
        },
        ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Jumlah",
        labelText: "Jumlah",
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    onChanged: (String? value) {
        setState(() {
        _amount = int.parse(value!);
        });
    },
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
        }
        return null;
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Harga",
        labelText: "Harga",
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    onChanged: (String? value) {
        setState(() {
        _price = int.parse(value!);
        });
    },
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
        }
        return null;
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Deskripsi",
        labelText: "Deskripsi",
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    onChanged: (String? value) {
        setState(() {
        _description = value!;
        });
    },
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
        }
        return null;
    },
    ),
),
```
- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama
    ```dart
    if (item.name == "Tambah Item") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
    ```
- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru
    ```dart
    onPressed: () {
        if (_formKey.currentState!.validate()) {
            items.add(Item(
            name: _name,
            price: _price,
            amount: _amount,
            description: _description,
            ));
            showDialog(
                context: context,
                builder: (context) {
                return AlertDialog(
                    title: const Text('Item berhasil tersimpan'),
                    content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Nama: $_name'),
                        Text('Harga: $_price'),
                        Text('Jumlah: $_amount'),
                        Text('Harga: $_description'),
                        ],
                    ),
                    ),
                    actions: [
                    TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                        Navigator.pop(context);
                        },
                    ),
                    ],
                );
                });
            _formKey.currentState!.reset();
        }
    },
    ```
- Menambahkan folder ```left_drawer```
- Menambahkan file ```left_drawer``` untuk drawer
- Menambahkan tombol halaman utama dan tambah item
    ```dart
    ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Halaman Utama'),
        // Bagian redirection ke MyHomePage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => MyHomePage(),
                ));
        },
        ),
        ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Tambah Item'),
        // Bagian redirection ke ShopFormPage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
                ));
        },
    ),
    ```

    <hr>

# Tugas 9

1. Iya, tetapi menggunakan model biasanya lebih baik karena beberapa alasan:
- Type Safety: Mendapatkan keuntungan dari sistem tipe Dart yang kuat dan mendapatkan peringatan atau kesalahan saat kompilasi jika mencoba mengakses properti yang tidak ada atau menggunakan tipe yang salah.
- Autocompletion: IDE akan dapat memberikan saran autocompletion untuk properti model yang bisa sangat membantu dalam penulisan kode.
- Readability and Maintainability: Model membuat kode lebih mudah dibaca dan dipelihara. Jika struktur data berubah, kita hanya perlu memperbarui model tersebut di satu tempat. 

2.  Jelaskan mekanisme pengambilan data dari JSON     hingga dapat ditampilkan pada Flutter<br>           
    Data didapat dari response url yang sudah ada pada project django, kemudian response yang didapat didecode menjadi bentuk json. Kemudian, membuat list item yang berisi Item dan json yang tadi sudah didecode diiterasi dan masing-masing item tersebut dimasukkan di list item. ```FutureBuilder``` digunakan untuk memanggil hasil dari fetch item yang kemudian ditampilkan dengan ```ListView.builder```

3. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.<br>
    Pengguna memasukkan username dan password melalui TextField di Flutter. Data ini kemudian disimpan dalam variabel username dan password.Ketika pengguna menekan tombol login, aplikasi melakukan HTTP POST request ke endpoint ```/auth/login/``` di server Django. Data username dan password dikirimkan sebagai bagian dari body request dalam format JSON.Django menerima request dan mencoba untuk mengautentikasi pengguna. Jika autentikasi berhasil, Django akan mengirimkan respon yang berisi pesan sukses dan data pengguna. Jika autentikasi gagal, Django akan mengirimkan respon yang berisi pesan kesalahan. Flutter menerima respon dari Django dan memeriksa apakah autentikasi berhasil atau tidak. Jika berhasil, aplikasi akan menavigasi pengguna ke halaman utama (MyHomePage). Jika gagal, aplikasi akan menampilkan pesan kesalahan.Setelah pengguna berhasil login, mereka akan dibawa ke halaman utama aplikasi di mana menu aplikasi ditampilkan.

4. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.<br>
    - Scaffold: Ini adalah widget dasar dari material design di Flutter.

    - AppBar: Ini adalah bar di bagian atas aplikasi.

    - Container: Ini adalah widget yang memungkinkan Anda untuk menyesuaikan child widget.

    - Column: Ini adalah widget yang menampilkan child widget-nya dalam urutan vertikal.

    - TextField: Ini adalah widget input teks. 

    - ElevatedButton: Ini adalah widget tombol dengan elevasi.

    - FutureBuilder: Ini adalah widget yang berguna untuk melakukan operasi asinkron (seperti memanggil API atau mengambil data dari database) dan memperbarui UI berdasarkan hasil operasi tersebut.

    - AlertDialog: Ini adalah dialog yang muncul di atas konten saat ini. 

    - SnackBar: Ini adalah pesan singkat yang muncul di bagian bawah layar.

    - Navigator: Ini adalah widget yang mengelola stack widget dan memungkinkan navigasi antar halaman. 

    - Drawer: Ini adalah menu samping yang dapat ditarik keluar.

    - ListView.builder: Jika ada data produk, maka ListView dibuat untuk menampilkan produk-produk tersebut.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).<br>

    - Membuat halaman login pada proyek tugas Flutter.
        ```dart

        User? currentUser;

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: const LoginPage(),
            );
        }
        }

        class User {
        final String username;
        final int id;

        User({
            required this.username,
            required this.id,
        });
        }

        User? loggedin;

        class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
                backgroundColor: Colors.orange,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                    ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                    ),
                    obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                    onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        final response =
                            await request.login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                        });
                        // final response = await request.login(
                        //     "http://faris-zhafir-tugas.pbp.cs.ui.ac.id/auth/login/", {
                        //   'username': username,
                        //   'password': password,
                        // });

                        if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        int uid = response['id'];
                        currentUser = User(username: uname, id: uid);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("$message Selamat datang, $uname.")));
                        } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Login Gagal'),
                            content: Text(response['message']),
                            actions: [
                                TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                ),
                            ],
                            ),
                        );
                        }
                    },
                    child: const Text('Login'),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                    onPressed: () {
                        // Navigasi ke halaman register
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                    },
                    child: const Text('Register'),
                    )
                ],
                ),
            ),
            );
        }
        }

        ```
        - Kode di bawah ini adalah kode ketika tombol login diclick. Isi dari field username dan password dikirimkan sebagai alat untuk autentikasi pada `http://127.0.0.1:8000/auth/login/`.
        ```dart
            String username = _usernameController.text;
            String password = _passwordController.text;
            final response =
                await request.login("http://127.0.0.1:8000/auth/login/", {
            'username': username,
            'password': password,
            });
            // final response = await request.login(
            //     "http://faris-zhafir-tugas.pbp.cs.ui.ac.id/auth/login/", {
            //   'username': username,
            //   'password': password,
            // });

        ```
        - Jika data autentikasi user yang diisi benar maka request.loggedIn akan bernilai true sehingga akan masuk masuk ke block if dan masuk ke menu aplikas. Jika data yang dikrimkan tidak benar, maka aplikasi akan mengirimkan Snackbar yang bertuliskan bahwa login gagal.
        ```dart
        if (request.loggedIn) {
            String message = response['message'];
            String uname = response
            ...
        }else{
            .....
        }
        ```
    - Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
        
        - Membuat django app dengan nama authentication
        ```
        python manage.py startapp authentication
        ```
        - Menambahkan app authentication ke INSTALLED_APPS di settings.py
        - Melakukan install package
        ```
        pip install django-cors-headers
        ```
        - Menambahkan `corsheaders` ke INSTALLED_APPS di setting.py
        - Menambahkan `corsheaders.middleware.CorsMiddleware` ke Middleware di settings.py

        - Menambahkan variable terkait dengan middleware
        ```python
        CORS_ALLOW_ALL_ORIGINS = True
        CORS_ALLOW_CREDENTIALS = True
        CSRF_COOKIE_SECURE = True
        SESSION_COOKIE_SECURE = True
        CSRF_COOKIE_SAMESITE = 'None'
        SESSION_COOKIE_SAMESITE = 'None'
        ```
        - Menambahkan method login di app authentication
        ```python
        @csrf_exempt
        def login(request):
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    return JsonResponse({
                        "username": user.username,
                        "id" : user.id,
                        "status": True,
                        "message": "Login sukses!"
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, akun dinonaktifkan."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, periksa kembali email atau kata sandi."
                }, status=401) 
        ```
        - Menambahkan path di urls.py pada app authentication
        ```python
        path('login/', login, name='login'),
        ```
        - Install package untuk sistem autentikasi
        ```
        flutter pub add provider
        flutter pub add pbp_django_auth
        ```
        - Mengubah widget build pada semua file dart dengan 
        ```dart
        @override
        Widget build(BuildContext context) {
            return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Shopeeng',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
                    useMaterial3: true,
                ),
                home: const LoginPage()),
            );
        }
        ```
        Perubahan ini bertujuan agar objek Provider baru yang akan membagikan instance CookieRequest dengan semua komponen yang ada di aplikasi.
    - Membuat model kustom sesuai dengan proyek aplikasi Django.
     
        - Menggunakan website Quicktype untuk membuat model kostum.
        - Menyalin json pada app yang diakses dengan `<rootaplikasi>/json` kemudian menyalinya ke website quicktype
        - Membuat folder models
        - Membuat file `item.dart` di dalam folder models.
        - Menyalin hasil dari quicktype ke dalam `item.dart`
    - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy
        ```dart
        class ItemPage extends StatefulWidget {
        const ItemPage({Key? key}) : super(key: key);

        @override
        ItemPageState createState() => ItemPageState();
        }

        class ItemPageState extends State<ItemPage> {
        Future<List<Item>> fetchItem() async {
            var url = Uri.parse('http://127.0.0.1:8000/json/');
            // var url = Uri.parse('http://faris-zhafir-tugas.pbp.cs.ui.ac.id/json/');
            var response = await http.get(
            url,
            headers: {
                "Content-Type": "application/json",
            },
            );

            // melakukan decode response menjadi bentuk json
            var data = jsonDecode(utf8.decode(response.bodyBytes));

            // melakukan konversi data json menjadi object Item
            List<Item> list_Item = [];
            for (var d in data) {
            if (d != null) {
                // print(d.fields);
                Item item = Item.fromJson(d);
                if (item.fields.user == currentUser?.id) {
                list_Item.add(Item.fromJson(d));
                }
            }
            }
            return list_Item;
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                title: const Text('Item'),
                backgroundColor: Colors.orange,
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchItem(),
                    builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                        return const Column(
                            children: [
                            Text(
                                "Tidak ada data item.",
                                style:
                                    TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            ],
                        );
                        } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => InkWell(
                            onTap: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailItemPage(item: snapshot.data![index]),
                                ),
                                );
                            },
                            child: Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Harga : ${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Tentang : ${snapshot.data![index].fields.description}")
                                    ],
                                ),
                                ),
                            ),
                            ),
                        );
                        }
                    }
                    }));
        }
        }

        ```
        - Method `fetchItem()` digunakan untuk mengambil item dari endpoint `.../json/` yang kemudian didecode menjadi json dan dimasukkan ke dalam `item_list`
        - `FutureBuilder` berguna untuk melakukan operasi asinkron dan memperbarui UI berdasarkan hasil operasi tersebut. `fetchProduct()` dipanggil untuk mengambil data produk.
        - `snapshot.data == null` Jika data dari fetchProduct() masih null, maka akan menampilkan CircularProgressIndicator()
        - `snapshot.hasData` Jika fetchProduct() selesai dan tidak ada data yang dikembalikan, maka pesan “Tidak ada data produk.” ditampilkan.
        - `ListView.builder` Jika ada data produk, maka ListView dibuat untuk menampilkan produk-produk tersebut. Setiap produk ditampilkan dalam Container dengan beberapa Text widget untuk menampilkan nama, harga, dan deskripsi produk.
        - Kode di bawah berguna ketika item diclick, maka aplikasi akan menampilkan detail item tersebut
        ```dart
        onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailItemPage(item: snapshot.data![index]),
            ),
            );
        },
        ```
    - Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
        ```dart
        class DetailItemPage extends StatelessWidget {
        final Item item;

        DetailItemPage({required this.item});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: Text(item.fields.name),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                    item.fields.name,
                    style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    Text("Harga : ${item.fields.price}"),
                    const SizedBox(height: 10),
                    Text("Jumlah : ${item.fields.amount}"),
                    const SizedBox(height: 10),
                    Text("Tentang : ${item.fields.description}"),
                ],
                ),
            ),
            );
        }
        }
        ```
