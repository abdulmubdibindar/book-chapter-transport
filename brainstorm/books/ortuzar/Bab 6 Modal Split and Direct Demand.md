Model pembagian moda (modal split) dan permintaan langsung (direct demand models) adalah tahapan yang sangat penting dalam perencanaan transportasi, terutama karena transportasi umum menawarkan penggunaan ruang yang lebih efisien serta menghasilkan lebih sedikit kecelakaan dan emisi dibandingkan dengan mobil pribadi. Dalam kerangka evaluasi kebijakan di buku _Modelling Transport_, pemodelan ini menjembatani langkah distribusi perjalanan dan pembebanan jaringan untuk merespons perubahan seperti tarif angkutan, biaya parkir, atau peningkatan layanan.

Pemilihan moda dipengaruhi oleh tiga kelompok faktor utama:

1. **Karakteristik pelaku perjalanan:** seperti ketersediaan mobil, kepemilikan SIM, struktur rumah tangga, dan pendapatan.
2. **Karakteristik perjalanan:** seperti tujuan perjalanan (misalnya, perjalanan ke tempat kerja lebih mudah menggunakan transportasi umum karena rutinitasnya) dan waktu perjalanan.
3. **Karakteristik fasilitas transportasi:** yang meliputi faktor kuantitatif (waktu perjalanan di dalam kendaraan, waktu tunggu, waktu jalan kaki, dan biaya moneter) serta faktor kualitatif (kenyamanan dan keamanan).

Dalam perkembangannya, terdapat beberapa jenis model pembagian moda yang digunakan untuk agregasi data:

**1. Model Pembagian Moda Ujung-Perjalanan (Trip-end Modal-split Models)** Model ini diterapkan segera setelah tahap bangkitan perjalanan agar dapat menjaga karakteristik spesifik individu seperti pendapatan dan kepadatan perumahan. Namun, kelemahan utamanya adalah model ini tidak sensitif terhadap kebijakan karena tidak memasukkan karakteristik jaringan atau mode alternatif, sehingga tidak bisa merespons dampak dari perbaikan transportasi umum atau kebijakan pembatasan mobil.

**2. Model Heuristik Pertukaran Perjalanan (Trip Interchange Heuristics Models)** Model ini diterapkan pasca-distribusi sehingga mampu memasukkan level pelayanan (Level of Service). Salah satu metode yang digunakan adalah analogi formulasi Kirchhoff, di mana proporsi pelaku perjalanan antara asal $i$ dan tujuan $j$ yang memilih moda $k$ ($P_{ij}^k$) dimodelkan sebagai fungsi biaya gabungan masing-masing moda ($C_{ij}^k$):

$P_{ij}^k = \frac{(C_{ij}^k)^{-n}}{\sum (C_{ij}^k)^{-n}}$

di mana $n$ adalah parameter kalibrasi yang mengendalikan sensitivitas terhadap biaya.

**3. Model Sintetis (Synthetic Models)** Melalui pendekatan maksimalisasi entropi, dihasilkan bentuk model Logit yang mendistribusikan pilihan moda secara probabilistik berdasarkan perbedaan biaya umum (generalised costs). Untuk pilihan biner (dua moda), proporsi yang menggunakan moda 1 dihitung dengan rumus:

$P_{ij}^1 = \frac{\exp(-\beta C_{ij}^1)}{\exp(-\beta C_{ij}^1) + \exp(-\beta C_{ij}^2)}$

Di sini, $\beta$ bertindak sebagai parameter dispersi untuk pilihan moda. Jika terdapat lebih dari dua moda, di mana beberapa moda memiliki kemiripan atau korelasi (seperti bus biasa dan bus ekspres), model ini perlu diubah menjadi struktur hierarkis (Nested Logit) agar perilaku kompetisi antar mode digambarkan secara realistis.

