# Hasil Diskusi & Sistematika Bab: Perencanaan Transportasi
**Tanggal:** 17 Juni 2026
**Target Keluaran:** Draft Bab dengan kedalaman ekuivalen ~20 halaman isi murni (~8.000 - 10.000 kata)

---

## 1. Catatan Integrasi Feedback Penulis & Perbaikan Celah

Berdasarkan diskusi dan arahan Anda, dokumen ini merevisi dan melengkapi rencana penulisan bab dengan rincian tindakan sebagai berikut:

*   **Penyatuan Perencanaan & Transportasi (L16):** Menggunakan kerangka kerja proses perencanaan rasional dari [[@anderson1995guidelines]] sebagai landasan logis, lalu mengkontekstualisasikannya secara spesifik ke dalam sistem transportasi.
*   **Integrasi Data dan Survei (L20):** Menambahkan sub-subbab khusus tentang pengumpulan data dan survei transportasi yang menjadi jembatan antara fase pemahaman sistem dan pemodelan.
*   **Penyelesaian Bagian Terpotong (L27):** Melengkapi seluruh narasi konsep dasar subbab yang sebelumnya terpotong pada overview awal Anda.
*   **Reposisi Kategori Agregat/Disagregat (L55):** Memasukkan pengelompokan ini ke dalam pembahasan konsep model secara umum (Subbab 3.4.1), bukan sebagai subbab terpisah.
*   **Klarifikasi Istilah Manheim & Paradigma Transportasi (L96, L102, L106):**
    *   Menggunakan istilah hubungan timbal balik T-A-F dari Manheim secara tepat.
    *   Menggunakan istilah yang lebih tepat: konsep Manheim "dipertegas oleh Tamin" (bukan dikembangkan).
    *   Memasukkan paradigma pembangunan ekonomi berbasis transportasi: **"Ship follows the trade"** (transportasi sebagai penunjang/reaktif terhadap pasar) vs. **"Trade follows the ship"** (transportasi sebagai pendorong/pemicu wilayah baru, atau disebut juga *ship promotes/attracts the trade*).
*   **Skala Wilayah Analisis (L124):** Memasukkan pembagian tingkat kedalaman analisis perencanaan/pemodelan: **Makro** (strategis/kota-regional), **Meso** (koridor/kawasan), and **Mikro** (operasional/simulasi persimpangan).
*   **Penahanan Konteks Kelembagaan (L130):** Membatasi detail kelembagaan Indonesia yang dinamis; berfokus pada peran kelembagaan secara universal (regulator, operator, pengguna, masyarakat) agar tulisan tetap fleksibel dan awet.
*   **Pengonteksan Model ke Realitas Transportasi (L145):** Menjelaskan realitas kompleks apa yang disederhanakan oleh model (perilaku pilihan manusia yang stokastik, interaksi kemacetan pada jaringan fisik, dan tundaan ruang-waktu).
*   **Pengurutan Logika Pemodelan (L146):** Memastikan subbab "Mengapa Model Diperlukan" diletakkan di bagian awal sebelum membahas komponen supply-demand.
*   **Konsep Zona / TAZ (L156):** Menambahkan penjelasan Traffic Analysis Zone (TAZ) sebagai unit analisis spasial dasar dalam pemodelan transportasi.
*   **Konsistensi Terminologi Antarsubbab (L245):** Memastikan istilah-istilah seperti Prediksi Arus, V/C Ratio (*Volume to Capacity Ratio*), dan Tingkat Pelayanan Jalan (*Level of Service* / LOS) sudah didefinisikan dengan baik di Subbab 3.4 sebelum digunakan dalam konteks tata ruang di Subbab 3.6.
*   **Formula Dasar (L275):** Memutuskan untuk menyertakan formula dasar matematis (seperti fungsi utilitas logit, persamaan gravitasi, dan fungsi hambatan BPR) beserta contoh kasus perhitungan sederhana untuk memberikan kedalaman akademis.

---

## 2. Struktur Bab Perencanaan Transportasi (Revisi Final)

Berikut adalah sistematika detail bab yang dirancang untuk memenuhi kedalaman ~20 halaman:

### **Subbab 3.1: Pendahuluan** (~1 Halaman)
*   **Fokus:** Menghubungkan bab ini dengan Bab 1 (Konsep Dasar) dan Bab 2 (Moda Transportasi).
*   **Narasi:** Mengapa setelah memahami moda dan konsep dasar, kita perlu merencanakan? Mengenalkan perencanaan sebagai cara mengelola masa depan sistem pergerakan.

