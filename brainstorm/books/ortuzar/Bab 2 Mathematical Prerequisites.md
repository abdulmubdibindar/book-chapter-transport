Dalam konteks yang lebih luas dari buku _Modelling Transport 4th Edition_, Bab "2 Mathematical Prerequisites" (Prasyarat Matematika) disajikan untuk memberikan dasar yang kuat bagi para praktisi dan mahasiswa yang perlu menyegarkan keterampilan analitis dan statistik mereka. Penulis menekankan bahwa praktik pemodelan transportasi modern terus bergerak menjauhi pendekatan asal tebak (_fudge factors_) menuju model dengan landasan teoretis yang kuat. Landasan matematika yang ketat sangat diperlukan untuk memberikan saran yang konsisten kepada para pengambil keputusan, memastikan hasil tidak bergantung pada iterasi yang sewenang-wenang, serta menghindari hasil patologis saat memprediksi opsi-opsi baru di masa depan. Oleh karena itu, bab ini membuat buku ini cukup mandiri (_self-contained_) untuk memahami konsep-konsep lanjutan.

Sesuai dengan permintaan Anda, berikut adalah penjabaran konsep dan penulisan ulang semua rumus dari sumber terkait prasyarat matematika ini:

**1. Aljabar dan Fungsi (_Algebra and Functions_)** Bagian ini memperkenalkan pemodelan hubungan antar variabel dan parameter (konstanta). Variabel biasanya dihubungkan melalui persamaan atau pertidaksamaan.

- Persamaan dasar: $y = a + bx$
- Penyelesaian untuk $x$: $x = (y - a)/b$
- Pertidaksamaan contoh: $x + 2y \le 5$

Notasi indeks sangat penting untuk meringkas penjumlahan dan perkalian:

- Penjumlahan: $\sum_{i=1}^n x_i = x_1 + x_2 + x_3 + \dots + x_n$
- Perkalian: $\prod_{j=1}^m y_j = y_1 y_2 y_3 \dots y_m$
- Penjumlahan ganda: $\sum_{i=1}^3 \sum_{j=1}^2 T_{ij} = T_{11} + T_{12} + T_{21} + T_{22} + T_{31} + T_{32}$

Terdapat berbagai macam fungsi, di antaranya fungsi pangkat (_power function_) dan garis lurus:

- Fungsi pangkat: $y = \phi x^n$
- Gradien garis lurus ($y = ax + b$): $a = \frac{y_2 - y_1}{x_2 - x_1}$
- Contoh perpotongan dua garis lurus: $y = x + 2$ dan $y = -x + 4$

Konsep deret (_series_) $S_N = u_1 + u_2 + \dots + u_N = \sum_n u_n$ juga dibahas:

- Deret aritmatika dengan suku awal $b$ dan beda $d$: $u_n = u_{n-1} + d$  
    $S_N = Nb + N(N-1)d/2$
- Deret geometri dengan faktor konstan $r$: $u_n = r u_{n-1}$ $S_N = \frac{b(1 - r^N)}{1 - r}$ untuk $r \ne 1$

**2. Aljabar Matriks (_Matrix Algebra_)** Aljabar matriks sangat penting dalam transportasi karena kita sering berhadapan dengan matriks perjalanan (_trip matrices_).

- Bentuk umum matriks $N \times M$: $B = \begin{pmatrix} B_{11} & B_{12} & \dots & B_{1M} \ B_{21} & B_{22} & \dots & B_{2M} \ \dots & \dots & \dots & \dots \ B_{N1} & B_{N2} & \dots & B_{NM} \end{pmatrix}$
- Vektor kolom ($N \times 1$): $V = {V_i} = \begin{pmatrix} V_1 \ V_2 \ \dots \ V_N \end{pmatrix}$
- Matriks transpos ($M \times N$): $B^T = \begin{pmatrix} B_{11} & B_{21} & \dots & B_{N1} \ B_{12} & B_{22} & \dots & B_{N2} \ \dots & \dots & \dots & \dots \ B_{1M} & B_{2M} & \dots & B_{NM} \end{pmatrix}$
- Vektor baris (transpos dari vektor kolom): $V^T = [V_1 \ V_2 \dots V_N]$
- Matriks identitas ($I$): Diagonal utamanya bernilai 1, sisanya 0.

Operasi dasar matriks meliputi:

- Penjumlahan: $C = A + B = B + A$ di mana $C_{ij} = A_{ij} + B_{ij}$
- Pengurangan: $C = A - B$ di mana $C_{ij} = A_{ij} - B_{ij}$
- Perkalian skalar: $C = kA$ di mana $C_{ij} = kA_{ij}$
- Perkalian matriks: $C = AB$ di mana $C_{ij} = \sum_k A_{ik}B_{kj}$ (tidak komutatif, $AB \ne BA$, kecuali dengan matriks identitas $IA = AI = A$)
- Invers matriks (pembagian): $B^{-1}B = BB^{-1} = I$

