Terkait pertanyaan Anda sebelumnya mengenai batasan utama model jaringan _node-link_ (simpul-tautan), sumber menyebutkan beberapa kelemahan utama dari metode klasik ini:

1. **Jaringan yang tidak lengkap**: Tidak semua tautan jalan di dunia nyata dimasukkan ke dalam jaringan. Hal ini menyebabkan perjalanan di jalan-jalan kecil atau jalan tikus (_rat runs_) keliru dianggap sebagai perjalanan yang baru dihasilkan ketika ada skema pengurangan kemacetan,.
2. **Efek ujung (_end effects_)**: Efek ini timbul akibat agregasi titik awal dan akhir perjalanan ke dalam zona-zona yang hanya diwakili oleh satu sentroid (titik pusat) tunggal. Akibatnya, estimasi volume arus lalu lintas di sekitar konektor sentroid cenderung kurang akurat dan sering kali dinilai terlalu tinggi,.
3. **Pergerakan berbelok**: Manuver berbelok yang dilarang atau yang seharusnya dikenai penalti waktu sering kali tidak secara eksplisit ditentukan di dalam jaringan.
4. **Perjalanan intra-zona**: Perjalanan di dalam zona yang sama tidak ditangani dengan baik karena pergerakan ini tidak membebani jaringan model, padahal di dunia nyata pergerakan tersebut mungkin menggunakan tautan jalan utama,.

Mengenai Bab 11 yang berjudul "_Equilibrium and Dynamic Assignment_" (Ekuilibrium dan Pembebanan Dinamis), bab ini ditempatkan sebagai kelanjutan yang lebih ketat secara matematis dari teknik pembebanan lalu lintas yang diperkenalkan pada Bab 10 dalam buku _Modelling Transport 4th Edition_. Dalam konteks yang lebih luas, bab ini membahas peningkatan ketepatan model transportasi melalui beberapa tema sentral berikut:

**1. Pendekatan Ekuilibrium Pengguna dan Sosial** Bab ini beranjak dari metode heuristik ke kerangka pemrograman matematis yang ketat untuk memecahkan masalah kemacetan menggunakan Prinsip Wardrop,. Prinsip pertama Wardrop (Ekuilibrium Pengguna / _User Equilibrium_) mengasumsikan bahwa lalu lintas akan mendistribusikan dirinya sendiri hingga tidak ada satupun pelancong yang dapat mengurangi biaya perjalanannya dengan mengubah rute. Di sisi lain, Ekuilibrium Sosial (Prinsip kedua Wardrop) dirancang agar pengatur lalu lintas dapat meminimalkan total pengeluaran waktu atau rata-rata biaya perjalanan bagi seluruh sistem,. Bab ini meninjau algoritma resolusi standar seperti algoritma _Frank-Wolfe_, serta pembebanan berbasis rute dan pembebanan berbasis asal (_Origin-based assignment_),.

**2. Ekuilibrium Sistem Transportasi (Model Gabungan)** Pembebanan rute tidak terjadi di ruang hampa, melainkan berinteraksi dengan sub-model lainnya seperti distribusi perjalanan dan pemilihan moda. Bab ini mengkritik penggunaan "umpan balik naif" (_naive feedback_) antar model yang hanya memutar ulang waktu perjalanan dan terbukti sering gagal mencapai konvergensi yang stabil. Sebaliknya, buku ini sangat merekomendasikan formulasi sistem model gabungan (_combined model system_) untuk memastikan konsistensi biaya secara simultan,.

**3. Dinamika Lalu Lintas** Model pembebanan klasik umumnya cacat karena mengasumsikan kondisi tunak (_steady-state_) pada periode tertentu dan biaya tautan yang sepenuhnya terpisah (_separable_). Bab ini mengeksplorasi sifat dinamis dari arus kendaraan, di mana penumpukan antrean nyata pada titik kemacetan (_bottleneck_) menyebar ke tautan sebelumnya seiring waktu,. Pendekatan seperti Pembebanan Lalu Lintas Dinamis (_Dynamic Traffic Assignment_ / DTA) dan simulasi mikro/meso (seperti model SATURN) didiskusikan untuk memodelkan interaksi secara akurat, penyebaran peleton kendaraan, dan variabilitas waktu perjalanan,,.