**4. Model Permintaan Langsung (Direct Demand Models)** Untuk mengatasi batasan pendekatan sekuensial (empat-tahap) yang sering kali kewalahan menangani kesalahan prediksi pada total titik-akhir perjalanan (trip-ends), Model Permintaan Langsung menggabungkan bangkitan, distribusi, dan pemilihan moda secara bersamaan dalam satu persamaan.

Bentuk awal yang paling terkenal adalah model SARC yang bersifat multiplikatif dengan rumus:

$T_{ijk} = \phi(P_i P_j)^{\theta_{k1}} (I_i I_j)^{\theta_{k2}} \prod_m [(t_{ij}^m)^{\alpha_{km}^1} (c_{ij}^m)^{\alpha_{km}^2}]$

Dalam model ini:

- $T_{ijk}$ adalah volume permintaan dari zona $i$ ke $j$ dengan moda $k$.
- $\phi$ adalah parameter skala.
- $\theta_{k1}$ dan $\theta_{k2}$ adalah elastisitas permintaan terhadap populasi ($P$) dan pendapatan ($I$).
- $\alpha_{km}^1$ dan $\alpha_{km}^2$ adalah elastisitas permintaan terhadap waktu ($t$) dan biaya ($c$), yang mewakili efek langsung maupun elastisitas silang (cross-elasticities) dari opsi moda transportasi yang bersaing.

Dalam pengembangan modernnya, model permintaan langsung memanfaatkan paradigma pemilihan diskret (discrete choice) menggunakan formulasi _Nested Logit_. Pembaruan ini menyatukan model frekuensi, moda, dan pemilihan tujuan ke dalam satu sistem berbasis ukuran aksesibilitas atau "log-sum" secara matematis, yang akhirnya menyelesaikan masalah permintaan perjalanan yang terlalu kaku terhadap perubahan sistem jaringan transportasi.

Secara keseluruhan, pemahaman dan penerapan model-model di Bab 6 sangat krusial dalam struktur buku ini karena memerlukan konsistensi absolut antara parameter di model distribusi dan pemilihan moda. Ketidakkonsistenan parameter, di mana sensitivitas biaya dalam pilihan moda tanpa sengaja dibuat lebih rendah dari pilihan tujuan, akan menghasilkan prediksi kebijakan yang bias secara matematis maupun realitas.

## Factors Influencing Mode Choice

Pilihan moda transportasi merupakan salah satu tahapan paling penting dalam perencanaan transportasi, mengingat transportasi umum menggunakan ruang jalan secara lebih efisien serta menghasilkan lebih sedikit kecelakaan dan emisi dibandingkan dengan mobil pribadi. Dalam konteks pemodelan pembagian moda (modal split), keputusan pemilihan moda dipengaruhi oleh tiga kelompok faktor utama:

**1. Karakteristik Pelaku Perjalanan (Characteristics of the trip maker)** Faktor-faktor yang melekat pada individu atau rumah tangga meliputi:

- Ketersediaan dan/atau kepemilikan mobil.
- Kepemilikan surat izin mengemudi (SIM).
- Struktur rumah tangga (misalnya pasangan muda, pasangan dengan anak, lajang, atau pensiunan).
- Pendapatan.
- Keputusan-keputusan yang dibuat di tempat lain, seperti keharusan menggunakan mobil untuk bekerja atau kebutuhan untuk mengantar anak ke sekolah.
- Kepadatan kawasan permukiman.

**2. Karakteristik Perjalanan (Characteristics of the journey)** Pilihan moda sangat dipengaruhi oleh sifat perjalanan itu sendiri, yang mencakup:

- Tujuan perjalanan. Sebagai contoh, perjalanan menuju tempat kerja umumnya lebih mudah diakomodasi oleh transportasi umum karena sifatnya yang rutin dan mudah disesuaikan dalam jangka panjang.
- Waktu pelaksanaan perjalanan. Perjalanan pada larut malam biasanya lebih sulit dilayani oleh transportasi umum.
- Apakah perjalanan tersebut dilakukan sendirian atau bersama orang lain.

**3. Karakteristik Fasilitas Transportasi (Characteristics of the transport facility)** Kategori ini dibagi lagi menjadi dua jenis faktor penentu, yaitu:

