Pemodelan Distribusi Perjalanan (Trip Distribution Modelling) merupakan tahap kedua dalam model transportasi klasik empat tahap, yang mengikuti tahap bangkitan perjalanan dan dilanjutkan dengan pemilihan moda serta pembebanan rute,. Tujuan utama dari tahap ini adalah mengambil total perjalanan yang berasal dari suatu zona asal ($O_i$) dan perjalanan yang ditarik ke suatu zona tujuan ($D_j$), kemudian mengalokasikannya secara spasial untuk menghasilkan matriks perjalanan antar zona ($T_{ij}$),.

Pola perjalanan ini sangat bergantung pada biaya perjalanan antar zona, yang umumnya direpresentasikan melalui fungsi biaya gabungan (generalised cost) yang menangkap berbagai atribut yang dirasakan oleh pelaku perjalanan. Rumus biaya gabungan untuk moda $k$ dapat dinyatakan sebagai: $C_{ij} = a_1 t^v_{ij} + a_2 t^w_{ij} + a_3 t^t_{ij} + a_4 t^n_{ij} + a_5 F_{ij} + a_6 \phi_j + \delta$ di mana $t^v_{ij}$ adalah waktu di dalam kendaraan, $t^w_{ij}$ adalah waktu berjalan kaki, $t^t_{ij}$ adalah waktu menunggu, $t^n_{ij}$ adalah waktu perpindahan, $F_{ij}$ adalah tarif atau biaya moneter, $\phi_j$ adalah biaya parkir/terminal, $\delta$ adalah penalti moda, dan $a_1 \dots a_6$ adalah bobot dari masing-masing atribut.

Dalam buku ini, metode distribusi perjalanan diklasifikasikan ke dalam beberapa pendekatan utama:

**1. Metode Faktor Pertumbuhan (Growth-Factor Methods)** Metode ini biasanya digunakan untuk mengekstrapolasi tren jangka pendek atau ketika tidak ada perubahan signifikan yang diharapkan pada biaya transportasi,.

- **Faktor Pertumbuhan Seragam (Uniform Growth Factor):** Mengasumsikan laju pertumbuhan tunggal ($\tau$) untuk seluruh area studi, dengan rumus $T_{ij} = \tau \cdot t_{ij}$, di mana $\tau = T/t$.
- **Batasan Tunggal (Singly Constrained):** Menerapkan faktor pertumbuhan spesifik baik pada asal perjalanan ($T_{ij} = \tau_i \cdot t_{ij}$) maupun pada tujuan perjalanan ($T_{ij} = \tau_j \cdot t_{ij}$),.
- **Batasan Ganda (Doubly Constrained):** Sering dikenal dengan metode Furness atau Fratar, pendekatan ini menyeimbangkan target asal dan tujuan menggunakan faktor koreksi berulang, dengan rumus $T_{ij} = t_{ij} \cdot \tau_i \cdot \Gamma_j \cdot A_i \cdot B_j$ atau secara sederhana $T_{ij} = t_{ij} \cdot a_i \cdot b_j$,. Kelemahan utama dari metode ini adalah mereka tidak mampu mengisi sel kosong (nol) dalam matriks dasar dan sepenuhnya mengabaikan efek perubahan biaya transportasi terhadap pola perjalanan di masa depan.

**2. Model Sintetis atau Model Gravitasi (Gravity Models)** Model gravitasi memperkirakan matriks perjalanan tanpa harus menggunakan matriks observasi secara langsung, dengan prinsip analogi dari hukum gravitasi Newton. Rumus dasarnya adalah: $T_{ij} = \alpha P_i P_j / d_{ij}^2$ di mana $P_i$ dan $P_j$ adalah populasi zona, $d_{ij}$ adalah jarak, dan $\alpha$ adalah faktor proporsionalitas. Model ini kemudian disempurnakan dengan memperhitungkan bangkitan ($O_i$) dan tarikan ($D_j$) secara langsung, serta menggunakan fungsi hambatan perjalanan (deterrence function) $f(c_{ij})$ untuk merepresentasikan penurunan minat bepergian seiring dengan naiknya biaya. Rumusnya menjadi: $T_{ij} = \alpha O_i D_j f(c_{ij})$ Ada tiga jenis fungsi hambatan yang paling sering digunakan, yaitu fungsi eksponensial ($f(c_{ij}) = \exp(-\beta c_{ij})$), fungsi pangkat ($f(c_{ij}) = c_{ij}^{-n}$), dan fungsi gabungan ($f(c_{ij}) = c_{ij}^n \exp(-\beta c_{ij})$). Untuk memastikan model mematuhi target asal dan tujuan (batasan ganda), faktor penyeimbang $A_i$ dan $B_j$ dimasukkan ke dalam persamaan: $T_{ij} = A_i O_i B_j D_j f(c_{ij})$ di mana faktor penyeimbangnya adalah $A_i = 1 / \sum_j B_j D_j f(c_{ij})$ dan $B_j = 1 / \sum_i A_i O_i f(c_{ij})$,.

**3. Pendekatan Maksimalisasi Entropi (Entropy-Maximising Approach)** Kerangka teoritis yang dikembangkan oleh Wilson ini menyatakan bahwa, tanpa adanya informasi tambahan, seluruh status mikro dari suatu sistem yang konsisten dengan batasan makronya memiliki probabilitas yang sama untuk terjadi,. Masalah ini diformulasikan sebagai upaya memaksimalkan fungsi entropi: $\log W' = -\sum_{ij} (T_{ij} \log T_{ij} - T_{ij})$ dengan mematuhi tiga batasan makro, yaitu total bangkitan ($O_i - \sum_j T_{ij} = 0$), total tarikan ($D_j - \sum_i T_{ij} = 0$), dan total biaya perjalanan sistem ($C - \sum_{ij} T_{ij}c_{ij} = 0$),,. Solusi optimasi Lagrange dari rumusan tersebut pada akhirnya persis menghasilkan bentuk fungsi model gravitasi eksponensial: $T_{ij} = A_i O_i B_j D_j \exp(-\beta c_{ij})$.

**4. Model Peluang Antara (Intervening Opportunities Model)** Model alternatif ini didasarkan pada asumsi bahwa keputusan perjalanan tidak secara langsung dikendalikan oleh jarak, melainkan oleh jumlah peluang di sekitar titik asal yang dapat memenuhi tujuan perjalanan tersebut. Probabilitas $q(x)$ bahwa pelaku perjalanan tidak terpuaskan oleh peluang-peluang di sepanjang jarak $x$ dari asal diberikan oleh: $q(x) = A_i \exp(-\alpha x)$. Sehingga, perjalanan dari zona asal $i$ ke tujuan $j$ (yang berada di urutan ke-$m$) dirumuskan sebagai: $T_{ij}^m = O_i A_i [\exp(-\alpha x_{m-1}) - \exp(-\alpha x_m)]$. Nilai konstanta $A_i$ ditentukan oleh $A_i = 1 / [1 - \exp(-\alpha x_M)]$ untuk memastikan terpenuhinya batasan akhir perjalanan. Meski kuat secara teori, model ini jarang dipakai di lapangan karena perangkat lunak pendukungnya minim dan metode matriks berbasis peringkat sulit ditangani,.

