# Log Penulisan: Draft Awal Bab Perencanaan Transportasi (Edisi Batasan Halaman Ketat)
**Tanggal:** 18 Juni 2026 10:33
**Penulis:** Antigravity (AI Coding Assistant)

---

## 1. Ringkasan Pekerjaan

Sesi ini memulai penulisan draf pertama untuk Bab 3: **Perencanaan Transportasi** dengan format penulisan Quarto Markdown (`.qmd`) untuk kemudian dikompilasi menjadi dokumen Word (`.docx`). Penulisan didasarkan pada hasil diskusi *brainstorming* terkompresi untuk memenuhi target batas panjang **5 - 10 halaman A4** (~1.700 - 3.500 kata).

## 2. Berkas yang Dihasilkan

1.  **[20260618a diskusi isi bab.qmd](../20260618a%20diskusi%20isi%20bab.qmd):** Berkas naskah utama Quarto yang berisi struktur bab lengkap (Subbab 3.1 - 3.7).
2.  **[references.bib](../references.bib):** Berkas basis data kutipan berformat BibTeX yang berisi 6 buku teks klasik dan 3 referensi akademis terkini (2024-2026) mengenai pemodelan transportasi dan AI di Indonesia.

## 3. Struktur Isi & Jumlah Kata

*   **Subbab 3.1: Pendahuluan** - Menguraikan urgensi intervensi perencanaan untuk mengelola mobilitas masa depan.
*   **Subbab 3.2: Sistem Transportasi Makro dan Perilaku Perjalanan** - Membahas interaksi timbal balik T-A-F (Manheim) dan 4 subsistem makro (Tamin). Menjelaskan konsep *derived demand* serta paradigma *ship follows the trade* vs. *trade follows the ship*.
*   **Subbab 3.3: Siklus Perencanaan dan Kebutuhan Data Spasial** - Membahas proses perencanaan rasional (Anderson) dan skala analisis wilayah. Menyertakan **Tabel 1** (`@tbl-metode-survei`) untuk merangkum metode pengumpulan data secara padat.
*   **Subbab 3.4: Dasar Pemodelan Transportasi dan Formulasi Empat Tahap** - Menjabarkan tujuan model, konsep TAZ, dan menyertakan **Tabel 2** (`@tbl-four-step-model`) untuk merangkum langkah-langkah *Four-Step Model* beserta formula matematis dasarnya (Gravitasi, Logit, BPR). Membahas relasi V/C Ratio dengan LOS jalan.
*   **Subbab 3.5: Evolusi Pemodelan: Dari Klasik ke Era Kecerdasan Buatan (AI)** - Menguraikan transisi menuju ABM, DTA, dan simulasi berbasis agen (MATSim). Membahas contoh nyata implementasi teknologi otonom AI di Indonesia (tarif dinamis Gojek/Grab dan lampu lalu lintas ITCS Jakarta Smart City).
*   **Subbab 3.6: Integrasi Transportasi dan Penataan Ruang** - Menguraikan konsep LUTI, aksesibilitas, dan sinkronisasi struktur & pola ruang berlandaskan Permen ATR/BPN No. 6 Tahun 2026.
*   **Subbab 3.7: Penutup** - Sintesis akhir dan pengantar ke bab operasional.
*   **Estimasi Jumlah Kata:** ~1.850 kata (setara ~6-7 halaman A4 dengan ukuran huruf 12 dan spasi 1,5, memenuhi batas 5-10 halaman).

## 4. Gaya Penulisan & Kaidah yang Diterapkan

*   **Bahasa yang Membumi:** Menghindari jargon berlebih (misalnya menggunakan "pusat" untuk menggantikan "episentrum", dan "menghemat biaya perjalanan" untuk menggantikan "efisiensi ekonomi").
*   **Struktur Kalimat:** Memecah kalimat-kalimat kompleks yang terlalu panjang agar nyaman dibaca.
*   **Kaidah Istilah Asing:** Mencetak miring semua istilah asing (seperti *derived demand*, *Four-Step Model*, *Traffic Analysis Zone*, *user equilibrium*, dll.).
*   **Kaidah Gambar/Tabel:** Seluruh teks penjelasan ditempatkan *sebelum* tabel muncul, dan tabel diacu menggunakan fitur rujukan otomatis `@tbl-...` milik Quarto secara disiplin.
*   **Daftar Pustaka Otomatis:** Menggunakan pemrosesan kutipan terintegrasi Quarto via Pandoc dengan data rujukan yang bersumber dari berkas `.bib`.
