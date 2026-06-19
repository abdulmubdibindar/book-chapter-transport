# Log Penulisan: Analisis Masalah Render Quarto & Penyelesaiannya
**Tanggal:** 18 Juni 2026 10:46
**Penulis:** Antigravity (AI Coding Assistant)

---

## 1. Kronologi Masalah

Saat mencoba menerapkan pengaturan halaman (ukuran kertas A4 dan margin) serta *font face* (Aptos/Aptos Display), kita sempat menemui hambatan berupa kegagalan perintah render (`quarto render`) yang memakan waktu pengerjaan. Masalah ini terbagi dalam dua fase:

### A. Galat Validasi Typst Margin (Fase 1)
Ketika pertama kali mendefinisikan margin untuk format `typst` di dalam berkas konfigurasi, kita menggunakan istilah `inside` dan `outside` (untuk format bolak-balik/cermin):
```yaml
margin:
  inside: 4cm
  outside: 3cm
```
Ini memicu galat validasi skema YAML dari mesin Quarto karena Typst hanya mengenali parameter arah absolut yaitu `left` dan `right`.

### B. Galat "No valid input files passed to render" (Fase 2)
Setelah galat margin Typst diperbaiki, perintah render manual untuk satu berkas:
```bash
quarto render "20260618a bab 3.qmd" --to docx
```
mengalami kegagalan dengan pesan galat: `ERROR: No valid input files passed to render`. 

Hal ini disebabkan karena kehadiran berkas `_quarto.yml` mengubah direktori menjadi sebuah **Quarto Project**. Di dalam proyek Quarto, argumen perintah render sering kali dicegat oleh manajer proyek untuk memvalidasi daftar berkas proyek (manifest) secara keseluruhan. Akibatnya, perintah render berkas individu dengan nama spesifik (terutama yang mengandung spasi) gagal dikenali sebagai berkas masukan yang sah.

---

## 2. Solusi & Penyelesaian

Untuk mengatasi hambatan tersebut, kita menerapkan langkah-langkah penyelesaian berikut:

1.  **Menghapus `_quarto.yml`:**
    Menyingkirkan berkas proyek ini untuk membebaskan direktori `menulis/` dari batasan kompilasi tingkat proyek (*project-level build constraints*).
2.  **Mengadopsi `_metadata.yml`:**
    Sebagai gantinya, kita membuat berkas [_metadata.yml](../_metadata.yml). Berkas ini adalah mekanisme resmi dari Quarto untuk membagikan parameter pemformatan secara kolektif ke semua dokumen di dalam satu folder (seperti tipe font, ukuran halaman, dan margin), tanpa harus menginisialisasi folder tersebut sebagai proyek terstruktur.
3.  **Memperbaiki Parameter Margin:**
    Mengubah parameter margin untuk format `typst` dari `inside/outside` menjadi `left/right` (Kiri: 4cm, Kanan: 3cm) agar lolos validasi skema Quarto.
4.  **Kompilasi Ulang Sukses:**
    Setelah pemindahan konfigurasi ke `_metadata.yml` selesai, perintah `quarto render` dijalankan kembali untuk berkas [20260618a bab 3.qmd](../20260618a%20bab%203.qmd) dan berhasil menghasilkan [20260618a bab 3.docx](../20260618a%20bab%203.docx) dengan sukses tanpa ada pesan peringatan ataupun galat.