**5. Kalibrasi dan Isu Praktis** Kalibrasi pada model gravitasi biasanya difokuskan pada penyesuaian parameter $\beta$ sehingga distribusi panjang perjalanan yang dihasilkan oleh model menyamai distribusi dari observasi di dunia nyata,. Salah satu pendekatan kalibrasi yang tangguh dan efisien adalah metode Hyman yang mengevaluasi $\beta$ secara iteratif menggunakan rasio rata-rata biaya observasi dan pemodelan,. Selain itu, metode tri-proporsional dapat digunakan untuk mengatasi kalibrasi dengan memperhitungkan kelompok biaya (cost bins) sebagai dimensi ketiga,.

Para penulis memperingatkan adanya beberapa batasan praktis yang mendistorsi ketepatan model distribusi, seperti adanya sel kosong pada matriks survei (sparse matrices), serta cara model menangani perjalanan intra-zonal (di dalam satu zona) dan perjalanan antar zona eksternal yang fungsi biayanya sulit ditetapkan,. Faktor 'K' ($K_{ij}$) sering kali dimanipulasi oleh para praktisi ke dalam model gravitasi ($T_{ij} = K_{ij} A_i O_i B_j \exp(-\beta c_{ij})$) untuk mengoreksi rute secara sepihak agar cocok dengan matriks yang diamati, namun praktik ini sangat dikritik karena menghilangkan kemampuan model untuk meramalkan kebijakan transportasi di masa depan,. Terakhir, model ini menyederhanakan fakta bahwa stabilitas matriks perjalanan dari hari ke hari (day-to-day variations) sebenarnya cukup berfluktuasi, yang menuntut adanya uji kepekaan matriks (sensitivity analysis) saat model digunakan dalam mengevaluasi proyek,.

## Definitions and Notations

Pola perjalanan dalam suatu area studi umumnya direpresentasikan menggunakan matriks perjalanan (trip matrix) atau matriks Asal-Tujuan (O-D matrix) berdimensi dua, di mana baris mewakili zona asal dan kolom mewakili zona tujuan. Diagonal utama dari matriks ini menunjukkan perjalanan intra-zonal atau perjalanan di dalam zona yang sama.

Beberapa notasi dasar yang digunakan dalam tahap pemodelan distribusi perjalanan meliputi:

- $T_{ij}$: jumlah perjalanan dari asal $i$ ke tujuan $j$, dengan susunan matriks keseluruhan ditulis sebagai ${T_{ij}}$ atau $T$.
- $O_i$: total perjalanan yang berasal (originating) dari zona $i$.
- $D_j$: total perjalanan yang ditarik (attracted) ke zona $j$.
- $P_i$ dan $Q_j$: jumlah perjalanan yang dibangkitkan (produced) dan ditarik ke suatu zona.

Penggunaan huruf kecil seperti $t_{ij}$, $o_i$, dan $d_j$ menunjukkan nilai hasil observasi dari suatu sampel atau studi sebelumnya, sedangkan huruf kapital digunakan untuk menunjukkan nilai target yang ingin dimodelkan untuk periode tersebut.

Matriks ini juga dapat didisagregasi lebih lanjut berdasarkan tipe individu ($n$) dan moda transportasi ($k$). Sebagai contoh, $T^{kn}_{ij}$ menunjukkan perjalanan dari $i$ ke $j$ menggunakan moda $k$ oleh tipe individu $n$, dan $O^{kn}_i$ menunjukkan total perjalanan yang berasal dari zona $i$ dengan moda $k$ dan tipe individu $n$. Proporsi atau persentase perjalanan yang menggunakan moda $k$ di antara dua titik dinotasikan sebagai $p^k_{ij}$, sementara biaya perjalanannya dinotasikan sebagai $c^k_{ij}$.

Jumlah perjalanan dalam satu baris harus sama dengan total perjalanan yang keluar dari zona tersebut, dan jumlah perjalanan dalam satu kolom harus sama dengan total perjalanan yang ditarik ke zona tersebut. Kondisi dasar ini dirumuskan sebagai: $\sum_j T_{ij} = O_i$ $\sum_i T_{ij} = D_j$ Jika suatu model dapat memenuhi kedua batasan ketersediaan data $O_i$ dan $D_j$ tersebut, model itu dinamakan model batasan ganda (doubly constrained). Namun, jika hanya satu informasi batasan yang tersedia (hanya $O_i$ atau hanya $D_j$), model tersebut disebut batasan tunggal (singly constrained), yang bisa merujuk pada batasan asal/produksi atau batasan tujuan/tarikan.

Elemen biaya perjalanan dapat dipandang dalam unit jarak, waktu, atau uang. Evaluasi ini sering kali dinyatakan melalui biaya perjalanan gabungan (generalised cost of travel), yang merupakan fungsi linear dari berbagai atribut perjalanan beserta koefisien bobot kepentingan yang dirasakan oleh pelaku perjalanan. Rumus umum biaya gabungan (mengabaikan superskrip moda $k$ untuk penyederhanaan) dapat dituliskan sebagai: $C_{ij} = a_1 t^v_{ij} + a_2 t^w_{ij} + a_3 t^t_{ij} + a_4 t^n_{ij} + a_5 F_{ij} + a_6 \phi_j + \delta$ Di dalam persamaan ini, $t^v_{ij}$ adalah waktu perjalanan di dalam kendaraan, $t^w_{ij}$ adalah waktu berjalan kaki (menuju/dari perhentian atau tempat parkir), $t^t_{ij}$ adalah waktu menunggu, $t^n_{ij}$ adalah waktu perpindahan antarmoda, $F_{ij}$ adalah biaya moneter (tarif, tol, atau biaya kemacetan), $\phi_j$ adalah biaya terminal atau parkir, $\delta$ adalah penalti moda (mewakili atribut yang tidak diukur secara eksplisit seperti kenyamanan dan keamanan), dan $a_1 \dots a_6$ merupakan bobot konversi dari atribut-atribut tersebut ke dalam satu unit yang seragam. Biaya gabungan ini berguna untuk merepresentasikan tingkat ketidaknyamanan perjalanan (disutility) secara subjektif seperti yang dirasakan oleh pelaku perjalanan di dunia nyata.

## Growth-Factor Methods