**4. Pilihan Waktu Keberangkatan (_Departure Time Choice_)** Sebagai respons langsung terhadap kemacetan, pengemudi sering menunda atau memajukan waktu keberangkatan mereka, sebuah fenomena yang dikenal sebagai penyebaran waktu puncak (_peak spreading_). Bab ini menguraikan disutilitas jadwal (_schedule disutility_), di mana pemodelan menilai pertukaran (_trade-off_) antara penghematan waktu perjalanan melawan penalti akibat tiba lebih awal (SDE) atau tiba terlambat (SDL) dibandingkan dengan Waktu Kedatangan yang Diinginkan (PAT) pengguna,. Konsep ini kemudian digabungkan ke dalam model ekuilibrium pasokan dan permintaan yang memperhitungkan heterogenitas para pelancong,.

## Mathematical Programming Approach

Dalam Bab 11 mengenai _Equilibrium and Dynamic Assignment_, Pendekatan Pemrograman Matematis (_Mathematical Programming Approach_) digunakan untuk merumuskan masalah pembebanan lalu lintas ekuilibrium secara ketat dan analitis. Pendekatan ini secara matematis mengekspresikan Prinsip Pertama Wardrop (Ekuilibrium Pengguna), yang menyatakan bahwa pada jaringan yang macet, lalu lintas akan mendistribusikan dirinya sedemikian rupa sehingga tidak ada satu pun pengguna yang dapat mengurangi biaya perjalanannya dengan beralih ke rute lain.

Pendekatan ini pertama kali diusulkan oleh Beckman et al. (1956) dengan merumuskan masalah sebagai proses optimisasi yang bertujuan meminimalkan sebuah fungsi objektif dengan batasan-batasan aliran tertentu. Sesuai dengan instruksi Anda, berikut adalah perumusan matematis dari masalah tersebut:

Minimalkan $Z{T_{ijr}} = \sum_a \int_0^{V_a} C_a(v) dv$

Dengan batasan (konstrain) pemenuhan permintaan: $\sum_r T_{ijr} = T_{ij}$

Serta batasan non-negatif: $T_{ijr} \ge 0$

Dalam rumusan di atas, fungsi objektif $Z$ merupakan jumlah dari area di bawah kurva biaya-arus (_cost-flow curves_) untuk semua tautan (link) di jaringan.

Pendekatan ini bergantung pada sifat-sifat matematis yang dimilikinya. Fungsi objektif $Z$ terbukti cembung (_convex_) karena turunan pertama dan keduanya bernilai non-negatif. Turunan pertama dari $Z$ terhadap aliran rute $T_{ijr}$ menghasilkan biaya perjalanan pada rute tersebut: $\frac{\partial Z}{\partial T_{ijr}} = c_{ijr}$

Sedangkan turunan keduanya akan bernilai lebih besar atau sama dengan nol asalkan turunan dari hubungan biaya-arus bernilai positif atau nol, yang berarti biaya tidak boleh menurun ketika arus kendaraan meningkat.

Untuk menyelesaikan masalah optimisasi dengan batasan ini, digunakan metode Lagrangian. Fungsi Lagrangian-nya dirumuskan sebagai: $L({T_{ijr}, \phi_{ij}}) = Z({T_{ijr}}) + \sum_{ij} \phi_{ij}[T_{ij} - \sum_r T_{ijr}]$

Turunan pertama dari Lagrangian terhadap aliran rute lalu disamakan dengan nol untuk mencari nilai optimum: $\frac{\partial L}{\partial T_{ijr}} = c_{ijr} - \phi_{ij} = 0$

Penyelesaian ini secara elegan membuktikan kesesuaian rumusan dengan Prinsip Wardrop. Pengali Lagrange $\phi^*_{ij}$ terbukti sama dengan biaya minimum perjalanan dari titik asal $i$ ke tujuan $j$ ($c^*_{ij}$). Pada kondisi ekuilibrium:

- Jika sebuah rute digunakan ($T^*_{ijr} > 0$), maka biaya pada rute tersebut sama dengan biaya minimum ($c_{ijr} = c^*_{ij}$).
- Jika sebuah rute tidak digunakan ($T^*_{ijr} = 0$), maka biaya pada rute tersebut lebih besar atau sama dengan biaya minimum ($c_{ijr} \ge c^*_{ij}$).

Dalam konteks yang lebih luas di buku ini, perumusan Pemrograman Matematis sangat esensial karena menggantikan metode pembebanan heuristik klasik yang tidak mampu mencapai konvergensi solusi secara stabil dan dapat diandalkan. Formulasi ini memungkinkan digunakannya algoritma resolusi standar dalam riset operasi, seperti algoritma _Frank-Wolfe_, untuk menyelesaikan pembebanan ekuilibrium.

Selain itu, kerangka matematis ini juga sangat fleksibel dan dapat diadaptasi untuk menghitung Ekuilibrium Sosial (Prinsip Kedua Wardrop) oleh para perencana sistem. Hal ini dilakukan dengan mengganti fungsi objektif ekuilibrium pengguna menjadi fungsi yang meminimalkan biaya perjalanan rata-rata atau total menggunakan biaya marginal, dengan rumus: Minimalkan $S{T_{ijr}} = \sum_a \int_0^{V_a} Cma(v) dv$.

## Transport System Equilibrium

Dalam konteks Bab 11 mengenai Pembebanan Dinamis dan Ekuilibrium (_Equilibrium and Dynamic Assignment_), Ekuilibrium Sistem Transportasi (_Transport System Equilibrium_) memperluas konsep ekuilibrium dari sekadar pemilihan rute di satu jaringan menjadi ekuilibrium yang mencakup interaksi antarmoda dan permintaan yang elastis secara keseluruhan. Sumber-sumber yang ada membahas topik ini ke dalam beberapa aspek utama:

**1. Ekuilibrium dan Umpan Balik (_Equilibrium and Feedback_)** Terdapat interaksi yang kuat antara berbagai moda transportasi, seperti kemacetan mobil yang memengaruhi waktu tempuh bus, operasi bus yang memengaruhi kapasitas jalan bagi mobil, serta interaksi pada fasilitas _park-and-ride_. Pendekatan iteratif yang disebut "umpan balik naif" (_naive feedback_)—yakni menjalankan semua model, mendapatkan waktu tempuh baru, memasukkannya kembali ke model sebelumnya, dan mengulanginya—terbukti tidak natural dan sering kali menghasilkan osilasi yang gagal mencapai konvergensi yang stabil.

**2. Formulasi Sistem Model Gabungan (_Formulation of the Combined Model System_)** Untuk menghindari masalah pada umpan balik naif, sistem dirumuskan sebagai program matematis gabungan yang menyatukan berbagai sub-model seperti distribusi, pemilihan moda, dan pembebanan. Model ini meminimalkan sebuah fungsi objektif yang menggabungkan biaya tautan dengan fungsi permintaan invers, yang rumusan dasarnya adalah: Minimalkan $Z = \sum_a \int_0^{V_a} c_a(v) dv - \sum_{ij} \int_0^{T_{ij}} g_{ij}(t) dt$ Pilihan moda dan tujuan dimasukkan melalui batasan dispersi (entropi) ke dalam fungsi objektif. Untuk menyelesaikannya, algoritma seperti metode Evans (1976) tidak sekadar mengembalikan biaya ke model sebelumnya, melainkan melakukan rata-rata terhadap matriks perjalanan dan arus tautan. Formulasi ini kemudian diperluas oleh De Cea et al. (2008) yang mengembangkan model gabungan umum dengan pilihan permintaan hierarkis menggunakan pendekatan maksimisasi entropi multi-objektif.

