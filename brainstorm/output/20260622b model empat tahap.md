# Hasil Brainstorming: Draft Subbab Model Empat Tahap
**Tanggal:** Senin, 22 Juni 2026 (15:15 WIB)  
**Sesi Diskusi:** Penyusunan Draft Subbab "Model Empat Tahap"  

---

## MODEL EMPAT TAHAP (*FOUR-STEP MODEL*)

### 1. Definisi, Sejarah, dan Fungsi Utama

Model Perencanaan Transportasi Empat Tahap (atau lebih populer disebut *Four-Step Model* [FSM] atau Model Perencanaan Transportasi Empat Tahap [MPTEP]) adalah kerangka kerja analitis klasik yang paling dominan digunakan dalam peramalan permintaan perjalanan transportasi (*transport travel demand forecasting*). Secara konseptual, model ini menyederhanakan interaksi kompleks antara sistem penataan ruang (tata guna lahan) dengan kapasitas jaringan prasarana transportasi ke dalam prosedur pemodelan matematika yang terstruktur dan sekuensial.

Fungsi utama dari model empat tahap adalah memperkirakan volume lalu lintas, pola arus pergerakan barang atau manusia, dan tingkat pelayanan (*level of service*) pada suatu jaringan jalan maupun angkutan umum di masa depan berdasarkan proyeksi kondisi demografi, sosial-ekonomi, dan tata guna lahan tertentu. Informasi ini digunakan oleh perencana wilayah dan kota untuk mengevaluasi kelayakan proyek investasi infrastruktur baru, menyusun rencana induk sektoral transportasi, atau merancang skenario manajemen lalu lintas.

Model ini pertama kali dikembangkan secara empiris pada dekade 1950-an di Amerika Serikat seiring dengan kebutuhan memproyeksikan kapasitas pembangunan jalan bebas hambatan antarpasar (*interstate highway system*). Prosedur formalnya dirintis secara komprehensif dalam *Detroit Metropolitan Area Traffic Study* (1953) dan diterapkan secara institusional berskala regional untuk pertama kalinya dalam *Chicago Area Transportation Study* (CATS) pada tahun 1956. Sejak saat itu, model ini diadopsi secara global dan menjadi prosedur standar perencanaan transportasi makro.

Sesuai dengan namanya, model ini terdiri atas empat tahapan matematis yang saling berurutan:
1.  **Bangkitan Perjalanan (*Trip Generation*)**
2.  **Distribusi Perjalanan (*Trip Distribution*)**
3.  **Pemilihan Moda (*Mode Choice*)**
4.  **Pembebanan Jaringan (*Route Assignment*)**

---

### 2. Rincian Tahapan, Data, Metode, dan Keluaran

Secara operasional, area studi dibatasi oleh suatu garis kordon lalu lintas luar dan dibagi secara spasial ke dalam Zona Analisis Lalu Lintas (*Traffic Analysis Zones* / TAZ). Berikut adalah rincian dari masing-masing tahapan di dalam FSM:

#### A. Bangkitan Perjalanan (*Trip Generation*)
*   **Fungsi:** Menghitung total jumlah perjalanan harian yang dihasilkan (*produced*, $O_i$) dari zona asal ($i$) dan total jumlah perjalanan yang ditarik (*attracted*, $D_j$) ke zona tujuan ($j$).
*   **Data yang Diperlukan:** 
    *   *Ujung Produksi:* Data sosio-ekonomi rumah tangga (jumlah anggota keluarga, pendapatan rata-rata, tingkat kepemilikan kendaraan per rumah tangga).
    *   *Ujung Tarikan:* Data penggunaan lahan dan intensitas aktivitas ekonomi (jumlah lapangan kerja per sektor, luas lantai bangunan ritel, jumlah murid sekolah, fasilitas publik/sosial).
*   **Metode Perhitungan:**
    *   *Analisis Regresi Linier Berganda:* Mengasumsikan jumlah bangkitan sebagai fungsi linier dari variabel sosio-ekonomi:
        $$O_i = a + b_1X_{1i} + b_2X_{2i} + ... + b_nX_{ni}$$
        (di mana $X$ adalah variabel independen seperti kepemilikan mobil atau pendapatan).
    *   *Analisis Klasifikasi Silang (Category Analysis):* Mengelompokkan rumah tangga ke dalam sel matriks berdasarkan karakteristik (misal: kepemilikan mobil 0, 1, atau $\ge 2$ dengan jumlah anggota keluarga) untuk menghitung rata-rata laju pergerakan.