**3. Elemen Kalkulus (_Elements of Calculus_)** Kalkulus digunakan untuk menemukan gradien kurva (diferensiasi), menghitung luas di bawah kurva (integrasi), serta mencari nilai optimal (maksimum/minimum) yang berperan penting dalam algoritma pengembangan model transportasi.

- Turunan (gradien): $\delta(x) = \frac{f(x_0 + h) - f(x_0)}{h}$
- Turunan orde dua dari $y = x^b$: $\frac{d^2y}{dx^2} = b(b - 1)x^{b-2}$
- Integral tak tentu: $y = G(x) = \int x b x^{b-1} dx = x^b + C$
- Integral tentu (luas di bawah kurva): $\text{Luas } abcd = [F(x)]_a^b = F(b) - F(a) = \int_a^b y dx = \int_a^b f(x) dx$
- Turunan eksponensial (tetap tidak berubah): $\frac{d}{dx} (e^x) = e^x$

Dalam optimasi, untuk mencari nilai maksimum dan minimum fungsi:

- Syarat stasioner: $f'(x) = 0$
- Kondisi Maksimum: $f''(x) < 0$
- Kondisi Minimum: $f''(x) > 0$
- Titik belok (_point of inflexion_): $f''(x) = 0$

Untuk fungsi dengan banyak variabel ($y = f(x_1, x_2, \dots, x_n)$), titik optimum didapatkan dengan mengatur semua turunan parsial menjadi nol: $\frac{\partial y}{\partial x_i} = 0$. Jika terdapat batasan (_constraints_), metode _Lagrangian multiplier_ digunakan:

- Maksimalisasi: $L = f(x_1, x_2, \dots, x_n) + \sum_k \lambda_k [r_k(x_1, \dots, x_n) - b_k]$
- Penyelesaian: $\frac{\partial L}{\partial x_i} = 0$ dan $\frac{\partial L}{\partial \lambda_k} = 0$
- Matriks Hessian (turunan parsial orde dua) juga digunakan dalam masalah optimasi: $h_{ij} = \frac{\partial^2 y}{\partial x_i \partial x_j}$

Kalkulus juga mencakup konsep integrasi lipat ganda (pengukuran volume) dan elastisitas untuk ekonometrika:

- Integrasi lipat ganda: $V = \int \int \dots \int f(x_1, x_2, \dots, x_n) dx_1 dx_2 \dots dx_n$
- Elastisitas (persentase perubahan variabel dependen terhadap independen): $E(y, x_i) = \frac{\partial y}{\partial x_i} \frac{x_i}{y}$
- Ekspansi deret Taylor: $f(x) = f(0) + h f'(0) + (h^2/2!)f''(0) + (h^3/3!)f'''(0) + \dots$

**4. Statistik Matematika Dasar (_Elementary Mathematical Statistics_)** Statistik memegang peranan kunci dalam teknik pemodelan transportasi kontemporer, seperti dalam pemodelan pilihan diskret (_discrete choice models_).

- Probabilitas (limit frekuensi relatif): $P(e_i) = p_i = \lim_{n \to \infty} \frac{n_i}{n}$
- Aturan gabungan dan irisan: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$ Untuk kejadian saling lepas: $P(A \cup B) = P(A) + P(B)$
- Peluang bersyarat: $P(A/B) = P(A \cap B) / P(B)$
- Kejadian independen: $P(E \cap F) = P(E)P(F)$
- Untuk variabel acak kontinu, fungsi kepadatan probabilitas $f(x)$ berlaku: $\int x f(x)dx = 1$ dan $f(x) \ge 0, \forall x$.

Ukuran statistik deskriptif juga dijabarkan secara rinci:

- Nilai Harapan (_Expected Value_): Kasus diskret: $E(X) = \sum_i x_i p_i(x_i)$ Kasus kontinu: $E(X) = \int x f(x) dx$ Fungsi linear: $E(a + bX + cY) = a + bE(X) + cE(Y)$
- Varians: $Var(X) = E{[X - \mu]^2} = E(x^2) - E^2(x)$
- Kovarians: $Cov(X, Y) = E((X - \mu_x) \cdot (Y - \mu_y)) = E(XY) - E(X)E(Y)$
- Sebaran sampel (_sample dispersion_): $s^2 = \frac{\sum_i (x_i - \bar{X})^2}{n - 1}$

Terakhir, sumber ini membahas distribusi yang menjadi tulang punggung model logit dan probit:

- **Distribusi Normal/Gauss** (basis bagi model Probit): Standar $N(0,1)$: $f(Z) = \frac{1}{\sqrt{2\pi}} \exp(-\frac{1}{2}Z^2)$ Secara umum $N(\mu, \sigma^2)$: $f(Z) = \frac{1}{\sqrt{2\pi\sigma}} \exp\left(-\frac{1}{2}\left(\frac{x - \mu}{\sigma}\right)^2\right)$ Teorema Limit Sentral: $\frac{x - \mu}{\sigma/\sqrt{n}} \sim N(0, 1)$ jika $n \ge 30$
- **Distribusi Extreme Value Type I (EV1/Gumbel)** (basis bagi keluarga model Logit yang sangat penting dalam transportasi): Fungsi distribusi kumulatif: $F(\epsilon) = \exp[-\exp(-\lambda(\epsilon - \eta))]$ Fungsi kepadatan probabilitas: $f(\epsilon) = \lambda \exp[-\lambda(\epsilon - \eta)] \exp[-\exp(-\lambda(\epsilon - \eta))]$