Dalam tahap pemodelan distribusi perjalanan (Trip Distribution Modelling), **Metode Faktor Pertumbuhan (Growth-Factor Methods)** digunakan untuk mengestimasi matriks perjalanan di masa depan berdasarkan matriks observasi (tahun dasar) ketika informasi yang tersedia hanyalah tingkat pertumbuhan yang diharapkan. Berbeda dengan model sintetis seperti Model Gravitasi yang bergantung pada fungsi biaya perjalanan, metode faktor pertumbuhan bertumpu murni pada ekstrapolasi matriks perjalanan saat ini ($t_{ij}$) untuk menghasilkan matriks target ($T_{ij}$).

Terdapat beberapa jenis pendekatan dalam metode ini, bergantung pada sejauh mana informasi tingkat pertumbuhan diketahui:

**1. Faktor Pertumbuhan Seragam (Uniform Growth Factor)** Metode ini digunakan ketika hanya ada satu informasi tingkat pertumbuhan umum ($\tau$) untuk seluruh area studi. Rumusnya sangat sederhana, di mana setiap sel di dalam matriks dikalikan dengan faktor pertumbuhan yang sama: $T_{ij} = \tau \cdot t_{ij}$ untuk setiap pasangan asal $i$ dan tujuan $j$. Faktor $\tau$ dihitung dari rasio total perjalanan masa depan dibagi total perjalanan masa kini ($\tau = T/t$). Secara praktis, asumsi pertumbuhan seragam ini umumnya tidak realistis karena laju pertumbuhan biasanya bervariasi di tiap area, dan hanya dapat diterima untuk proyeksi jangka waktu yang sangat singkat, seperti satu atau dua tahun.

**2. Metode Faktor Pertumbuhan Batasan Tunggal (Singly Constrained)** Ketika perencana memiliki informasi mengenai perkiraan pertumbuhan perjalanan yang secara spesifik berasal dari suatu zona (batasan asal) atau tertarik ke suatu zona (batasan tujuan), faktor pertumbuhan yang spesifik dapat diterapkan pada baris atau kolom matriks yang bersesuaian. Rumusnya dinyatakan sebagai: $T_{ij} = \tau_i \cdot t_{ij}$ untuk faktor spesifik asal perjalanan (origin-specific). $T_{ij} = \tau_j \cdot t_{ij}$ untuk faktor spesifik tujuan perjalanan (destination-specific). Metode ini secara langsung menyesuaikan satu dimensi (baris atau kolom) dengan membagi target nilai masa depan dengan total nilai tahun dasar di zona tersebut.

**3. Metode Faktor Pertumbuhan Batasan Ganda (Doubly Constrained)** Masalah menjadi lebih kompleks jika kita memiliki informasi estimasi perjalanan masa depan di kedua sisi sekaligus (baik yang berasal maupun yang berakhir di setiap zona). Karena kita memiliki tingkat pertumbuhan asal ($\tau_i$) dan tingkat pertumbuhan tujuan ($\Gamma_j$), penggunaan rata-rata sederhana dari kedua tingkat ini tidak akan menghasilkan matriks yang memenuhi kedua target secara akurat.

Untuk menyelesaikan ini, metode koreksi iteratif yang paling terkenal digunakan, yaitu metode Fratar (di Amerika Serikat) atau metode Furness (di wilayah lainnya). Metode Furness memperkenalkan faktor penyeimbang (balancing factors) $A_i$ dan $B_j$ ke dalam rumusnya: $T_{ij} = t_{ij} \cdot \tau_i \cdot \Gamma_j \cdot A_i \cdot B_j$ Atau, dengan menggabungkan tingkat pertumbuhan ke dalam variabel baru $a_i$ dan $b_j$ (di mana $a_i = \tau_i A_i$ dan $b_j = \Gamma_j B_j$), persamaannya disederhanakan menjadi: $T_{ij} = t_{ij} \cdot a_i \cdot b_j$ Penyelesaiannya menggunakan algoritma bi-proporsional iteratif:

1. Tetapkan semua $b_j = 1.0$ lalu selesaikan $a_i$ untuk memenuhi batasan bangkitan asal perjalanan.
2. Dengan nilai $a_i$ yang baru, hitung faktor $b_j$ untuk memenuhi batasan tarikan tujuan.
3. Ulangi proses ini secara bergantian antara asal dan tujuan hingga perubahan faktor dari iterasi ke iterasi menjadi sangat kecil (konvergen). Kondisi utama agar metode ini dapat konvergen adalah total target pertumbuhan harus seimbang, yaitu total perjalanan asal masa depan harus sama persis dengan total perjalanan tujuan masa depan ($\sum_i \tau_i \sum_j t_{ij} = \sum_j \Gamma_j \sum_i t_{ij} = T$).

**Kelebihan dan Keterbatasan** Kelebihan utama dari metode faktor pertumbuhan adalah mudah dipahami serta dapat secara langsung memanfaatkan data observasi matriks beserta peramalan pertumbuhannya. Metode ini mempertahankan pola/struktur perjalanan masa lalu semaksimal mungkin selama konsisten dengan tingkat pertumbuhan.

Di sisi lain, metode ini membawa beberapa keterbatasan yang signifikan:

- **Bergantung pada akurasi masa lalu:** Metode ini sangat dipengaruhi oleh akurasi matriks tahun dasar. Jika ada sel pada matriks yang kurang akurat, proses ekspansi berulang akan memperbesar (mengamplifikasi) kesalahan tersebut.
- **Kelemahan pada sel kosong:** Metode ini bersifat multiplikatif, yang berarti sel matriks observasi yang nilainya nol (tidak teramati atau memang tidak ada perjalanan) akan tetap menjadi nol di masa depan. Hal ini sangat membatasi kemampuan untuk memodelkan rute menuju zona yang sedang berkembang.
- **Apatis terhadap perubahan biaya perjalanan:** Keterbatasan terbesar adalah pendekatan ini mengabaikan dampak perubahan biaya transportasi terhadap pola rute. Perbaikan jalan, pengurangan kemacetan, proyek moda transportasi baru, atau kebijakan penetapan harga (pricing policies) tidak akan mampu direpresentasikan oleh metode ini.

Oleh karena itu, di luar untuk memproyeksikan pergerakan perjalanan eksternal, para ahli lebih banyak menyarankan metode faktor pertumbuhan ini untuk perencanaan jangka pendek atau di saat tidak ada asumsi perubahan besar-besaran pada karakteristik biaya jaringan transportasi. Untuk jangka panjang yang sarat perubahan, pendekatan sintetis (seperti model Gravitasi) dinilai jauh lebih komprehensif.

## Synthetic or Gravity Models