**3. Penyelesaian Model Gabungan (_Solving General Combined Models_)** Dalam menyelesaikan model gabungan, alih-alih menggunakan perhitungan langkah optimal yang rumit, perencana sering menggunakan bobot langkah yang telah ditentukan sebelumnya. Metode yang umum adalah _Method of Successive Averages_ (MSA) yang menggunakan urutan bobot $1, 1/2, 1/3, \dots, 1/n$, dan pendekatan _Constant Weight_ (CW) yang menggunakan fraksi bobot konstan. Dalam praktiknya pada jaringan nyata, metode CW (dengan nilai bobot di kisaran 0,2 hingga 0,5, misalnya 0,25) terbukti berkonvergensi lebih cepat dan lebih konsisten dibandingkan MSA. Pencapaian ekuilibrium sistem ini ditekankan bukan sebagai tujuan akhir, melainkan sebagai prasyarat wajib agar para pengambil keputusan dapat membandingkan berbagai strategi atau proyek secara konsisten ("membandingkan hal yang sepadan").

**4. Pemantauan Konvergensi (_Monitoring Convergence_)** Untuk memastikan solusi ekuilibrium valid, diperlukan kriteria konvergensi untuk matriks perjalanan maupun arus tautan. Indikator yang umum digunakan mencakup _Relative Gap_ (RG) yang membandingkan nilai fungsi objektif terendah dengan batas bawah terbaik yang ditemukan. Selain itu, _Total Misplaced Flow_ (TMF) digunakan untuk mengevaluasi volume perjalanan antar iterasi, sementara _Average Excess Cost_ (AEC) diterapkan untuk mengukur selisih antara biaya rute saat ini dengan biaya minimum untuk setiap pasangan asal-tujuan.

## Traffic Dynamics and DTA

	Dalam konteks Bab 11 mengenai _Equilibrium and Dynamic Assignment_, pembahasan tentang Dinamika Lalu Lintas (_Traffic Dynamics_) dan Pembebanan Lalu Lintas Dinamis (_Dynamic Traffic Assignment_ / DTA) menyoroti kelemahan dari metode pembebanan klasik yang mengasumsikan kondisi tunak (_steady-state_). Metode klasik dibangun atas dasar tiga asumsi utama: pelancong memiliki informasi yang sempurna tentang biaya, penundaan di suatu tautan hanya bergantung pada arus lalu lintas di tautan itu sendiri (_separability_), dan permintaan serta arus tidak berubah sepanjang periode pemodelan.

Buku ini menegaskan bahwa di jaringan dunia nyata yang macet, asumsi-asumsi tersebut sangat tidak realistis karena:

**1. Sifat Dinamis Lalu Lintas dan Antrean** Lalu lintas nyata pada dasarnya bersifat dinamis di mana permintaan bervariasi, dan puncak arus kendaraan merambat dari waktu ke waktu. Kurva kecepatan-arus klasik (seperti kurva _Bureau of Public Roads_ / BPR) gagal menangkap fenomena ini karena mereka membiarkan arus melebihi kapasitas dan berasumsi bahwa seluruh kendaraan mencapai tujuannya dalam satu periode pemodelan. Pada kenyataannya, ketika permintaan melebihi kapasitas, antrean dinamis akan terbentuk di titik kemacetan (_bottleneck_), memakan ruang, memblokir persimpangan sebelumnya, dan tumpahan antrean ini akan terus membesar sampai permintaan kembali turun di bawah batas kapasitas.

**2. Keandalan Waktu Perjalanan** Variabilitas dan ketidakandalan waktu perjalanan menjadi masalah krusial akibat dinamika kemacetan. Mengestimasi keandalan dapat dilakukan dengan memodelkan deviasi standar dari waktu perjalanan $\sigma_t$. Sumber menyajikan sebuah model empiris sederhana namun realistis (dari studi di London) untuk menghitung variabilitas ini: $\sigma_t = 0.9 FFTT^{0.87}(CI - 1)$ di mana $FFTT$ adalah waktu perjalanan pada arus bebas (_Free Flow Travel Time_) dan $CI$ adalah Indeks Kemacetan (_Congestion Index_ = rasio waktu perjalanan aktual dengan $FFTT$).

**3. Pendekatan Pembebanan Lalu Lintas Dinamis (DTA)** Untuk mengatasi dinamika ini, kerangka DTA dikembangkan dengan mensyaratkan beberapa kondisi wajib pada model: positivitas (arus non-negatif), konservasi arus, aturan FIFO (_First In, First Out_), waktu perjalanan minimum, waktu pembersihan jaringan yang terbatas (tidak ada antrean tersisa selamanya), kapasitas yang absolut, serta kausalitas.