- _Faktor kuantitatif:_ Meliputi komponen waktu perjalanan (waktu di dalam kendaraan, waktu tunggu, dan waktu berjalan kaki), komponen biaya moneter (tarif angkutan, tol, bahan bakar, dan biaya operasional lainnya), ketersediaan serta biaya parkir, hingga keandalan waktu perjalanan dan keteraturan layanan angkutan.
- _Faktor kualitatif:_ Meliputi atribut yang lebih sulit diukur secara langsung seperti kenyamanan dan kemudahan, tingkat keselamatan dan keamanan, beban atau tuntutan dalam mengemudi, serta peluang untuk melakukan aktivitas lain selama perjalanan (seperti membaca atau menggunakan telepon).

Dalam konteks pemodelan yang lebih luas, evaluasi pilihan moda sering kali lebih relevan jika dilihat dalam bentuk rangkaian perjalanan (tours) ketimbang hanya sebagai perjalanan tunggal (trips). Hal ini karena jika seseorang memilih untuk mengendarai mobil pada etape pertama dari rangkaian perjalanannya, kemungkinan besar moda yang sama akan tetap digunakan untuk etape-etape selanjutnya.

Untuk memasukkan pengaruh berbagai faktor kuantitatif di atas ke dalam suatu model matematika, perencana umumnya menggunakan konsep biaya umum (generalised cost). Pemodelan pilihan moda ini pada praktiknya dapat dirancang secara agregat dengan memanfaatkan data di tingkat zona, maupun secara disagregat yang bertumpu pada informasi di tingkat rumah tangga atau individu.

## Trip-end Models

Dalam kerangka pemodelan transportasi, khususnya pada tahap pemilihan moda (_modal split_), Model Pembagian Moda Ujung-Perjalanan (_Trip-end Modal-split Models_) merupakan pendekatan awal yang secara historis sering diterapkan di Amerika Serikat. Berbeda dengan urutan klasik empat-tahap yang meletakkan pembagian moda setelah distribusi perjalanan, pendekatan ini menerapkan model pemilihan moda segera setelah, atau bersamaan dengan, tahap bangkitan perjalanan dan sebelum tujuan perjalanan diketahui.

Pendekatan ini memiliki beberapa karakteristik dan konsekuensi utama dalam penerapannya:

**1. Fokus yang Kuat pada Karakteristik Individu** Penempatan pemodelan di tahapan awal memungkinkan penekanan yang jauh lebih besar pada variabel-variabel keputusan yang melekat pada unit pembuat perjalanan, baik itu individu maupun rumah tangga. Dengan menggunakan metode ini, karakteristik dari masing-masing pembuat perjalanan dapat dipertahankan (misalnya dengan mempertahankan berbagai kelompok demografis hasil analisis kategori) untuk mengestimasi pemilihan moda. Oleh karena itu, model ujung-perjalanan sangat mengandalkan variabel determinan seperti tingkat pendapatan, kepadatan kawasan permukiman, dan kepemilikan mobil.

**2. Mengabaikan Karakteristik Perjalanan dan Moda** Karena tujuan akhir dari sebuah perjalanan belum diketahui pada tahap ini, model ujung-perjalanan tidak dapat memasukkan karakteristik spesifik dari perjalanan tersebut maupun atribut dari moda transportasi alternatif yang bersaing. Pendekatan ini memaksa para pembuat model untuk sekadar mengambil nilai "rata-rata" dari atribut perjalanan dan moda transportasi, yang secara signifikan mengurangi relevansi model terhadap kebijakan.

**3. Representasi Paradigma "Prediksi dan Sediakan"** Penggunaan model ujung-perjalanan sangat sejalan dengan filosofi perencanaan di masa lalu, yang berasumsi bahwa seiring dengan peningkatan pendapatan, mayoritas masyarakat akan membeli dan menggunakan mobil. Tujuan utama dari perencanaan transportasi saat itu hanyalah untuk memprediksi besaran pertumbuhan permintaan mobil agar investasi infrastruktur jalan dapat disiapkan untuk memenuhi permintaan tersebut (pendekatan _predict and provide_). Paradigma ini sekarang dianggap sebagai pendekatan yang keliru dan berbahaya.