Model Sintetis atau Model Gravitasi adalah pendekatan dalam pemodelan distribusi perjalanan yang dikembangkan untuk memperkirakan pola perjalanan di masa depan, terutama ketika diharapkan terjadi perubahan yang signifikan pada biaya atau jaringan transportasi. Berbeda dengan metode faktor pertumbuhan yang mengekstrapolasi data masa lalu, model ini memperkirakan perjalanan untuk setiap sel dalam matriks tanpa menggunakan pola perjalanan observasi secara langsung (karena itulah disebut "sintetis").

Model gravitasi paling awal didasarkan pada analogi dari hukum gravitasi Newton, dengan rumusan paling sederhana: $T_{ij} = \alpha P_i P_j / d_{ij}^2$ di mana $P_i$ dan $P_j$ adalah populasi dari kota asal dan tujuan, $d_{ij}$ adalah jarak antara keduanya, dan $\alpha$ adalah faktor proporsionalitas.

Model ini kemudian disempurnakan lebih lanjut dengan mengganti populasi dengan total bangkitan ($O_i$) dan tarikan perjalanan ($D_j$), serta memperkenalkan fungsi hambatan perjalanan (deterrence function) $f(c_{ij})$ untuk merepresentasikan penurunan minat bepergian seiring dengan meningkatnya jarak atau biaya. Rumusnya menjadi: $T_{ij} = \alpha O_i D_j f(c_{ij})$.

Terdapat beberapa bentuk fungsi hambatan $f(c_{ij})$ yang paling umum digunakan dalam pemodelan ini:

- **Fungsi eksponensial:** $f(c_{ij}) = \exp(-\beta c_{ij})$.
- **Fungsi pangkat:** $f(c_{ij}) = c_{ij}^{-n}$.
- **Fungsi gabungan:** $f(c_{ij}) = c_{ij}^n \exp(-\beta c_{ij})$.

Untuk memastikan bahwa model mematuhi batasan asal dan tujuan dari zona studi ($\sum_j T_{ij} = O_i$ dan $\sum_i T_{ij} = D_j$), faktor proporsionalitas tunggal $\alpha$ digantikan oleh dua set faktor penyeimbang (balancing factors) $A_i$ dan $B_j$.

Rumus untuk model batasan ganda (doubly constrained) dinyatakan sebagai: $T_{ij} = A_i O_i B_j D_j f(c_{ij})$ atau $T_{ij} = a_i b_j f(c_{ij})$. Faktor penyeimbang dalam model ini bersifat saling bergantung dan diselesaikan melalui proses berulang (iteratif), dengan rumus: $A_i = 1 / \sum_j B_j D_j f(c_{ij})$. $B_j = 1 / \sum_i A_i O_i f(c_{ij})$.

Apabila informasi yang tersedia hanya pada satu sisi, model dapat dibuat menjadi batasan tunggal (singly constrained). Sebagai contoh, untuk model batasan asal, nilai $B_j$ ditetapkan sama dengan 1.0 untuk semua tujuan $j$, dan nilai $A_i$ dihitung sebagai: $A_i = 1 / \sum_j D_j f(c_{ij})$.

Versi yang lebih umum dan fleksibel dari fungsi hambatan menggunakan pendekatan kelompok biaya (cost bins), di mana biaya perjalanan diagregasi ke dalam sejumlah kecil rentang. Fungsi hambatan ini dituliskan sebagai: $f(c_{ij}) = \sum_m F^m \delta_{ij}^m$. di mana $F^m$ adalah nilai rata-rata untuk kelompok biaya $m$, dan $\delta_{ij}^m$ bernilai 1 jika biaya perjalanan antara zona $i$ dan $j$ berada dalam rentang $m$, dan bernilai 0 jika di luar rentang tersebut. Parameter-parameter dalam fungsi hambatan ini dikalibrasi sedemikian rupa sehingga hasil model dapat mereproduksi distribusi panjang atau biaya perjalanan (Trip Length Distribution) dari data observasi dengan seakurat mungkin. Model gravitasi ini juga secara teoritis dapat diturunkan dari prinsip pendekatan maksimalisasi entropi.

## Entropy-Maximising Approach

Pendekatan Maksimalisasi Entropi (Entropy-Maximising Approach) merupakan salah satu kerangka teoretis yang paling penting dalam Pemodelan Distribusi Perjalanan (Trip Distribution Modelling) karena memberikan landasan analitis untuk menghasilkan matriks perjalanan antar zona. Dalam konteks pemodelan, metode distribusi perjalanan digunakan untuk meramalkan pola perjalanan dari suatu asal ke suatu tujuan, terutama saat terdapat perubahan besar pada biaya atau infrastruktur jaringan yang tidak dapat ditangani oleh metode sederhana seperti faktor pertumbuhan (growth-factor methods).

**Konsep Dasar dan Fungsi Entropi** Pendekatan ini berfokus pada hierarki keadaan sistem pergerakan: keadaan mikro (micro states) yang mencakup detail setiap individu seperti asal, tujuan, dan moda; keadaan meso (meso states) yang berupa agregasi perjalanan antara setiap pasangan asal-tujuan (matriks $T_{ij}$); dan keadaan makro (macro states) yang merupakan total perjalanan yang dibangkitkan atau ditarik oleh suatu zona. Pendekatan ini berasumsi bahwa, tanpa adanya informasi tambahan, semua keadaan mikro yang konsisten dengan batasan keadaan makro memiliki kemungkinan yang sama untuk terjadi.

Jumlah keadaan mikro $W{T_{ij}}$ yang berasosiasi dengan keadaan meso $T_{ij}$ dirumuskan sebagai: $W{T_{ij}} = \frac{T!}{\prod_{ij} T_{ij}!}$

Karena mencari matriks perjalanan dengan probabilitas tertinggi sama dengan memaksimalkan fungsi tersebut, transformasi fungsi logaritmik monotonik serta pendekatan Stirling ($\log X! \approx X \log X - X$) diterapkan untuk mempermudah optimasi, sehingga menghasilkan fungsi entropi: $\log W' = - \sum_{ij} (T_{ij} \log T_{ij} - T_{ij})$

Jika terdapat informasi matriks perjalanan sebelumnya (prior matrix $t_{ij}$), fungsi objektif yang digunakan disesuaikan menjadi: $\log W'' = - \sum_{ij} (T_{ij} \log T_{ij}/t_{ij} - T_{ij} + t_{ij})$

Fungsi ini pada dasarnya mengukur perbedaan antara matriks estimasi $T$ dan matriks terdahulu $t$, yang nilainya secara pendekatan sama dengan: $-\log W'' \approx 0.5 \sum_{ij} \frac{(T_{ij} - t_{ij})^2}{t_{ij}}$