### **Subbab 3.2: Memaknai Sistem Transportasi secara Menyeluruh** (~3,5 Halaman)
*   **Fokus:** Memahami interaksi sistemik transportasi.
*   **Poin Bahasan:**
    1.  Transportasi sebagai sistem kompleks (*multi-modal, multi-sektor, multi-problem, multi-disiplin*).
    2.  Model Interaksi Transportasi-Aktivitas Manheim (Diagram T-A-F: *Transport system, Activity system, Flow pattern*).
    3.  Penegasan Tamin: Sistem Transportasi Makro yang mencakup 3 subsistem fisik (kegiatan, jaringan, pergerakan) dan subsistem kelembagaan.
    4.  Paradigma Pembangunan: **"Ship follows the trade"** (pendekatan penunjang/reaktif) vs. **"Trade follows the ship"** (pendekatan pendorong/proaktif).
    5.  Konsep *Derived Demand* (permintaan turunan) dalam pergerakan manusia dan barang.

### **Subbab 3.3: Proses Perencanaan dan Kebutuhan Data** (~3,5 Halaman)
*   **Fokus:** Menjelaskan siklus perencanaan rasional dan input yang dibutuhkannya.
*   **Poin Bahasan:**
    1.  Konsep Perencanaan Rasional: Meminjam kerangka 9 tahap Anderson (1995) (identifikasi masalah, perumusan tujuan, pengumpulan data, dst.) yang bersifat siklikal.
    2.  Proses Perencanaan Berdaur khusus Transportasi (Adaptasi Tamin).
    3.  Skala Analisis Wilayah Perencanaan Transportasi:
        *   *Makro:* Perencanaan strategis, wilayah kota/regional, jangka panjang.
        *   *Meso:* Perencanaan koridor jalan atau sub-kawasan khusus.
        *   *Mikro:* Desain persimpangan, manajemen lalu lintas lokal, operasional jangka pendek.
    4.  Siklus Kelembagaan Universal: Interaksi antara Pembuat Kebijakan (Regulator), Penyedia Layanan (Operator), dan Pengguna (User).
    5.  **Metodologi Pengumpulan Data & Survei:**
        *   Survei Primer: Inventarisasi prasarana, *Traffic Count* (pencacahan lalu lintas), *O-D Survey* (survei asal-tujuan), dan *Household Interview Survey* (survei rumah tangga).
        *   Survei Sekunder: Data kependudukan, tata guna lahan eksisting, dan indikator sosial-ekonomi.

### **Subbab 3.4: Pemodelan dalam Transportasi** (~7 Halaman)
*   **Fokus:** Alat analisis kuantitatif utama perencana transportasi.
*   **Poin Bahasan:**
    1.  **Konsep Pemodelan Umum:** Definisi model sebagai penyederhanaan realitas transportasi yang kompleks (perilaku manusia, interaksi fisik jalan, batasan ruang-waktu).
    2.  Mengapa Model Diperlukan? (Eksplorasi skenario masa depan sebelum investasi fisik dilakukan).
    3.  Kategorisasi Model: Makroskopik vs. Mikroskopik; Agregat (berbasis zona) vs. Disagregat (berbasis individu).
    4.  Sistem Analisis Spasial: Pembagian wilayah menjadi **Traffic Analysis Zone (TAZ)**, centroid, dan konektor jaringan.
    5.  Tiga Blok Model Utama (Cascetta): *Supply* (jaringan jalan/transit), *Demand* (permintaan perjalanan), dan *Assignment* (pembebanan arus).
    6.  **Model Klasik Empat Tahap (*Four-Step Model*):**
        *   *Bangkitan/Tarikan Pergerakan (Trip Generation):* Menggunakan analisis regresi linier dan *cross-classification*. Formula dasar disertakan.
        *   *Sebaran Pergerakan (Trip Distribution):* Model Gravitasi (*Gravity Model*) dengan fungsi hambatan (*friction factor*). Rumus matematika dan contoh matriks O-D sederhana.
        *   *Pemilihan Moda (Modal Split):* Teori utilitas acak (*Random Utility Theory*). Model Logit Biner/Multinomial beserta rumus probabilitas pilihan moda.
        *   *Pemilihan Rute (Traffic Assignment):* Konsep kapasitas jalan dan tundaan (fungsi hambatan BPR). Prinsip Keseimbangan Wardrop (*User Equilibrium* vs. *System Optimum*).
    7.  Terminologi Kinerja Jaringan: Hubungan volume lalu lintas terhadap kapasitas jalan (**V/C Ratio**), kecepatan arus bebas, dan **Tingkat Pelayanan Jalan (*Level of Service* / LOS)**.