**4. Sangat Tidak Peka terhadap Kebijakan (_Policy Insensitive_)** Meskipun dalam jangka pendek model ini bisa jadi sangat akurat—terutama jika layanan transportasi umum tersebar merata di seluruh wilayah studi dan kemacetan masih minim—model ini pada dasarnya bersifat "kalah" (_defeatist_) karena sama sekali tidak sensitif terhadap keputusan kebijakan. Intervensi seperti peningkatan kualitas transportasi umum, pembatasan ruang parkir, atau pengenaan tarif jalan raya (_road pricing_) tidak akan memberikan pengaruh apa pun pada hasil prediksi pemilihan moda. Hal ini terjadi karena model gagal memasukkan karakteristik agregat dari masing-masing moda (hanya kadang-kadang menggunakan indeks aksesibilitas kasar untuk mewakili ketersediaan transportasi umum).

Singkatnya, di dalam konteks pemodelan yang lebih luas, model ujung-perjalanan menggambarkan sebuah fase di mana pemodelan terlalu terfokus pada karakteristik pengguna dan gagal menangkap mekanisme kompetisi antar-moda berdasarkan layanan dan biaya. Keterbatasan yang fatal inilah yang pada akhirnya mendorong modifikasi metode perencanaan transportasi menuju pendekatan _Trip Interchange_ (pemodelan pasca-distribusi) maupun _Direct Demand Models_, agar faktor-faktor kebijakan dapat dilibatkan secara langsung dalam probabilitas pemilihan moda.

## Trip Interchange Heuristics

Model Heuristik Pertukaran Perjalanan (_Trip Interchange Heuristics Modal-split Models_) merupakan pendekatan yang secara historis mendominasi pemodelan pembagian moda di Eropa `. Dalam konteks yang lebih luas mengenai pembagian moda dan permintaan langsung pada Bab 6, model ini merupakan kebalikan dari model ujung-perjalanan (*trip-end*); pendekatan ini diterapkan pasca-distribusi (*post-distribution*), yakni setelah tahap model gravitasi atau model distribusi lainnya dijalankan`.

**Keunggulan dan Kelemahan Utama** Penempatan model setelah tahap distribusi ini memberikan keuntungan karena memfasilitasi inklusi secara langsung dari karakteristik perjalanan serta atribut-atribut dari moda alternatif yang tersedia `. Namun, pendekatan ini memiliki kelemahan dasar yaitu membuat penggabungan karakteristik spesifik dari pelaku perjalanan menjadi lebih sulit, karena data pada tahap ini umumnya sudah diagregasi ke dalam satu atau beberapa matriks perjalanan`. Secara makro, model-model heuristik ini memiliki basis teoretis yang terbatas sehingga akurasi interpretasi dan kemampuan peramalannya sering kali diragukan `. Sifatnya yang agregat juga membuatnya tidak mampu memodelkan secara penuh kendala-kendala atau karakteristik moda spesifik pada tingkat individu rumah tangga`.

**Kurva Pengalihan (_Diversion Curves_)** Model-model awal dalam pendekatan heuristik ini biasanya hanya memasukkan satu atau dua karakteristik perjalanan, yang paling sering adalah waktu tempuh di dalam kendaraan `. Secara empiris diamati bahwa perilaku pemilihan moda ini paling baik direpresentasikan oleh kurva berbentuk S, yang secara historis dikenal sebagai kurva pengalihan (*diversion curves*)`.

**Formulasi Analogi Kirchhoff** Selain kurva pengalihan, pendekatan heuristik lainnya bertumpu pada analogi formulasi Kirchhoff dalam kelistrikan ``. Proporsi pelaku perjalanan dari asal $i$ ke tujuan $j$ yang memilih moda $k$ ($P_{ij}^k$) dimodelkan sebagai fungsi dari biaya umum masing-masing moda ($C_{ij}^k$) dengan rumus:

$P_{ij}^k = \frac{(C_{ij}^k)^{-n}}{\sum (C_{ij}^k)^{-n}}$

Dalam rumus ini, $n$ adalah parameter untuk kalibrasi yang nilainya umumnya berkisar antara 4 hingga 9, atau bisa juga ditransfer dari wilayah/waktu yang lain `. Formulasi Kirchhoff ini dinilai menarik karena penentuan pilihan rute atau modanya bergantung pada rasio biaya, bukan selisih biaya`. Hal ini mengatasi kelemahan pada sebagian model Logit biner, di mana selisih biaya 5 menit akan dievaluasi memiliki beban yang sama persis baik dalam perjalanan berdurasi 30 menit maupun perjalanan berdurasi 6 jam. Meskipun bersifat heuristik, formulasi ini sebenarnya dapat diturunkan menggunakan prinsip maksimalisasi entropi dan konsisten dengan fungsi utilitas yang mengalami transformasi Box-Cox.

**Keterbatasan Aplikasi** Keterbatasan utama dari model-model heuristik pertukaran perjalanan ini di dalam praktiknya adalah penerapannya yang hanya berlaku bagi pengguna yang benar-benar memiliki kebebasan untuk memilih . Hal ini berarti model tersebut umumnya hanya dapat diaplikasikan pada matriks perjalanan khusus untuk orang-orang yang memiliki akses terhadap mobil (*car-available persons*).

## Synthetic Models and Calibration

Dalam konteks Bab 6 mengenai Model Pemisahan Moda dan Permintaan Langsung (Modal Split and Direct Demand Models), model sintetik (synthetic models) dan proses kalibrasinya adalah elemen fundamental untuk memperkirakan probabilitas dan distribusi perjalanan antar moda.

Pendekatan maksimalisasi entropi dapat digunakan untuk menghasilkan model distribusi dan pemisahan moda secara bersamaan. Untuk kasus dua moda, pemodelan ini mengarah pada solusi berbentuk fungsi Logit untuk menghitung proporsi perjalanan $P_{ij}^1$ dari zona $i$ ke $j$ menggunakan moda 1: $P_{ij}^1 = \frac{\exp(-\beta C_{ij}^1)}{\exp(-\beta C_{ij}^1) + \exp(-\beta C_{ij}^2)}$. Bentuk ini juga dapat diperluas untuk menganalisis pilihan multi-moda dengan persamaan: $P_{ij}^1 = \frac{\exp(-\beta C_{ij}^1)}{\sum_k \exp(-\beta C_{ij}^k)}$. Namun, formulasi dasar ini memiliki kelemahan karena menuntut satu parameter $\beta$ untuk memainkan peran ganda, yakni mengendalikan dispersi dalam pemilihan moda sekaligus pemilihan tujuan perjalanan. Spesifikasi yang lebih konsisten dengan teori pilihan rasional memisahkan model ke dalam struktur hierarkis dengan memperkenalkan ukuran biaya gabungan (composite cost) $K_{ij}^n$ yang dirumuskan sebagai: $K_{ij}^n = -\frac{1}{\lambda_n} \log \sum_k \exp(-\lambda_n C_{ij}^k)$. Struktur gabungan ini mengharuskan terpenuhinya batasan $\beta_n \le \lambda_n$, yang secara intuitif bermakna bahwa faktor biaya dianggap lebih kritis di dalam menentukan pemilihan moda dibandingkan dengan pemilihan tujuan.

Dalam pemodelan sintetik yang melibatkan lebih dari dua moda, opsi strukturnya mencakup pendekatan N-way, added-mode, atau hierarkis (nested). Struktur hierarkis sangat dianjurkan untuk mengatasi masalah korelasi ketika beberapa opsi alternatif memiliki kesamaan sifat, seperti pada anomali pilihan bus merah vs. bus biru yang membuat struktur N-way gagal memprediksi probabilitas dengan masuk akal.