**Penurunan Model Gravitasi Klasik** Dalam kerangka pemodelan distribusi perjalanan, pendekatan entropi sangat krusial karena ia membuktikan bahwa Model Gravitasi (Gravity Model) yang sangat populer dapat diturunkan secara matematis, bukan sekadar dari analogi fisika. Model dibangun dengan memaksimalkan fungsi $\log W'$ terhadap dua batasan ketersediaan data makro (produksi asal dan tarikan tujuan) dan satu batasan total biaya perjalanan sistem: $O_i - \sum_j T_{ij} = 0$ $D_j - \sum_i T_{ij} = 0$ $C - \sum_{ij} T_{ij}c_{ij} = 0$

Melalui formulasi Lagrangian, permasalahan optimasi ini ditulis menjadi: $L = \log W' + \sum_i \alpha'_i {O_i - \sum_j T_{ij}} + \sum_j \alpha''_j {D_j - \sum_i T_{ij}} + \beta {C - \sum_{ij} T_{ij}c_{ij}}$

Dengan mengambil turunan parsial pertama terhadap $T_{ij}$ dan menyamakannya dengan nol, kita mendapatkan: $\frac{\partial L}{\partial T_{ij}} = - \log T_{ij} - \alpha'_i - \alpha''_j - \beta c_{ij} = 0$