### **Subbab 3.5: Perkembangan dan Evolusi Model Transportasi** (~2 Halaman)
*   **Fokus:** Menyoroti keterbatasan FSM klasik dan arah masa depan pemodelan.
*   **Poin Bahasan:**
    1.  Kritik terhadap Model Empat Tahap: Asumsi sekuensial yang kaku, pengabaian ketergantungan antar-perjalanan dalam satu hari, serta bias agregasi zona.
    2.  *Activity-Based Approach (ABA):* Memandang perjalanan sebagai bagian dari pemenuhan aktivitas harian terintegrasi (Prisma Ruang-Waktu Hägerstrand).
    3.  Model Dinamis (*Dynamic Traffic Assignment*): Transisi dari model statis menuju model dinamis dalam-hari (*within-day*) untuk mengakomodasi sistem informasi waktu-nyata (ITS/ATIS).
    4.  Matriks Transisi Paradigma Pemodelan (Sussman).

### **Subbab 3.6: Integrasi Perencanaan Transportasi dan Tata Ruang** (~2,5 Halaman)
*   **Fokus:** Menghubungkan teori transportasi dengan praktik penataan ruang di Indonesia.
*   **Poin Bahasan:**
    1.  Interaksi Dua Arah Guna Lahan dan Transportasi (*Land-Use Transport Interaction* / LUTI): Bagaimana aktivitas tata guna lahan memicu bangkitan pergerakan, dan bagaimana jaringan jalan membentuk nilai lahan baru.
    2.  Aksesibilitas sebagai jembatan penghubung utama antara guna lahan dan transportasi.
    3.  Aplikasi dalam Rencana Tata Ruang (RTRW/RDTR) sesuai amanat regulasi nasional (seperti kewajiban kajian lalu lintas dan integrasi transportasi makro):
        *   Penyusunan *Struktur Ruang:* Hubungan V/C Ratio dan LOS jalan dalam menentukan hierarki jaringan jalan arteri, kolektor, lokal.
        *   Penyusunan *Pola Ruang:* Pengendalian bangkitan pergerakan melalui zonasi guna lahan dan konsep pembangunan berorientasi transit (TOD).
    4.  Tantangan integrasi kelembagaan perencanaan tata ruang dan transportasi di tingkat daerah.

### **Subbab 3.7: Penutup** (~0,5 Halaman)
*   **Fokus:** Rangkuman sintesis seluruh bab dan pengantar menuju Bab 4 (Manajemen Operasional).

---

## 3. Agenda Riset Lanjutan untuk Penulis

Berdasarkan diskusi kita, ada beberapa area yang membutuhkan informasi lebih lanjut. Berikut adalah panduan langkah riset yang dapat Anda lakukan:

### A. Evaluasi Proyek Transportasi (Deep Research Prompt)
Gunakan instruksi di bawah ini untuk mencari bahan literatur lebih mendalam di pangkalan data akademis (seperti Google Scholar atau Scopus) atau kepada asisten riset AI Anda yang lain:

> *"Lakukan tinjauan literatur mengenai metodologi evaluasi proyek transportasi perkotaan di luar Cost-Benefit Analysis (CBA) konvensional. Saya membutuhkan penjelasan mengenai penerapan Multi-Criteria Decision Analysis (MCDA), Analytic Hierarchy Process (AHP), serta penilaian dampak keadilan sosial (social equity impact) dan lingkungan (KLHS/AMDAL) khusus untuk sektor transportasi. Fokuskan pencarian pada jurnal perencanaan transportasi internasional (misal: Transport Policy, Transportation Research Part A) dari tahun 2018-2026."*

### B. Fakta Regulasi & Praktis di Indonesia yang Harus Dicek (Subbab 3.6)
Untuk memastikan tulisan Anda mutakhir dan tidak menyajikan fakta kedaluwarsa, Anda perlu memeriksa:
1.  **Permen ATR/BPN No. 6 Tahun 2026:** Pastikan ketetapan mengenai "kewajiban sertifikasi perencana wilayah minimal 5 tahun" dan "tenggat waktu penyusunan rencana detail tata ruang" benar-benar berlaku mutlak atau memiliki klausul pengecualian di daerah tertinggal/perbatasan.
2.  **Sistem Kelembagaan Daerah:** Bagaimana pembagian kewenangan perencanaan jalan tol, jalan nasional, jalan provinsi, dan jalan kabupaten/kota saat ini (apakah ada tumpang tindih regulasi pasca-UU Cipta Kerja terbaru).
3.  **Persyaratan ANDALALIN (Analisis Dampak Lalu Lintas):** Bagaimana integrasi dokumen persetujuan lingkungan (AMDAL) dengan persetujuan analisis dampak lalu lintas berdasarkan regulasi sektoral perhubungan darat yang paling baru.