Dalam DTA, Prinsip Ekuilibrium Wardrop diperluas untuk memperhitungkan waktu. Ekuilibrium Pengguna Dinamis (_Dynamic User Equilibrium_ / DUE) tercapai ketika pada _setiap saat_, biaya yang ditanggung pengemudi pada rute yang digunakannya adalah sama dan tidak lebih besar daripada biaya pada rute mana pun yang tidak digunakan. Jika pengguna juga memilih waktu keberangkatannya, total biaya rute pada saat digunakan juga tidak boleh lebih besar dari rute di waktu lain yang tidak dipilih.

**4. Resolusi melalui Meso dan Mikro-Simulasi** Mencari solusi DUE sangat rumit karena pilihan rute optimal bergantung pada tingkat kemacetan di sepanjang perjalanan, yang juga terus berubah akibat pilihan rute dan waktu berangkat dari pengemudi lain. Oleh karenanya, pendekatan simulasi menjadi esensial:

- **Meso-simulasi:** Model seperti CONTRAM menyimulasikan pergerakan paket kendaraan secara berurutan. Sementara itu, model SATURN membagi periode puncak ke dalam interval waktu diskret yang singkat (misalnya 10-15 menit) yang diselesaikan sebagai rangkaian masalah kondisi tunak menggunakan profil arus siklik dan penyebaran peleton kendaraan.
- **Mikro-simulasi:** Perangkat lunak seperti AIMSUN, VISSIM, dan PARAMICS melacak setiap kendaraan secara individual berdasarkan fisika lalu lintas mikro seperti perilaku mengikuti mobil (_car following_), pemilihan lajur, dan penerimaan celah (_gap acceptance_).

Meskipun perangkat mikro-simulasi memiliki kemampuan visualisasi yang luar biasa untuk membujuk pengambil keputusan, bab ini memperingatkan adanya **konflik antara ekuilibrium dan simulasi detail**. Dalam jaringan kota yang padat, penundaan (_delay_) di satu persimpangan bergantung kuat pada arus silang dari jalan lain (_non-separable_). Sifat yang tidak terpisahkan (_non-separable_) ini melanggar syarat matematika konvensional untuk mencapai solusi ekuilibrium yang unik dan stabil. Konsekuensinya, DTA dengan simulasi tingkat tinggi merepresentasikan kondisi jalanan jauh lebih realistis tetapi mengorbankan kepastian konvergensi absolut dalam kerangka sistem ekuilibrium transportasi secara keseluruhan.

## Departure Time Choice

Dalam konteks Bab 11 mengenai Pembebanan Dinamis dan Ekuilibrium (_Equilibrium and Dynamic Assignment_), pembahasan mengenai Pilihan Waktu Keberangkatan (_Departure Time Choice_) difokuskan sebagai respons atas fenomena penyebaran waktu puncak (_peak spreading_). Seiring meningkatnya kemacetan, pelancong sering kali mengubah waktu keberangkatan mereka untuk menghindari penundaan terburuk, yang pada gilirannya memperpanjang durasi periode jam sibuk.

Sumber membedakan pilihan waktu perjalanan ke dalam dua tingkatan utama: **1. Pilihan Waktu Makro** Ini melibatkan pergeseran antar periode waktu yang luas, misalnya memilih untuk berbelanja di luar jam sibuk alih-alih pada pukul 17:00. Hal ini dapat dimodelkan menggunakan model pilihan logit antara periode waktu yang berbeda. Pemodelan ini membutuhkan sensitivitas yang berbeda untuk setiap tujuan perjalanan, karena perjalanan wajib (seperti ke tempat kerja atau sekolah) memiliki fleksibilitas penjadwalan yang jauh lebih rendah dibandingkan perjalanan diskresioner seperti berbelanja.