Persamaan tersebut kemudian disusun ulang dengan mengubah variabel multiplier $\alpha'_i$ dan $\alpha''_j$ menjadi faktor penyeimbang $A_i O_i$ dan $B_j D_j$, sehingga menghasilkan rumus Model Gravitasi klasik dengan fungsi hambatan eksponensial negatif: $T_{ij} = \exp(-\alpha'_i - \alpha''_j - \beta c_{ij}) = \exp(-\alpha'_i)\exp(-\alpha''_j)\exp(-\beta c_{ij})$ $T_{ij} = A_i O_i B_j D_j \exp(-\beta c_{ij})$

**Variasi Model Berdasarkan Batasan Biaya** Pendekatan maksimalisasi entropi juga menunjukkan fleksibilitasnya jika batasan biaya perjalanan dimodifikasi. Misalnya, jika biaya direpresentasikan dalam bentuk logaritmik $C' - \sum_{ij} T_{ij} \log c_{ij} = 0$, maka model gravitasi yang terbentuk menggunakan fungsi hambatan pangkat terbalik (inverse power deterrence function): $T_{ij} = A_i O_i B_j D_j \exp(-\beta' \log c_{ij}) = A_i O_i B_j D_j c_{ij}^{-\beta'}$

Jika batasan biaya dipisahkan ke dalam rentang biaya spesifik (cost bins) menggunakan variabel penanda $\delta^m_{ij}$ dan rata-rata biaya $C^m$: $C^m - \sum_{ij} T_{ij} c_{ij} \delta^m_{ij} = 0$ untuk setiap $m$

Maka model yang dihasilkan menjadi model gravitasi dengan fungsi hambatan kelompok biaya: $T_{ij} = A_i O_i B_j D_j \sum_m F^m \delta^m_{ij} = a_i b_j \sum_m F^m \delta^m_{ij}$

**Implikasi dalam Distribusi Perjalanan** Penggunaan maksimalisasi entropi memberikan beberapa keunggulan signifikan dalam praktik pemodelan distribusi perjalanan:

1. **Ketegasan Matematis:** Pendekatan ini memastikan bahwa fungsi objektifnya selalu cembung (convex) dan memiliki ruang solusi yang unik meskipun ada banyak parameter kalibrasi yang tidak unik.
2. **Kemudahan Solusi:** Karena diformulasikan sebagai permasalahan pemrograman matematis, pemodel dapat menggunakan metode solusi algoritme yang efisien dan telah terstandarisasi.
3. **Interpretasi Teoretis:** Berbeda dengan metode yang memandang distribusi perjalanan murni sebagai formula "gravitasi" mekanis, metode entropi memberikan pemahaman dari sudut pandang teori informasi dan probabilitas statistik. Ini menghubungkan perilaku pergerakan tingkat meso dengan ketidakpastian informasi pengamat di tingkat mikro.

## Calibration and Validation

Dalam konteks Pemodelan Distribusi Perjalanan (Trip Distribution Modelling), kalibrasi dan validasi adalah dua proses yang sangat berbeda namun sama-sama penting untuk memastikan bahwa model dapat merepresentasikan realitas secara akurat dan berguna untuk pengambilan keputusan.

**Kalibrasi Model Distribusi** Kalibrasi bertujuan untuk menetapkan nilai parameter-parameter model sedemikian rupa sehingga model dapat mereproduksi pola perjalanan pada tahun dasar (base-year) sedekat mungkin dengan data observasi. Pada Model Gravitasi klasik, terdapat tiga parameter utama yang harus dikalibrasi: faktor penyeimbang $A_i$ dan $B_j$, serta parameter fungsi hambatan $\beta$.

Parameter $A_i$ dan $B_j$ diestimasi secara langsung saat model dijalankan untuk memenuhi batasan bangkitan dan tarikan pergerakan (trip-end constraints), umumnya menggunakan metode penyeimbangan bi-proporsional seperti metode Furness. Sebaliknya, parameter $\beta$ harus dikalibrasi secara terpisah untuk memastikan bahwa model menghasilkan distribusi panjang perjalanan (Trip Length Distribution/TLD) yang menyerupai TLD hasil observasi.

Terdapat beberapa teknik untuk mengkalibrasi $\beta$ pada model gravitasi:

1. **Pendekatan Naif**: Analis "menebak" nilai $\beta$, menjalankan model, mengekstrak TLD hasil pemodelan, dan membandingkannya dengan TLD observasi. Jika kurang sesuai, tebakan $\beta$ diubah dan proses diulang. Pendekatan ini tidak praktis karena memakan banyak waktu komputasi dan tidak memberikan panduan yang jelas untuk memilih nilai $\beta$ berikutnya.
2. **Metode Hyman (1969)**: Ini adalah metode iteratif yang jauh lebih efisien dan terbukti kuat. Metode ini mencari nilai $\beta$ yang membuat biaya perjalanan rata-rata dari model sama dengan biaya rata-rata hasil observasi ($c^*$). Rumus persyaratannya adalah: $c(\beta) = \sum_{ij} [T_{ij}(\beta)c_{ij}] / T(\beta) = c^* = \sum_{ij} (N_{ij}c_{ij}) / \sum_{ij} N_{ij}$ Algoritma ini dimulai dengan estimasi awal $\beta_0 = 1/c^*$. Pada setiap iterasi, model dieksekusi untuk mendapatkan biaya rata-rata baru ($c_m$), dan nilai $\beta$ diperbarui hingga konvergen menggunakan rumusan: $\beta_{m+1} = \frac{(c^* - c_{m-1})\beta_m - (c^* - c_m)\beta_{m-1}}{c_m - c_{m-1}}$
3. **Pendekatan Tri-Proporsional**: Jika fungsi hambatan dikelompokkan ke dalam rentang biaya diskrit (cost bins), kalibrasi dapat menggunakan metode tri-proporsional yang menyesuaikan matriks berdasarkan asal, tujuan, dan target TLD secara iteratif. Keunggulan metode ini adalah kemampuannya untuk mengkalibrasi model gravitasi menggunakan matriks parsial (tidak lengkap), misalnya hanya memanfaatkan data wawancara tepi jalan pada kordon tertentu tanpa memerlukan matriks perjalanan penuh.

**Validasi Model Distribusi** Berbeda dengan kalibrasi yang prosesnya dibatasi oleh bentuk fungsi dan jumlah parameter bawaan model, validasi bertujuan untuk mengevaluasi apakah model secara keseluruhan benar-benar layak dan tepat digunakan untuk menguji kebijakan atau proyek tertentu. Sebuah model gravitasi yang dikalibrasi secara sempurna untuk mencocokkan data tahun dasar belum tentu merupakan representasi realitas yang cukup baik untuk jenis keputusan analisis tertentu.

Strategi paling ideal untuk melakukan validasi adalah dengan menguji apakah model dapat mereproduksi kondisi sistem pada waktu yang berbeda secara akurat. Karena masa depan tidak bisa diamati, pendekatan ini biasanya dilakukan dengan mengestimasi keadaan masa lalu yang sudah diketahui. Sayangnya, data masa lalu yang terdokumentasi dengan baik sangat jarang tersedia.

Oleh karena itu, uji validasi di lapangan umumnya menggunakan data independen yang **tidak** digunakan sama sekali selama proses kalibrasi atau estimasi. Sebagai contoh, analis dapat menguji apakah jumlah perjalanan yang melintasi _screenlines_ (garis imajiner pembatas wilayah) atau jalan-jalan arteri utama dapat direproduksi secara akurat oleh hasil pembebanan matriks model.

Validasi independen ini sangat krusial karena model distribusi sintetis sering kali kesulitan mencerminkan realitas secara sempurna. Sebuah studi yang membandingkan matriks hasil model gravitasi dengan matriks observasi dari 28 wilayah menemukan bahwa kinerja model-model tersebut cukup buruk—penyimpangannya setara dengan penambahan galat acak sebesar 75% hingga 100% pada observasi. Fakta ini menekankan bahwa model distribusi perjalanan tidak boleh diterima dan digunakan begitu saja tanpa melalui proses pengujian dan validasi yang ketat terhadap data independen.

## Tri-proportional Approach

Pendekatan Tri-proporsional (Tri-proportional Approach) merupakan perpanjangan alami dari algoritme bi-proporsional (seperti metode Furness) yang digunakan untuk mengkalibrasi Model Gravitasi dalam Pemodelan Distribusi Perjalanan. Dalam pemodelan ini, kalibrasi tidak hanya dilakukan dengan menyesuaikan jumlah total perjalanan berdasarkan batasan asal (baris) dan tujuan (kolom), melainkan diperluas untuk mencakup dimensi ketiga, yaitu kelompok biaya (cost bins) atau Distribusi Panjang Perjalanan (Trip Length Distribution/TLD).

**Konsep dan Formulasi Model** Pendekatan ini digunakan pada Model Gravitasi dengan fungsi hambatan fleksibel yang mengambil nilai diskrit untuk rentang biaya tertentu. Model ini dirumuskan sebagai:

$T_{ij} = a_i b_j \sum_m F^m \delta_{ij}^m$

Dalam persamaan ini, $T_{ij}$ adalah jumlah perjalanan dari zona $i$ ke zona $j$, $a_i$ dan $b_j$ adalah faktor penyeimbang, $F^m$ adalah faktor hambatan (deterrence factor) untuk rentang biaya $m$, dan $\delta_{ij}^m$ bernilai 1 jika biaya perjalanan berada dalam rentang $m$, dan 0 jika sebaliknya.

Tujuan utama dari kalibrasi tri-proporsional adalah menemukan nilai $F^m$ untuk setiap rentang biaya sehingga jumlah perjalanan yang dihasilkan oleh model sedekat mungkin dengan observasi nyata. Proses ini dimulai dengan menetapkan nilai awal satu untuk semua faktor, kemudian melakukan koreksi secara iteratif pada $a_i$, $b_j$, dan $F^m$ (atau $F^k$) hingga batasan akhir-perjalanan (trip-ends) dan target TLD terpenuhi.

**Sifat dan Ketidaktentuan (Indeterminacy)** Prinsip di balik teknik ini diajukan oleh Evans dan Kirby pada tahun 1974. Algoritme ini terbukti sederhana untuk diprogram dan tidak memerlukan memori komputer yang berlebihan. Namun, solusi dari faktor penyeimbang pada pendekatan tri-proporsional tidaklah unik dan memiliki dua derajat ketidaktentuan (degrees of indeterminacy) berupa konstanta perkalian arbitrer. Jika setiap nilai $a_i$ dikalikan dengan faktor $\epsilon$, setiap nilai $b_j$ dikalikan dengan faktor $\tau$, dan setiap nilai $F^k$ dibagi dengan $\epsilon \tau$, matriks perjalanan yang dihasilkan dari permodelan tidak akan berubah.

**Aplikasi pada Matriks Parsial** Salah satu keuntungan paling signifikan dari metode tri-proporsional adalah kemampuannya untuk mengkalibrasi model gravitasi menggunakan matriks perjalanan parsial (tidak lengkap). Hal ini sangat menguntungkan karena mengumpulkan data matriks secara lengkap memakan biaya yang sangat tinggi. Dengan metode ini, pemodel dapat memanfaatkan data dari wawancara tepi jalan pada titik-titik kordon atau _screen-lines_ untuk mendapatkan TLD dan total ujung-perjalanan untuk sebagian zona, lalu mengkalibrasi model.

Untuk mengisi sel-sel yang kosong, model gravitasi tanpa fungsi hambatan dapat digunakan, yang diformulasikan sebagai:

$T_{ij} = a_i b_j$

Agar pendekatan matriks parsial ini valid, ada dua syarat yang harus dipenuhi (Kirby, 1979):

1. Model harus sesuai untuk menjelaskan data yang tersedia maupun bagian matriks yang datanya tidak tersedia.
2. Kedua wilayah matriks tersebut (yang diamati dan yang tidak) tidak boleh dapat dipisahkan menjadi matriks yang independen; jika terpisah, faktor penyeimbang tidak dapat menghasilkan estimasi perjalanan yang unik.

**Estimasi Kesalahan (Error Estimation)** Dalam kaitannya dengan akurasi, rentang interval kepercayaan (confidence interval) 95% untuk jumlah perjalanan di dalam sel $(i, j)$ akibat variabilitas sampel pada formulasi tri-proporsional dapat diperkirakan melalui faktor kepercayaan $C_{ij}$. Rumusnya adalah:

$C_{ij} = \exp \left( 2 \left[ 1 / \sum_{ij} n_{ijk} + 1 / \sum_{jk} n_{ijk} + 1 / \sum_{ki} n_{ijk} \right]^{0.5} \right)$

di mana $n_{ijk}$ mewakili jumlah perjalanan yang disampel dari sel yang diobservasi, sehingga penjumlahannya hanya berlaku untuk sel-sel yang diamati saja. Rentang aktual bagi jumlah perjalanan tersebut terletak antara $T_{ij}/C_{ij}$ hingga $T_{ij} C_{ij}$.

## Other Synthetic Models

Dalam kerangka Pemodelan Distribusi Perjalanan (Trip Distribution Modelling), Model Gravitasi klasik merupakan pendekatan agregat yang paling umum digunakan. Namun, terdapat beberapa model sintetis lainnya yang memberikan alternatif teoretis untuk menghubungkan daerah asal dan tujuan, yang dapat diklasifikasikan ke dalam tiga pendekatan utama: generalisasi model gravitasi, model peluang-antara (intervening-opportunities), dan pendekatan disagregat.

**Generalisasi Model Gravitasi** Beberapa peneliti telah mengusulkan perluasan pada model gravitasi klasik agar tidak hanya memperhitungkan efek hambatan dari jarak, tetapi juga fakta bahwa semakin jauh seseorang bersedia bepergian, semakin banyak peluang yang tersedia untuk memenuhi kebutuhannya. Sebagai contoh, Fang dan Tsao (1995) menyarankan model distribusi entropi dengan biaya kuadratik yang disebut sebagai model gravitasi penahan-diri (self-deterrent gravity model). Dimasukkannya suku kemacetan ($\lambda T_{ij} C_{ij}$) pada eksponen merupakan bentuk perluasan utama dari model klasik, dengan perumusan sebagai berikut: $T_{ij} = A_i B_j O_i D_j e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}$ $A_i = \frac{1}{\sum_j B_j D_j e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}}, \quad B_j = \frac{1}{\sum_i A_i O_i e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}}$