Secara keseluruhan, Bab 2 ini berperan krusial dalam konteks buku karena menstandarkan notasi dan melengkapi para pembaca (yang memiliki latar belakang berbeda-beda) dengan instrumen matematika dan statistik. Pemahaman tentang maksimasi utilitas acak (menggunakan fungsi probabilitas), optimasi jaringan dan pembagian matriks menggunakan kalkulus atau Lagrangian, menuntut penguasaan teori yang matang agar praktik perencanaan dan pemodelan transportasi mampu mengatasi kompleksitas perilaku sistem secara nyata dan koheren.

## Algebra and Functions

Dalam konteks bab "2 Mathematical Prerequisites", bagian "Aljabar dan Fungsi" (Algebra and Functions) disajikan untuk membekali para mahasiswa dan praktisi perencanaan transportasi dengan dasar-dasar matematika yang esensial. Pemahaman aljabar dasar ini sangat krusial karena praktik pemodelan transportasi modern semakin bergantung pada landasan teoretis yang kuat dan telah menghindari metode asal tebak atau _fudge factors_. Bagian ini dirancang agar mudah dipahami karena pada praktiknya sebagian besar materi pemodelan transportasi hanya membutuhkan pengetahuan aljabar tingkat sekolah menengah dan sedikit kalkulus dasar.

Berikut adalah penjabaran konsep dan penulisan ulang semua rumus dari sumber tersebut:

**1. Aljabar Dasar (Persamaan dan Pertidaksamaan)** Aljabar dasar membedakan antara variabel (besaran yang diukur, seperti $x, y, z$) dengan konstanta atau parameter (nilainya ditetapkan, sering dilambangkan dengan $a, b, c$ atau abjad Yunani).

- Persamaan dasar untuk menyatakan hubungan variabel adalah: $y = a + bx$.
- Persamaan tersebut dapat diselesaikan untuk mencari $x$: $x = (y - a)/b$.
- Pertidaksamaan juga digunakan untuk memberi batasan rentang pada nilai variabel dengan tanda $<$, $\le$, $>$, atau $\ge$. Contoh pertidaksamaan: $x + 2y \le 5$,.
- Pertidaksamaan ini dapat dimanipulasi layaknya persamaan biasa. Jika dikurangi 5 di kedua sisi, pertidaksamaan di atas menjadi: $x + 2y - 5 \le 0$. Namun, jika pertidaksamaan tersebut dikalikan dengan bilangan negatif (misalnya -2), tandanya akan berbalik: $-2x - 4y \ge -10$.

**2. Notasi Indeks, Penjumlahan, dan Perkalian** Ketika berhadapan dengan banyak variabel, seperti pemodelan matriks perjalanan transportasi, penggunaan indeks sangat memudahkan perumusan.

- Penjumlahan dari serangkaian $n$ variabel diringkas menjadi: $\sum_{i=1}^n x_i = x_1 + x_2 + x_3 + \dots + x_n$.
- Perkalian berurutan diringkas menjadi: $\prod_{j=1}^m y_j = y_1 y_2 y_3 \dots y_m$.
- Penjumlahan ganda (yang biasa digunakan pada matriks $T$) dirumuskan dengan: $\sum_{i=1}^3 \sum_{j=1}^2 T_{ij} = \sum_{i=1}^3 (T_{i1} + T_{i2}) = T_{11} + T_{12} + T_{21} + T_{22} + T_{31} + T_{32}$,.

**3. Fungsi dan Grafik** Variabel dapat dihubungkan dalam fungsi yang dapat dipetakan secara visual pada sistem koordinat Kartesius.

- Fungsi pangkat (_power function_) dirumuskan sebagai: $y = \phi x^n$.
- Fungsi umum yang mencakup banyak variabel bebas dapat dituliskan sebagai: $y = f(x_1, x_2, \dots, x_n)$.
- Setiap persamaan, seperti $ax = b$, dapat diubah wujudnya ke dalam bentuk $f(x) = 0$ (dalam hal ini menjadi $ax - b = 0$); pencarian penyelesaian dari persamaan ini ekuivalen dengan mencari titik potong kurva dengan sumbu $x$, yang disebut solusi real atau nilai nol fungsi.
- Analisis fungsi juga melihat perilakunya ketika nilai $x \to \infty$, di mana hasil fungsi bisa menuju tak terhingga (misal $f(x) = x^2$), minus tak terhingga, berosilasi, atau konvergen mendekati suatu limit bernilai terbatas (misal $f(x) = 1 + 1/x$),. Jika fungsi tersebut bernilai tak terhingga pada titik $x = \alpha$, maka kurva $y = f(x)$ disebut memiliki asimtot $x = \alpha$.
- Untuk fungsi berupa garis lurus ($y = ax + b$), variabel $b$ merupakan titik potong sumbu $y$ (intersep) saat $x = 0$, sedangkan $a$ adalah gradien yang dapat dicari jika ada dua titik $(x_1, y_1)$ dan $(x_2, y_2)$: $a = \frac{y_2 - y_1}{x_2 - x_1}$.
- Perpotongan dari dua fungsi garis lurus dapat dicari. Misalnya untuk sistem persamaan linier $y = x + 2$ dan $y = -x + 4$, penyelesaian perpotongannya adalah pada titik $x = 1, y = 3$.