*   **Keluaran (*Output*):** Vektor total produksi perjalanan untuk tiap zona ($O_i$) dan vektor total tarikan perjalanan untuk tiap zona ($D_j$).

#### B. Distribusi Perjalanan (*Trip Distribution*)
*   **Fungsi:** Menghubungkan kutub produksi ($O_i$) dengan kutub tarikan ($D_j$) untuk menghasilkan pola sebaran perjalanan antarzona di dalam ruang geografis.
*   **Data yang Diperlukan:** 
    *   Total nilai bangkitan ($O_i$ dan $D_j$) dari tahap pertama.
    *   Matriks impedansi (biaya umum atau waktu tempuh antarzona yang diperoleh dari representasi jaringan jalan bebas hambatan/*skim trees*).
*   **Metode Perhitungan:**
    *   *Model Gravitasi (Gravity Model):* Meminjam analogi hukum gravitasi fisik Newtonian dengan formula:
        $$T_{ij} = O_i \frac{D_j f(C_{ij}) K_{ij}}{\sum_k D_k f(C_{ik}) K_{ik}}$$
        (di mana $T_{ij}$ adalah perjalanan dari zona $i$ ke $j$; $f(C_{ij})$ adalah fungsi friksi/impedansi perjalanan seperti $C_{ij}^{-b}$ atau $e^{-b C_{ij}}$ dengan biaya perjalanan $C_{ij}$; dan $K_{ij}$ adalah faktor penyesuaian sosio-ekonomi khusus antar zona).
*   **Keluaran (*Output*):** Matriks Asal-Tujuan (MAT) perjalanan antarzona ($T_{ij}$) yang mewakili total aliran perjalanan spasial.

#### C. Pemilihan Moda (*Mode Choice* / *Modal Split*)
*   **Fungsi:** Memisahkan aliran perjalanan dalam MAT umum ($T_{ij}$) ke dalam matriks-matriks perjalanan berdasarkan alternatif moda transportasi yang tersedia.
*   **Data yang Diperlukan:** 
    *   Karakteristik moda (waktu perjalanan, biaya tarif/bahan bakar, frekuensi layanan angkutan umum, waktu tunggu, kenyamanan).
    *   Karakteristik pelaku perjalanan (tingkat pendapatan pribadi, ketersediaan SIM, kepemilikan kendaraan pribadi).
*   **Metode Perhitungan:**
    *   *Model Pilihan Diskrit (Discrete Choice Model),* utamanya **Multinomial Logit (MNL)**:
        $$P_{im} = \frac{e^{V_{im}}}{\sum_{k} e^{V_{ik}}}$$
        (di mana $P_{im}$ adalah probabilitas pelaku perjalanan memilih moda $m$; $V_{im}$ adalah fungsi utilitas representatif dari moda $m$ yang dirumuskan secara linear: $V_{im} = a_0 + a_1(Waktu) + a_2(Biaya) + ...$).
*   **Keluaran (*Output*):** Matriks Asal-Tujuan perjalanan per moda (misalnya MAT kendaraan roda dua, MAT kendaraan roda empat pribadi, dan MAT bus angkutan umum).

#### D. Pembebanan Jaringan (*Route Assignment*)
*   **Fungsi:** Menempatkan dan mengalokasikan matriks perjalanan per moda ke rute-rute fisik yang tersedia di jaringan transportasi jalan raya atau trayek angkutan umum.
*   **Data yang Diperlukan:** 
    *   MAT perjalanan per moda hasil tahap 3.
    *   Karakteristik fisik jaringan (geometri ruas jalan, panjang, jumlah lajur, kapasitas rencana ruas, kecepatan arus bebas).
    *   Kurva hubungan tundaan ruas (*link congestion function* / fungsi hambatan ruas).
*   **Metode Perhitungan:**
    *   *User Equilibrium (UE) / Keseimbangan Pengguna Wardrop:* Berdasarkan prinsip bahwa semua rute yang digunakan memiliki biaya perjalanan umum yang sama, dan tidak ada pengguna yang dapat mengurangi waktu tempuhnya dengan berpindah rute secara sepihak. Waktu tempuh ruas ($t_a$) berubah akibat kemacetan berdasarkan fungsi dari Biro Jalan Umum AS (BPR):
        $$t_a = t_0 \left[ 1 + \alpha \left( \frac{V_a}{C_a} \right)^\beta \right]$$
        (di mana $t_0$ adalah waktu tempuh bebas hambatan; $V_a$ adalah volume lalu lintas ruas; $C_a$ adalah kapasitas ruas; serta $\alpha = 0.15$ dan $\beta = 4$ adalah nilai parameter standar).
*   **Keluaran (*Output*):** Volume lalu lintas (kendaraan/jam) pada setiap segmen/ruas jalan dalam jaringan, tingkat kejenuhan ruas (*V/C ratio*), dan waktu tempuh perjalanan setelah ekuilibrium.

---

### 3. Telaah Kasuistik Penggunaan FSM

Penggunaan FSM di dunia nyata dapat dipelajari secara kasuistik melalui dua contoh kontras perencanaan di Indonesia:

#### A. Kasus Perencanaan Agregat Regional: Studi SITRAMP Jabodetabek (2004)
Dalam perencanaan makro wilayah megapolitan Jakarta pada tahun 2004, proyek **SITRAMP (*Study on Integrated Transportation Master Plan for Jabodetabek*)** yang digarap oleh JICA bersama Bappenas memanfaatkan model FSM untuk mensimulasikan proyeksi kemacetan 20 tahun mendatang (target tahun 2020). 

*   **Penerapan:** Pemodelan membagi Jabodetabek menjadi ratusan zona analisis dan menyusun model bangkitan serta distribusi berbasis survei komuter skala besar. Melalui tahap pemilihan moda dan pembebanan rute statis, model mensimulasikan skenario "tanpa intervensi" (*do-nothing scenario*), yang memproyeksikan rasio kejenuhan jalan ($V/C$) di batas kota Jakarta akan melebihi angka 1,5, yang secara spasial meramalkan kelumpuhan total lalu lintas.
*   **Implikasi Kebijakan:** Hasil simulasi FSM ini melegitimasi secara ilmiah kebutuhan reformasi prasarana transportasi massal secara radikal. Dari studi ini, dirumuskan cetak biru pembangunan koridor busway (BRT) Transjakarta secara eksklusif, penambahan jalur ganda (*double tracking*) kereta komuter lintas penyangga, inisiasi proyek MRT Jakarta koridor Utara-Selatan, dan opsi pembatasan volume lalu lintas lewat jalan berbayar elektronik (*Electronic Road Pricing* / ERP).

#### B. Kasus Dinamis Tanggap Darurat: Evaluasi Rencana Evakuasi Tsunami Kota Padang
Ketika FSM dihadapkan pada skenario keselamatan publik yang dinamis dan terdesentralisasi, keterbatasan struktural model ini mulai terlihat. Dalam studi simulasi evakuasi tsunami pasca gempa bumi patahan Sumatera di pesisir Kota Padang, FSM konvensional terbukti tidak memadai.

*   **Penerapan & Batasan:** FSM tradisional mengasumsikan keputusan perjalanan bersifat statis, agregat, dan independen terhadap dimensi waktu yang sempit. Dalam situasi bencana, pelaku perjalanan tidak melakukan pergerakan searah yang linear. Ada kebutuhan rantai aktivitas (*trip chaining*) multi-destinasi, seperti orang tua yang harus berkendara menjemput anak terlebih dahulu ke sekolah (koordinasi tingkat rumah tangga) sebelum bergerak menuju zona aman di dataran tinggi. 
*   **Pembelajaran:** Penggunaan model FSM statis dalam kasus ini akan meremehkan volume kendaraan sesungguhnya di persimpangan kritis karena mengabaikan dinamika temporal. Melalui transisi ke model mikrosimulasi berbasis agen (*Agent-Based Modeling* menggunakan MATSim), ditemukan bahwa ketika seluruh agen bergerak serentak dengan perilaku menjemput anggota keluarga, derajat kejenuhan di rute evakuasi melejit hingga 3,18. Studi kasuistik ini membuktikan bahwa FSM sangat andal untuk infrastruktur makroskopik jangka panjang, namun gagal memitigasi manajemen risiko yang dipengaruhi oleh aspek temporal dan rantai aktivitas individu yang sangat dinamis.