Terkait proses Kalibrasi untuk Model Logit Biner, analis berfokus pada upaya menemukan nilai kecocokan terbaik (best-fit) untuk parameter dispersi $\lambda$ dan penalti moda $\delta$ yang mewakili atribut tak terukur dari moda kedua. Model ini dapat dikalibrasi menggunakan metode regresi linear sederhana melalui transformasi Berkson-Theil: $\log[P_1/(1 - P_1)] = \lambda(C_2 - C_1) + \lambda\delta$. Dalam rumusan regresi ini, parameter $\lambda$ mewakili kemiringan (slope) garis, sedangkan $\lambda\delta$ bertindak sebagai titik potongnya (intercept).

Untuk Kalibrasi Model Pemisahan Moda Hierarkis (Hierarchical Modal-split Models), prosedurnya umumnya dilakukan secara heuristik atau rekursif, yang dimulai dari sub-pemisahan moda (misalnya, bersaingnya moda-moda angkutan umum yang berkorelasi) kemudian bergerak ke atas menuju pemisahan primer (misalnya, angkutan umum vs. mobil pribadi). Metode estimasi _maximum likelihood_ (kemungkinan maksimum) dinilai jauh lebih unggul dan efisien dibandingkan estimasi _least squares_ (kuadrat terkecil), terutama dalam menangani himpunan data yang berskala besar. Fungsi log-likelihood untuk suatu interval perbedaan biaya $k$ dengan $n_k$ observasi dan pilihan pada moda pertama $r_k$ diformulasikan sebagai: $L = \text{Constant} + \sum_k [(n_k - r_k) \log(1 - P_k) + r_k \log P_k]$. Nilai maksimum dari fungsi ini dapat ditemukan secara matematis dengan menghitung turunan pertama dan kedua dari persamaan log-likelihood terhadap parameter-parameternya, sehingga algoritma pencarian standar dapat digunakan untuk mencapai konvergensi.

Sebagai alternatif dari pendekatan berurutan di atas, terdapat Model Permintaan Langsung (Direct Demand Models) yang merangkum perhitungan bangkitan, distribusi, dan pemisahan moda ke dalam satu model tunggal. Salah satu contoh awalnya adalah model SARC yang mengestimasi permintaan rute dan moda sebagai fungsi multiplikatif dari variabel sosio-ekonomi dan atribut tingkat layanan (level-of-service) moda: $T_{ijk} = \phi (P_i P_j)^{\theta_{k1}} (I_i I_j)^{\theta_{k2}} \prod_m [(t_{ij}^m)^{\alpha_{1km}} (c_{ij}^m)^{\alpha_{2km}}]$. Walaupun model ini menawarkan keunggulan dalam memproses perilaku komprehensif tanpa terpisah-pisah, ia jarang digunakan pada kajian perkotaan karena menuntut jumlah parameter yang terlampau besar untuk dikalibrasi.

## Direct Demand Models

Model Permintaan Langsung (_Direct Demand Models_) merupakan alternatif dari metodologi sekuensial (berurutan) konvensional dengan cara merangkum perhitungan bangkitan perjalanan, distribusi, dan pemilihan moda ke dalam satu model estimasi secara langsung. Pendekatan ini sangat menarik karena menghindari berbagai kelemahan pendekatan berurutan, seperti masalah pada model gravitasi yang harus mengatasi kesalahan dalam total akhir perjalanan dan lemahnya estimasi perjalanan intra-zona.

Secara umum, terdapat dua jenis model permintaan langsung: model murni langsung (_purely direct_) yang menggunakan satu persamaan tunggal untuk menghubungkan permintaan perjalanan dengan atribut moda, perjalanan, dan individu; serta pendekatan kuasi-langsung (_quasi-direct_) yang menerapkan semacam pemisahan antara pemisahan moda dan total permintaan perjalanan asal-tujuan (O-D).