**4. Jumlah Deret (_Sums of Series_)** Sebuah deret adalah urutan bilangan $u_n$ (untuk $n = 1, 2, \dots, N$) yang perumusan jumlahnya adalah: $S_N = u_1 + u_2 + \dots + u_N = \sum_n u_n$.

- **Deret Aritmatika**: Memiliki beda antar suku ($d$) yang tetap dengan pola $u_n = u_{n-1} + d$. Jika $b$ adalah suku pertama, maka jumlah total sampai suku ke-$N$ adalah: $S_N = Nb + N(N-1)d/2$.
- **Deret Geometri**: Memiliki rasio antar suku ($r$) yang dikalikan konstan, dengan pola $u_n = r u_{n-1}$. Jumlah deret geometri dengan suku awal $b$, asalkan $r \ne 1$, adalah: $S_N = \frac{b(1 - r^N)}{1 - r}$.
- Bentuk deret khusus lainnya meliputi suku $u_n = n$ di mana jumlahnya adalah $S_N = N(N+1)/2$, serta deret $u_n = x^n$ di mana jumlahnya adalah $S_N = x(1-x^N)/(1-x)$ untuk $x \ne 1$. Deret-deret ini dapat bersifat divergen (meningkat tanpa batas) saat $N \to \infty$, namun deret seperti $x^n$ akan konvergen menjadi $S_N = x/(1-x)$ jika nilai $x$ berada di rentang $0 < x < 1$.

## Matrix Algebra

Dalam konteks bab "2 Mathematical Prerequisites" pada pemodelan transportasi, Aljabar Matriks (Matrix Algebra) memegang peranan yang sangat penting karena bidang transportasi sering kali berhadapan dengan matriks perjalanan (_trip matrices_) serta matriks-matriks lainnya. Konsep matriks dan vektor digunakan sebagai notasi singkat untuk menyusun serangkaian persamaan simultan dan untuk mendapatkan penyelesaiannya menggunakan operasi matriks invers.

Sesuai dengan permintaan Anda, berikut adalah penjabaran konsep aljabar matriks beserta seluruh rumus yang ada di dalam sumber terkait:

**1. Definisi dan Konsep Dasar** Setiap variabel yang memiliki dua subskrip dapat disebut sebagai matriks. Matriks umumnya dinotasikan dengan $B = {B_{ij}}$, di mana elemen-elemennya adalah variabel $B_{ij}$ dengan batasan $i = 1, 2, \dots, N$ dan $j = 1, 2, \dots, M$. Secara tertulis, bentuk umum matriks $N \times M$ (memiliki $N$ baris dan $M$ kolom) ditunjukkan oleh rumus (2.17): $B = \begin{pmatrix} B_{11} & B_{12} & B_{13} & \dots & B_{1M} \ B_{21} & B_{22} & B_{23} & \dots & B_{2M} \ \dots & \dots & \dots & \dots & \dots \ B_{N1} & B_{N2} & B_{N3} & \dots & B_{NM} \end{pmatrix}$.

Bentuk khusus dari matriks adalah vektor, yang merupakan susunan array satu dimensi atau matriks $N \times 1$ (disebut sebagai vektor kolom) karena indeks keduanya menjadi redundan. Vektor ini ditunjukkan oleh rumus (2.18): $V = {V_i} = \begin{pmatrix} V_1 \\ V_2 \\ V_3 \\ \dots \\ V_N \end{pmatrix}$. Sementara itu, variabel tanpa indeks atau bahkan sebuah konstanta dapat dianggap sebagai matriks berukuran $1 \times 1$ yang dikenal sebagai skalar.

Jika baris dan kolom pada suatu matriks ditukar posisinya, akan diperoleh matriks transpos berukuran $M \times N$ yang dilambangkan dengan $B^T$, seperti pada rumus (2.19): 

$$
B^T = \begin{pmatrix} B_{11} & B_{21} & B_{31} & \dots & B_{N1} \\ B_{12} & B_{22} & B_{32} & \dots & B_{N2} \\ \dots & \dots & \dots & \dots & \dots \\ B_{1M} & B_{2M} & B_{3M} & \dots & B_{NM} \end{pmatrix}
$$