**2. Pilihan Waktu Mikro** Ini berkaitan langsung dengan fenomena penyebaran puncak, di mana pelancong bergeser sedikit lebih awal atau lebih lambat dari waktu yang mereka inginkan. Konsep dasarnya adalah bahwa pelancong memiliki Waktu Kedatangan yang Diinginkan (_Preferred Arrival Time_ / PAT), dan setiap pergeseran dari waktu tersebut akan menimbulkan disutilitas jadwal (_schedule disutility_).

Fungsi utilitas untuk pilihan mikro yang paling umum merujuk pada karya Small (1982), yang dirumuskan sebagai berikut:

$U(\tau) = -\alpha \cdot C(\tau) - \beta \cdot SDE(\tau) - \gamma \cdot SDL(\tau) - \delta \cdot dL(\tau)$

Di mana:

- $\tau$ adalah waktu kedatangan aktual.
- $C(\tau)$ adalah durasi perjalanan sebagai fungsi dari waktu kedatangan.
- $SDE$ adalah penundaan jadwal awal (_early schedule delay_), dirumuskan sebagai: $SDE = \max(PAT - \tau, 0)$.
- $SDL$ adalah penundaan jadwal terlambat (_late schedule delay_), dirumuskan sebagai: $SDL = \max(\tau - PAT, 0)$.
- $dL(\tau)$ adalah variabel _dummy_ keterlambatan yang bernilai 1 jika $\tau > PAT$ dan 0 jika sebaliknya.
- $\alpha, \beta, \gamma,$ dan $\delta$ adalah parameter positif yang secara berurutan mengukur disutilitas terhadap durasi perjalanan, kedatangan lebih awal, dan kedatangan terlambat.

Fungsi disutilitas jadwal ini biasanya bersifat asimetris. Dalam praktiknya, tiba 5 menit terlambat umumnya dirasakan jauh lebih buruk daripada tiba 5 menit terlalu awal. Fungsi utilitas ini kemudian digabungkan dengan model kemacetan pasokan (misalnya masalah titik kemacetan tunggal dari Vickrey) untuk menemukan ekuilibrium di mana tidak ada komuter yang dapat meningkatkan utilitas agregatnya dengan mengubah waktu keberangkatan.

**Keterpaduan dengan Pembebanan Ekuilibrium** Untuk mengimplementasikan prinsip ini ke dalam model ekuilibrium, pendekatan yang sering digunakan adalah membagi waktu menjadi irisan-irisan diskret (misalnya irisan 15 menit) dan menggunakan formulasi logit sehingga pilihan waktu perjalanan menjadi terdiskritisasi ("berangkat sekarang", "nanti", atau "lebih awal"). Namun, integrasi sederhana ini mendapat banyak kritik dan memiliki beberapa keterbatasan mendasar:

- **Mengabaikan interaksi antar periode waktu**: Perjalanan yang digeser dari jam sibuk ke periode lain akan meningkatkan waktu perjalanan di periode tersebut, sehingga memerlukan perhitungan ulang biaya perjalanan secara dinamis.
- **Pendekatan diskritisasi yang kasar**: Waktu keberangkatan idealnya merupakan variabel kontinu. Membaginya ke dalam irisan waktu tetap menjadi sebuah penyederhanaan yang kasar.
- **Pelanggaran asumsi logit (korelasi)**: Formulasi logit linier memiliki kelemahan kritis karena mengasumsikan independensi antar alternatif. Padahal dalam pilihan waktu, alternatif irisan waktu yang saling berdekatan sangat mungkin saling berkorelasi erat akibat faktor-faktor yang tidak teramati (_unobserved attributes_), sehingga tidak realistis untuk dianggap independen.

Untuk mengatasi beberapa kendala ini, terutama terkait interaksi antar periode waktu, dikembangkan perangkat lunak seperti HADES (_Heterogeneous Arrival and Departure times based on Equilibrium Scheduling theory_) yang menghubungkan model permintaan waktu keberangkatan dengan model pasokan pembebanan eksternal, melakukan iterasi bolak-balik (umpan balik) hingga tercapai solusi ekuilibrium yang lebih realistis. Mengakomodasi pilihan ini secara lebih kaya pada akhirnya disarankan untuk diintegrasikan ke dalam konteks pola aktivitas harian dalam model berbasis aktivitas (_activity-based models_).