Pendekatan ini kemudian digeneralisasikan oleh De Grange et al. (2010) dengan perumusan masalah optimasi yang menghasilkan model: $T_{ij} = A_i B_j O_i D_j (S_{ij})^\rho e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}$ $A_i = \frac{1}{\sum_j B_j D_j (S_{ij})^\rho e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}}$ $B_j = \frac{1}{\sum_i A_i O_i (S_{ij})^\rho e^{-\beta C_{ij} - \lambda T_{ij} C_{ij}}}$

Dalam model yang sangat umum ini, $S_{ij}$ mewakili aksesibilitas terhadap lokasi tujuan yang dirasakan dari zona asal $i$. Jika parameter $\rho = 0$, maka hasil yang diperoleh akan sama dengan model Fang dan Tsao.

**Model Peluang-Antara (Intervening-Opportunities Model)** Gagasan dasar dari model ini adalah bahwa pergerakan perjalanan tidak secara eksplisit berkaitan dengan jarak, melainkan pada aksesibilitas relatif dari berbagai peluang untuk memenuhi tujuan perjalanan. Model yang dikembangkan oleh Schneider (1959) ini mengasumsikan bahwa seorang pembuat perjalanan akan mempertimbangkan tujuan-tujuan alternatif yang lebih dekat (peluang antara) sebelum mempertimbangkan tempat yang lebih jauh.

Probabilitas bahwa tujuan perjalanan tidak dapat dipenuhi oleh tujuan mana pun dari asal $i$ ke tujuan ke-$m$ dinyatakan sebagai fungsi eksponensial negatif dari akumulasi peluang pada jarak tersebut ($x_m$). Dari fungsi probabilitas ini, jumlah perjalanan $T_{ij}^m$ dari asal $i$ ke tujuan $j$ (yang merupakan tujuan ke-$m$ dari $i$) diformulasikan sebagai: $T_{ij}^m = O_i A_i [\exp(-\alpha x_{m-1}) - \exp(-\alpha x_m)]$

Dalam hal ini, $\alpha$ adalah probabilitas pembuat perjalanan puas dengan satu peluang, dan konstanta penyeimbang $A_i$ dirumuskan untuk memastikan bahwa model memenuhi batasan asal perjalanan: $A_i = \frac{1}{1 - \exp(-\alpha x_M)}$

Meskipun menarik karena menggunakan prinsip-prinsip dasar yang berbeda (memperlakukan jarak sebagai variabel ordinal, bukan kardinal kontinu seperti pada model gravitasi), model peluang-antara jarang digunakan dalam praktik. Alasannya meliputi: dasar teoretisnya lebih sulit dipahami oleh praktisi, gagasan menangani matriks yang tujuan-tujuannya diurutkan berdasarkan jarak dirasa lebih rumit, keunggulannya dibandingkan model gravitasi tidak terlalu besar, dan kurangnya perangkat lunak penunjang.

**Pendekatan Disagregat** Sementara sebagian besar pembahasan distribusi perjalanan disusun dalam parameter agregat (zona produksi/tarikan dan asal/tujuan), pendekatan disagregat bergeser ke tingkat individu. Pendekatan ini tidak memodelkan "jumlah perjalanan ke tujuan tertentu", melainkan "probabilitas bahwa seorang individu (atau individu perwakilan) akan memilih suatu tujuan tertentu untuk memenuhi kebutuhan dasarnya".

Model disagregat bersifat probabilistik untuk menangkap karakteristik perilaku perjalanan yang lebih kaya dibandingkan model agregat. Meskipun pendekatannya berbeda, model struktur Multinomial Logit untuk pilihan tujuan yang digunakan dalam pendekatan disagregat ini dapat menghasilkan bentuk fungsional yang serupa dengan model gravitasi berbatasan tunggal (singly constrained gravity model).

## Practical Considerations

Dalam konteks besar Pemodelan Distribusi Perjalanan (Trip Distribution Modelling), pertimbangan praktis sangat memengaruhi akurasi yang dapat dicapai oleh model-model tersebut. Hal ini bersumber dari keterbatasan inheren dalam kerangka pemodelan serta ketidakmampuan kita untuk memasukkan deskripsi realitas yang sangat mendetail ke dalam model. Terdapat beberapa poin pertimbangan praktis yang krusial:

**1. Matriks Jarang (Sparse Matrices)** Matriks perjalanan yang diamati di lapangan hampir selalu bersifat jarang, artinya memiliki banyak sel yang kosong. Sebagai contoh, pada area studi dengan 500 zona (250.000 sel), total 2,5 juta perjalanan selama jam sibuk hanya akan menghasilkan rata-rata 10 perjalanan per sel. Karena pergerakan sering terkonsentrasi pada pasangan zona tertentu, peluang untuk tidak mengamati perjalanan pada pasangan asal-tujuan (O-D) tertentu sangatlah tinggi, terutama dengan tingkat sampel yang terbatas (misalnya 20%). Memperluas sel yang kosong ini dapat menimbulkan masalah besar karena akan memperkuat kesalahan dari pengamatan aslinya. Solusi praktis untuk masalah matriks yang sangat jarang ini adalah menggunakan pendekatan matriks parsial atau "memasukkan" (seeding) nilai kecil, misalnya 0,5 perjalanan, ke dalam sel yang kosong tersebut.

**2. Perlakuan terhadap Zona Eksternal (Treatment of External Zones)** Proporsi perjalanan yang signifikan sering kali memiliki setidaknya satu ujung di luar area studi (zona eksternal). Kesesuaian penggunaan model sintetis yang bergantung pada variabel jarak atau biaya sangat diperdebatkan untuk jenis perjalanan ini. Praktik umum yang dilakukan adalah mengeluarkan perjalanan eksternal dari proses pemodelan sintetis; wawancara dilakukan di titik kordon, dan matriks perjalanan eksternal-eksternal (E-E) serta eksternal-internal (E-I) diperbarui menggunakan metode faktor pertumbuhan seperti Furness. Namun, perjalanan E-I harus dikurangkan dari total ujung perjalanan model bangkitan/tarikan sebelum digunakan sebagai kendala dalam model sintetis.

**3. Perjalanan Intra-zona (Intra-zonal Trips)** Karena keterbatasan sistem zonasi, penentuan biaya konektor sentroid untuk mewakili perjalanan intra-zona hanyalah sebuah pendekatan kasar. Penggunaan biaya ini dalam model sering kali kurang memadai, sehingga lebih disarankan untuk mengeluarkan perjalanan intra-zona dari proses pemodelan sintetis. Perjalanan tersebut kemudian dapat diprediksi dengan pendekatan yang lebih sederhana, seperti memastikannya sebagai proporsi tetap dari total ujung perjalanan yang dihasilkan oleh model bangkitan.

**4. Tujuan Perjalanan (Journey Purposes)** Tujuan perjalanan yang berbeda memerlukan model yang berbeda pula. Perjalanan menuju tempat kerja umumnya dimodelkan menggunakan model gravitasi dengan kendala ganda (doubly constrained gravity model). Sebaliknya, sebagian besar tujuan perjalanan lainnya (seperti belanja, rekreasi, dan sosial) dimodelkan menggunakan model dengan kendala tunggal (singly constrained models) karena lebih sulit untuk mengestimasi tarikan perjalanan secara akurat, sehingga proksi (seperti luas lantai ritel atau populasi) sering digunakan.

**5. Faktor K (K Factors)** Dalam kondisi tertentu, mungkin terdapat pasangan zona yang memiliki asosiasi khusus dalam melakukan perjalanan, misalnya sebuah pabrik yang sebagian besar pekerjanya tinggal di perumahan yang dibangun oleh perusahaan tersebut di zona lain. Model gravitasi klasik tidak dapat menangkap efek ini, sehingga diperkenalkanlah sekumpulan parameter tambahan $K_{ij}$. Rumusnya dituliskan sebagai berikut:

$T_{ij} = K_{ij} A_i O_i B_{ij} \exp(-\beta c_{ij})$

Meski penggunaan faktor K dapat membuat model mereproduksi matriks observasi secara persis, hal tersebut menghilangkan kemampuan peramalan model di masa depan. Sangat disarankan untuk menghindari faktor K, kecuali jika terdapat sebagian kecil pasangan zona (kurang dari 5%) dengan asosiasi khusus yang diperkirakan akan bertahan di masa depan.

**6. Kesalahan dalam Pemodelan (Errors in Modelling)** Banyak sel dalam matriks perjalanan memiliki nilai kecil yang secara proporsional membawa tingkat kesalahan yang relatif besar. Terdapat metode analitis pendekatan untuk memperkirakan kesalahan (confidence interval) akibat variabilitas sampel dalam model gravitasi tri-proporsional. Rumus faktor kepercayaan 95% untuk jumlah perjalanan dalam sel $(i, j)$ adalah:

$C_{ij} = \exp \left(2 \left[1 / \sum_{ij} n_{ijk} + 1 / \sum_{jk} n_{ijk} + 1 / \sum_{ki} n_{ijk}\right]^{0.5}\right)$

di mana $n_{ijk}$ adalah jumlah perjalanan yang disampel dalam sel observasi. Selain pendekatan statistik, teknik simulasi (Monte Carlo) dapat digunakan dengan memperkenalkan "kebisingan" (noise) pada variabel input untuk memahami sensitivitas hasil model terhadap kesalahan pada variabel perencanaan tersebut.

**7. Stabilitas Matriks Perjalanan (The Stability of Trip Matrices)** Stabilitas matriks perjalanan dari waktu ke waktu jarang diperdebatkan, padahal realitasnya sistem tidak benar-benar berulang dari hari ke hari. Variasi arus lalu lintas harian pada suatu ruas jalan secara normal adalah sekitar 10%. Variasi ini diukur menggunakan persentase kesalahan absolut rata-rata (% MAE). Rumus untuk tingkat arus lalu lintas adalah:

$% MAE = 100 % \times \left( \sum_a |V_a^a - V_a^b| / \sum_a V_a^a \right)$

Sedangkan rumus pada tingkat matriks O-D adalah:

$% MAE = 100 % \times \left( \sum_{ij} |T_{ij}^a - T_{ij}^b| / \sum_{ij} T_{ij}^a \right)$

di mana indeks $a$ dan $b$ merujuk pada arus ($V$) dan perjalanan O-D ($T_{ij}$) yang diamati pada hari yang berbeda. Bukti menunjukkan bahwa variasi harian pada tingkat matriks perjalanan jauh lebih besar dibandingkan variasi arus lalu lintas. Hasil ini mengindikasikan bahwa upaya untuk mendapatkan matriks perjalanan yang sangat akurat mungkin tidak sepadan, karena matriks tersebut pada dasarnya hanyalah sebuah gambaran sesaat (snapshot). Sebaliknya, tujuan model seharusnya adalah mengestimasi matriks yang dapat menangkap fitur utama perilaku perjalanan dan menghasilkan arus yang konsisten dengan observasi.