Transpos dari sebuah vektor kolom $N \times 1$ akan menghasilkan vektor baris, yang dituliskan pada rumus (2.20): $V^T = [V_1 \ V_2 \ V_3 \dots V_N]$.

Beberapa sifat matriks khusus lainnya meliputi:

- **Matriks persegi ($S$):** Matriks di mana jumlah baris dan kolomnya sama ($N = M$).
- **Matriks simetris:** Matriks persegi yang bernilai sama dengan transposnya ($S = S^T$).
- **Matriks diagonal ($D = {D_{ij}}$):** Matriks di mana semua elemen bernilai $D_{ij} = 0$ kecuali jika $i = j$.
- **Matriks satuan atau matriks identitas ($I$):** Matriks diagonal persegi dengan setiap elemen pada diagonal utamanya bernilai 1 dan elemen lainnya 0, seperti pada rumus (2.21): 
$$I = \begin{pmatrix} 1 & 0 & 0 & \dots & 0 \\ 0 & 1 & 0 & \dots & 0 \\ 0 & 0 & 1 & \dots & 0 \\ \dots & \dots & \dots & \dots & \dots \\ 0 & 0 & 0 & \dots & 1 \end{pmatrix}$$

**2. Operasi Dasar Aljabar Matriks** Operasi dasar yang menggabungkan dua matriks, misalnya matriks $A$ dan matriks $B$ untuk membentuk matriks baru $C$, terdiri dari:

- **Penjumlahan matriks:** Ditunjukkan oleh rumus (2.22) yaitu $C = A + B = B + A$, yang didefinisikan sebagai $C_{ij} = A_{ij} + B_{ij}$. Operasi ini mensyaratkan kedua matriks memiliki ukuran yang sama.
- **Pengurangan matriks:** Ditunjukkan oleh rumus (2.23) yaitu $C = A - B$, yang didefinisikan sebagai $C_{ij} = A_{ij} - B_{ij}$, dan juga mensyaratkan kedua matriks berukuran sama.
- **Perkalian dengan skalar:** Ditunjukkan oleh rumus (2.24) yaitu $C = kA$, yang didefinisikan sebagai $C_{ij} = kA_{ij}$. Matriks baru yang dihasilkan akan memiliki ukuran yang sama dengan matriks asalnya.
- **Perkalian matriks:** Ditunjukkan oleh rumus (2.25) yaitu $C = AB$, yang didefinisikan sebagai $C_{ij} = \sum_k A_{ik} B_{kj}$. Dalam operasi ini, matriks $A$ harus berukuran $N \times M$ dan matriks $B$ berukuran $M \times L$, yang akan menghasilkan matriks $C$ berukuran $N \times L$. Perkalian matriks pada umumnya tidak komutatif ($AB \ne BA$), sehingga urutan pra-perkalian (pre-multiplication) dan pasca-perkalian (post-multiplication) sangat penting. Sifat komutatif hanya berlaku saat dikalikan dengan matriks identitas, seperti pada rumus (2.26): $IA = AI = A$.
- **Pembagian (Invers Matriks):** Pembagian direpresentasikan menggunakan konsep matriks invers ($B^{-1}$), yang memenuhi rumus (2.27) yaitu $B^{-1}B = BB^{-1} = I$. Invers hanya berlaku bagi matriks persegi, namun tidak semua matriks persegi memilikinya. Jika matriks tersebut memiliki invers, matriks itu disebut sebagai matriks non-singular. Proses pembagian dilakukan melalui pra-perkalian atau pasca-perkalian dengan $B^{-1}$.
- **Matriks Definit Positif (_Positive Definite Matrix_):** Suatu matriks simetris real $M$ disebut definit positif jika operasi $w^T M w > 0$ berlaku untuk semua vektor $w$ (yang bukan nol) dengan entri bilangan real.

## Elements of Calculus

Dalam konteks bab "2 Mathematical Prerequisites", pemahaman mengenai elemen-elemen kalkulus disajikan sebagai fondasi analitis yang sangat esensial untuk pemodelan transportasi tingkat lanjut. Sementara aljabar berfungsi untuk menyusun persamaan, kalkulus memberi kemampuan bagi para perencana transportasi untuk memahami tingkat perubahan antar variabel (melalui diferensiasi), mengakumulasi besaran seperti probabilitas atau area (melalui integrasi), menilai sensitivitas permintaan (elastisitas), serta—yang paling krusial—mencari solusi optimal atau keseimbangan (optimasi) dalam jaringan dan utilitas perilaku pengguna.

Sumber-sumber ini merinci konsep-konsep kalkulus berikut beserta rumusnya:

**1. Diferensiasi (Turunan)** Diferensiasi digunakan untuk menghitung gradien (kemiringan) dari suatu kurva pada titik tertentu. Pemahaman mengenai tingkat perubahan sangat penting dalam melihat respons suatu variabel terhadap variabel lain.

