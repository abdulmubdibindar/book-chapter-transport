Bab 9 dari buku ini membahas secara mendalam mengenai Model Perancangan Penawaran Transportasi (_Transportation Supply Design Models_). Model-model ini memberikan panduan "apa yang harus dilakukan" (_what to do_) dengan mengoptimalkan fungsi objektif tertentu yang tunduk pada berbagai batasan, yang membedakannya dari sekadar model simulasi yang menggunakan pendekatan "bagaimana jika" (_what if_). Masalah perancangan penawaran ini dapat diinterpretasikan sebagai permainan Stackelberg di mana perancang bertindak sebagai pemimpin yang mengantisipasi reaksi para pengguna jaringan transportasi yang bertindak sebagai pengikut.

Berikut adalah ringkasan mendalam untuk masing-masing subbabnya:

## **9.1 Pendahuluan**

Model perancangan penawaran diklasifikasikan berdasarkan beberapa faktor krusial dalam perencanaan transportasi. Klasifikasi pertama adalah variabel desain, yang dapat berupa topologi atau tata letak jaringan (seperti jaringan jalan atau jalur transit), kinerja penawaran (seperti frekuensi transit atau sinyal lalu lintas), dan harga (seperti tarif tol atau parkir). Faktor kedua adalah fungsi objektif, yang dapat mewakili tujuan masyarakat (misalnya, meminimalkan biaya pengguna) maupun tujuan operator (misalnya, memaksimalkan pendapatan atau meminimalkan biaya investasi). Klasifikasi ketiga adalah batasan-batasan, yang mencakup batasan anggaran eksternal, batasan teknis seperti rasio aliran-kapasitas, dan batasan konsistensi permintaan-aliran. Model simulasi penugasan (_assignment model_) selalu menjadi komponen inti untuk mengevaluasi respons sistem.

## **9.2 Formulasi Umum Masalah Perancangan Penawaran**

Secara matematis, masalah perancangan penawaran dirumuskan sebagai model optimisasi dengan batasan, yang memaksimalkan atau meminimalkan fungsi objektif bergantung pada variabel desain dan aliran jaringan. Variabel desain direpresentasikan ke dalam vektor yang terbagi menjadi subvektor topologi, subvektor kinerja, dan subvektor harga. Fungsi objektif berorientasi sosial umumnya diformulasikan untuk meminimalkan total biaya transportasi aktual atau mengoptimalkan _Expected Maximum Perceived Utility_ (EMPU) bagi para pengguna. Di sisi lain, fungsi objektif berorientasi operator mengekspresikan total biaya investasi, biaya operasional, dan pemeliharaan, atau juga memaksimalkan pendapatan lalu lintas yang bergantung pada harga. Rumusan ini juga sangat memperhitungkan batasan eksternal seperti anggaran maksimum yang tersedia untuk pembangunan proyek.

## **9.3 Aplikasi Model Perancangan Penawaran**

Aplikasi praktis dari perancangan penawaran ini dapat dipecah menjadi beberapa kelompok masalah spesifik, yaitu:

### **9.3.1 Model Perancangan Tata Letak Jaringan Jalan:**

Model ini berupaya mengidentifikasi koneksi jalan mana yang harus dibangun atau ditingkatkan melalui variabel diskret yang bernilai nol (jalan tidak dimasukkan) atau satu (jalan dimasukkan). Fungsi objektifnya adalah kombinasi linear dari total biaya transportasi pengguna dan biaya konstruksi serta operasi.

### **9.3.2 Model Perancangan Kapasitas Jaringan Jalan:**

Desain ini menggunakan variabel kontinu untuk mengoptimalkan kapasitas ruas jalan pada topologi tertentu. Pada jaringan perkotaan, aplikasi yang paling menonjol adalah pengaturan sinyal lalu lintas, di mana variabel desainnya merupakan rasio waktu hijau efektif terhadap panjang siklus di persimpangan.

### **9.3.3 Model Perancangan Jaringan Transit:**

Model ini ditujukan untuk menentukan tata letak rute angkutan umum yang optimal serta frekuensi pelayanannya secara bersamaan. Variabel topologi digunakan secara diskret, sedangkan variabel kinerja (frekuensi) diukur secara kontinu. Fungsi objektif yang dioptimasi sering kali menggabungkan biaya pengguna (termasuk variabel nonaditif seperti waktu tunggu) dan biaya operasi pergerakan armada yang diukur dalam waktu perjalanan atau jarak tempuh putaran. Batasan yang dipakai umumnya melibatkan ketersediaan armada kendaraan angkutan.

### **9.3.4 Model Perancangan Penentuan Harga:**

Diterapkan untuk menentukan tarif ruas tol, tarif parkir, atau ongkos kereta api menggunakan variabel kontinu. Model perancangan tarif dapat diarahkan untuk meminimalkan biaya sosial total (penentuan harga yang efisien) atau untuk tujuan operator yaitu memaksimalkan pendapatan atau keuntungan bersih pasar.

### **9.3.5 Model Perancangan Campuran:**

Menangani proyek tata ruang regional kompleks yang membutuhkan pengintegrasian infrastruktur jalan, layanan rel, dan skema pembiayaan secara bersama-sama, yang dalam penerapannya sering diselesaikan dengan pemecahan variabel secara berurutan (_sequential_) akibat tingginya tingkat kerumitan komputasi.

## **9.4 Beberapa Algoritma untuk Model Perancangan Penawaran**

Karena kerumitan matematika (seperti nonlinearitas atau rumusan optimisasi bertingkat), model ini memerlukan kelas algoritma yang berbeda sesuai tipe variabelnya.

### **9.4.1 Algoritma untuk Masalah Perancangan Diskret:**

Solusi untuk masalah desain jaringan dapat didekati menggunakan algoritma eksak, seperti enumerasi total dan _branch and bound_, atau algoritma heuristik, seperti algoritma genetika dan _neighborhood search_ yang dapat diterapkan untuk jaringan besar. Contoh heuristik yang digunakan adalah algoritma _add-and-delete_ yang menambah dan menghapus koneksi ruas secara sekuensial hingga fungsi objektif tidak bisa lagi diperbaiki. Algoritma genetika bekerja secara meniru mekanisme genetika dengan populasi kromosom yang merepresentasikan solusi, yang kemudian disempurnakan melalui persilangan (_crossover_) dan mutasi untuk menghasilkan populasi yang lebih ideal.

### **9.4.2 Algoritma untuk Masalah Perancangan Kontinu:**

Didasarkan pada prinsip optimisasi nonlinear untuk menemukan titik optimum dari fungsi skalar. Algoritma arah yang layak (_feasible direction_) dan gradien terproyeksi digunakan untuk menghindari solusi yang melanggar batasan-batasan teknis. Contoh nyata dari penerapan algoritma gradien terproyeksi dapat ditemukan dalam penyelesaian pengaturan sinyal lalu lintas yang optimal serta penentuan frekuensi pelayanan angkutan umum yang optimal.