Bentuk paling awal dari model ini bersifat multiplikatif. Salah satu yang paling dikenal adalah model SARC yang mengestimasi permintaan sebagai fungsi multiplikatif dari variabel aktivitas dan sosial-ekonomi untuk setiap pasangan zona, beserta atribut tingkat layanan (_level-of-service_) dari moda yang melayani. Rumus dari model ini dijabarkan sebagai: $T_{ijk} = \phi(P_i P_j)^{\theta_{k1}} (I_i I_j)^{\theta_{k2}} \prod_m [(t_{ij}^m)^{\alpha_{1km}} (c_{ij}^m)^{\alpha_{2km}}]$.

Dalam persamaan tersebut, $P$ mewakili populasi, $I$ mewakili pendapatan, serta $t$ dan $c$ masing-masing adalah waktu dan biaya perjalanan antara zona $i$ dan $j$ menggunakan moda $k$. Koefisien $\phi$, $\theta$, dan $\alpha$ adalah parameter model, di mana $\theta_{k1}$ dan $\theta_{k2}$ dapat diinterpretasikan sebagai elastisitas permintaan terhadap populasi dan pendapatan yang diharapkan bernilai positif. Sementara itu, $\alpha_{1km}$ dan $\alpha_{2km}$ merupakan elastisitas permintaan terhadap waktu dan biaya perjalanan; untuk moda yang sama (elastisitas langsung) nilainya harus negatif, sedangkan untuk moda pesaing (elastisitas silang) nilainya harus positif. Meskipun model ini komprehensif, ia memiliki kelemahan utama yaitu menuntut jumlah parameter yang sangat besar untuk diestimasi.

Dalam praktiknya, berbagai varian model permintaan langsung lebih banyak digunakan dalam konteks transportasi antar-kota (_inter-urban_) dan sangat jarang diaplikasikan di daerah perkotaan. Biasanya, logaritma dari jumlah perjalanan dan variabel penjelas digunakan untuk membentuk model log-linear sehingga dapat diestimasi menggunakan perangkat lunak model linear digeneralisasi seperti GLIM.

Pembaruan modern pada model permintaan langsung membawanya lebih dekat ke pendekatan pilihan diskret yang digunakan dalam model klasik, namun tetap berfokus pada konteks antar-kota. Data dari survei asal-tujuan digunakan untuk mengestimasi model pilihan frekuensi, moda, dan tujuan secara gabungan dengan menggunakan struktur _Nested Logit_. Sebagai contoh, dalam model untuk makro-zona di Utara Chili, komponen pilihan tujuan-moda memiliki bentuk fungsi utilitas umum sebagai berikut: $V^{* Mzj} = V^{g,a,l Mzj} + \log (S_{1j} + y_2 S_{2j} + \dots + y_{117} S_{117j})$.

Suku pertama di sisi kanan mencakup karakteristik individu (seperti ukuran rombongan $g$, kepemilikan mobil $a$, dan kepemilikan SIM $l$) serta variabel tingkat layanan. Suku kedua memperkenalkan variabel ukuran $S$ yang terkait dengan daya tarik tujuan sebagai jumlah berbobot di dalam logaritma.

Versi disaggregat dari model ini kemudian dihubungkan dengan pilihan frekuensi perjalanan melalui variabel "aksesibilitas" komposit. Representasi ukuran aksesibilitas ($Acc$) untuk suatu zona $Z$ dan panjang perjalanan $L$ bagi kelas pengguna tertentu diturunkan sebagai nilai _log-sum_ dengan melibatkan parameter struktural $\phi$ yang besarnya antara 0 dan 1: $Acc^{g,a,l}_{Z,L} = \frac{1}{\phi} \cdot \log \left( \sum_{\forall j \in J_L; j \neq Z} e^{\phi \log \left( \sum_{M=1,8} e^{U^{M*}_{Zj}} \right)} \right)$.

Penggabungan aksesibilitas komposit pada tahap pemilihan frekuensi bangkitan perjalanan ini dianggap berhasil menyelesaikan masalah permintaan inelastis yang kerap menjadi kelemahan dalam model transportasi berurutan.