- Gradien awal dari tali busur (pendekatan limit) dirumuskan sebagai: $\delta(x) = \frac{f(x_0 + h) - f(x_0)}{h}$.
- Jika limit tersebut ada ketika $h \to 0$, maka ia disebut turunan pertama $f'(x_0)$ atau $dy/dx|_{x_0}$.
- Beberapa aturan turunan fungsi $f(x)$ umum meliputi: turunan dari konstanta $k$ adalah $0$; turunan $x^b$ adalah $bx^{b-1}$; turunan $ku(x)$ adalah $ku'(x)$; turunan $u(x) + v(x)$ adalah $u'(x) + v'(x)$; aturan perkalian $u(x)v(x)$ adalah $u'(x)v(x) + u(x)v'(x)$; dan aturan rantai $u[v(x)]$ adalah $u'[v(x)]v'(x)$.
- Turunan juga dapat dilanjutkan ke orde yang lebih tinggi, seperti turunan kedua dari $y = x^b$: $\frac{d^2y}{dx^2} = b(b - 1)x^{b-2}$.

**2. Integrasi** Integrasi adalah kebalikan dari diferensiasi; jika gradien kurva diketahui, persamaannya dapat direkonstruksi melalui integrasi untuk menghitung luasan di bawah kurva.

- Integral tak tentu dari $b x^{b-1}$ dirumuskan dengan konstanta integrasi sembarang $C$: $y = G(x) = \int b x^{b-1} dx = x^b + C$.
- Integral tentu untuk menghitung luas di antara rentang $a$ dan $b$ dirumuskan sebagai: $\text{Luas } abcd = [F(x)]_a^b = F(b) - F(a) = \int_a^b y dx = \int_a^b f(x) dx$.
- Terdapat pula penjabaran untuk manipulasi integral berdasarkan aturan perkalian: $\int u[v(x)]v'(x) dx = U[v(x)] + C_3$ dan $\int U(x)v'(x) dx = U(x)V(x) - \int u(x)V'(x) dx$.

**3. Fungsi Logaritmik dan Eksponensial** Fungsi invers $f(x) = 1/x$ tidak memiliki integral sederhana (seperti $x^b$) melainkan didefinisikan sebagai logaritma natural (basis $e \approx 2.7183$). Fungsi ini dan inversnya (eksponensial) banyak digunakan dalam fungsi utilitas dan model logit di transportasi.

- Turunan logaritma natural: $\frac{d}{dx} \log(x) = \frac{1}{x}$.
- Fungsi eksponensial tetap tidak berubah saat didiferensiasi: $\frac{d}{dx} (e^x) = e^x$.

**4. Mencari Nilai Maksimum dan Minimum** Optimasi adalah salah satu aplikasi terpenting kalkulus dalam transportasi (contohnya, meminimalkan biaya perjalanan atau memaksimalkan utilitas makroskopik).

- Kondisi awal (stasioner) dicapai saat turunan pertama bernilai nol: $f'(x) = 0$.
- Pengecekan turunan orde dua menentukan sifat stasioner tersebut: Maksimum jika $f''(x) < 0$. Minimum jika $f''(x) > 0$. Titik belok (_point of inflexion_) jika $f''(x) = 0$.

**5. Fungsi Lebih dari Satu Variabel dan Matriks Hessian** Karena model transportasi sering melibatkan banyak variabel, diferensiasi parsial (turunan terhadap satu variabel sambil menganggap variabel lain konstan) sangat penting.

- Nilai stasioner fungsi multi-variabel dihitung dengan menetapkan semua turunan parsial menjadi nol: $\frac{\partial y}{\partial x_i} = 0$ untuk $i = 1, 2, \dots, n$.
- Untuk masalah optimasi bersyarat (_restricted maximum/minimum_), metode _Lagrangian multiplier_ digunakan. Fungsi Lagrange ($L$) dirumuskan sebagai: $L = f(x_1, x_2, \dots, x_n) + \sum_k \lambda_k [r_k(x_1, \dots, x_n) - b_k]$. Penyelesaiannya melibatkan sistem persamaan: $\frac{\partial L}{\partial x_i} = 0$ dan $\frac{\partial L}{\partial \lambda_k} = 0$.
- Kondisi optimasi ini juga dikaitkan dengan Matriks Hessian ($H$), yaitu matriks yang berisi turunan parsial orde dua dari fungsi tersebut, yang diformulasikan sebagai $h_{ij} = \frac{\partial^2 y}{\partial x_i \partial x_j}$.

**6. Integrasi Lipat Ganda (_Multiple Integration_)** Untuk mengukur "volume" di bawah sebuah "permukaan" multi-variabel, integral lipat ganda digunakan:

- Bentuk umum: $V = \int \int \dots \int f(x_1, x_2, \dots, x_n) dx_1 dx_2 \dots dx_n$.
- Bentuk volume dua dimensi: $V = \int \int f(x_1, x_2) dx_1 dx_2$.

**7. Elastisitas** Dalam ekonometrika transportasi, elastisitas menggambarkan persentase perubahan pada suatu variabel dependen ($y$) akibat persentase perubahan pada variabel independen ($x_i$), seperti sensitivitas permintaan terhadap tarif.

- Rumus elastisitas titik: $E(y, x_i) = \frac{\partial y}{\partial x_i} \frac{x_i}{y}$.

**8. Ekspansi Deret (_Series Expansions_)** Kalkulus menawarkan metode untuk mengestimasi nilai suatu fungsi yang rumit di sekitar titik tertentu ($x_0$) dengan mengubahnya menjadi deret polinomial.

- Angka faktorial, sebagai elemen deret: $n! = n(n - 1)(n - 2) \dots 3 \cdot 2 \cdot 1$ dan $0! = 1$.
- Ekspansi Deret Taylor di sekitar $x_0$: $f(x_0 + h) = f(x_0) + h f'(x_0) + (h^2/2!)f''(x_0) + (h^3/3!)f'''(x_0) + \dots$.
- Deret Maclaurin (Deret Taylor pada kondisi khusus saat $x_0 = 0$ dan $h$ diganti dengan $x$): $f(x) = f(0) + h f'(0) + (h^2/2!)f''(0) + (h^3/3!)f'''(0) + \dots$.
- Sebagai contoh penggunaan Deret Maclaurin pada fungsi eksponensial: $e^x = 1 + x + x^2/2! + x^3/3! + \dots$.

## Elementary Mathematical Statistics

Dalam konteks bab "2 Mathematical Prerequisites", bagian "Elementary Mathematical Statistics" (Statistik Matematika Dasar) merupakan fondasi yang mutlak diperlukan dalam teknik pemodelan transportasi kontemporer. Karena ahli perencanaan transportasi tidak mungkin mengamati populasi secara keseluruhan, mereka sangat bergantung pada sampel data dan perlu mengambil kesimpulan (inferensi) yang valid dari sampel tersebut,. Oleh karena itu, konsep-konsep statistik deskriptif, probabilitas, distribusi probabilitas (seperti Normal dan EV1 yang merupakan tulang punggung model _Probit_ dan _Logit_), serta estimasi parameter dan pengujian hipotesis (seperti _Maximum Likelihood_) dijelaskan secara rinci di bagian ini,,.

Berikut adalah penjabaran konsep statistik yang dibahas beserta seluruh rumusnya:

**1. Probabilitas dan Variabel Acak (_Probabilities and Random Variables_)** Probabilitas bahwa suatu kejadian akan muncul didefinisikan sebagai limit dari frekuensi relatifnya: $P(e_i) = p_i = \lim_{n \to \infty} \frac{n_i}{n}$. Beberapa sifat dasar dan aturan probabilitas meliputi:

- Batasan nilai: $0 \le p_i \le 1$.
- Total probabilitas: $\sum_i p_i = 1$.
- Probabilitas suatu kejadian (gabungan hasil): $P(E) = \sum_i p_i$, untuk $e_i \in E$.
- Aturan gabungan: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$.
- Aturan gabungan untuk kejadian saling lepas: $P(A \cup B) = P(A) + P(B)$.
- Peluang bersyarat: $P(A/B) = P(A \cap B) / P(B)$,.
- Kejadian independen (saling bebas): $P(E \cap F) = P(E)P(F)$.

Variabel acak memetakan ruang sampel menjadi angka dengan distribusi probabilitas tertentu. Untuk variabel acak kontinu, fungsi kepadatan probabilitas (_probability density function_) $f(x)$ harus memenuhi syarat: $\int_x f(x)dx = 1$ dan $f(x) \ge 0, \forall x$.

**2. Momen Statistik dan Ukuran Dispersi (_Moments around Zero_)** Ringkasan statistik digunakan untuk mendeskripsikan "titik tengah" dan sebaran dari suatu distribusi probabilitas.

- **Nilai Harapan (_Expected Value/Mean_):** Kasus diskret: $E(X) = \sum_i x_i p_i(x_i)$. Kasus kontinu: $E(X) = \int_a^b x f(x) dx$.
- **Operator Linearitas Nilai Harapan:** $E(a + bX + cY) = a + bE(X) + cE(Y)$.
- **Median ($X_{0.5}$):** Kasus diskret: $P(X_{0.5}) = \sum_{x=1}^{X_{0.5}} P(X) = 0.5$. Kasus kontinu: $P(x < X_{0.5}) = \int_a^{X_{0.5}} f(x) dx = 0.5$.
- **Varians:** $Var(X) = E{[X - \mu]^2} = E(x^2) - E^2(x)$. Untuk kasus kontinu: $Var(X) = \int (x - \mu)^2 f(x) dx$. Varians populasi: $\sigma^2 = \sum_i (x_i - \mu)^2 \cdot p_i(x_i) = \sum_i x_i^2 \cdot p_i(x_i) - \mu^2$.
- **Kovarians (ukuran hubungan dua variabel):** $Cov(X, Y) = E((X - \mu_x) \cdot (Y - \mu_y)) = E(XY) - E(X)E(Y)$.
- **Sebaran Sampel (_Sample Dispersion / Sample Variance_):** $s^2 = \frac{\sum_i (x_i - \bar{X})^2}{n - 1}$.

Selain itu, matriks kovariansi umum yang memuat varians di diagonal utama dan kovariansi di elemen lainnya direpresentasikan sebagai: $\Sigma = \begin{pmatrix} \sigma_1^2 & \rho_{1,2}\sigma_1\sigma_2 & \rho_{1,3}\sigma_1\sigma_3 & \dots \ \rho_{1,2}\sigma_1\sigma_2 & \sigma_2^2 & \rho_{2,3}\sigma_2\sigma_3 & \dots \ \dots & \dots & \dots & \dots \ \dots & \dots & \sigma_n^2 \end{pmatrix}$,.

**3. Distribusi Probabilitas Lanjutan (_More Advanced Statistical Concepts_)** Dua fungsi kepadatan probabilitas (PDF) ini adalah fondasi paling penting dalam pemodelan pilihan diskret:

- **Distribusi Normal/Gauss** (basis bagi keluarga model _Probit_),: Standar $N(0,1)$: $f(Z) = \frac{1}{\sqrt{2\pi}} \exp(-\frac{1}{2}Z^2)$. Secara umum $N(\mu, \sigma^2)$: $f(X) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{1}{2}\left(\frac{x - \mu}{\sigma}\right)^2\right)$. Menurut _Central Limit Theorem_, variabel dapat distandarisasi sehingga berlaku: $\frac{x - \mu}{\sigma/\sqrt{n}} \sim N(0, 1)$ jika $n \ge 30$.
- **Bentuk Kuadratik (_Quadratic Form_) Distribusi Normal Multivariat:** $QF_2 = \frac{1}{1 - \rho^2} \left[ \left(\frac{x_1 - \bar{x}_1}{\sigma_1}\right)^2 - 2\rho \frac{(x_1 - \bar{x}_1)(x_2 - \bar{x}_2)}{\sigma_1\sigma_2} + \left(\frac{x_2 - \bar{x}_2}{\sigma_2}\right)^2 \right]$. Secara umum: $QF_n = (x - \bar{x})^T \Sigma^{-1} (x - \bar{x})$, yang terdistribusi secara _Chi-squared_ ($\chi^2$) dengan $n$ derajat kebebasan,.
- **Distribusi _Extreme Value Type I_ (_Gumbel / Weibull_)** (basis bagi keluarga model _Logit_): Fungsi distribusi kumulatif (CDF): $F(\epsilon) = \exp[-\exp(-\lambda(\epsilon - \eta))]$. Fungsi kepadatan probabilitas (PDF): $f(\epsilon) = \lambda \exp[-\lambda(\epsilon - \eta)] \exp[-\exp(-\lambda(\epsilon - \eta))]$.

**4. Inferensi Statistik (_Statistical Inference_)** Tujuan dari inferensi statistik adalah mendeduksi karakteristik populasi menggunakan sampel. Metode estimasi parameter yang paling sering digunakan dalam transportasi adalah _Maximum Likelihood_,.

- **Fungsi Kepadatan Gabungan:** $g(x_1, x_2, \dots, x_n, \theta) = \prod_n f(x_i, \theta)$.
- **Fungsi Log-Likelihood** (lebih mudah dimaksimalkan dengan kalkulus): $l(\theta) = \ln g(x_1, x_2, \dots, x_n, \theta) = \sum_n \ln f(x_n, \theta)$.
- **Contoh pada Distribusi Normal:** $l(\mu) = \ln \left( \frac{1}{\sqrt{2\pi}\sigma} \right)^n - \frac{1}{2} \sum_{i=1}^n \left( \frac{x_i - \mu}{\sigma} \right)^2$. Penyelesaian maksimum $\frac{\partial l}{\partial \mu} = 0 = \frac{\sum x_i - n\hat{\mu}}{\sigma^2}$ menghasilkan $\hat{\mu} = \frac{\sum x_i}{n} = \bar{x}$.
- **Karakteristik Estimator yang Baik:** Tidak bias (_unbiased_): $E(\hat{\theta}) = \theta$. Asimtotik tidak bias: $\lim_{n \to \infty} E(\hat{\theta}) = \theta$,. Konsisten: $\lim_{n \to \infty} E(\hat{\theta} - \theta)^2 = 0$.

Dalam pengujian hipotesis (misal menguji apakah suatu parameter spesifik benar-benar memberikan efek pada fenomena), probabilitas diukur terkait Risiko Kesalahan Tipe I ($\alpha$, menolak hipotesis ketika sebenarnya benar) dan Kesalahan Tipe II ($\beta$, menerima hipotesis saat sebenarnya salah). Pada praktiknya, probabilitas kedua tipe kesalahan ini hanya bisa diturunkan secara bersamaan dengan memperbesar ukuran sampel ($n$), karena simpangan baku sampel menyusut proporsional terhadap $\sigma/\sqrt{n}$,.