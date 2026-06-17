---
name: fix-spaces
description: Membersihkan spasi ekstra di antara huruf-huruf dalam satu kata pada file Markdown, yang biasanya disebabkan oleh artefak encoding saat file dikonversi dari format PDF atau Word.
---

# Fix Spaces

Skill ini membersihkan spasi yang salah tempat di dalam kata-kata pada sebuah file Markdown. Misalnya, teks `P e n d a h u l u a n` akan diperbaiki menjadi `Pendahuluan`.

## Kapan Digunakan

Gunakan skill ini ketika sebuah file `.md` mengandung kata-kata yang huruf-hurufnya terpisah oleh spasi ekstra — umumnya akibat proses konversi dari PDF, Word, atau format lain yang menggunakan encoding berbeda (misalnya UTF-16 atau sisa *null byte*).

## Cara Kerja

Skill ini menggunakan skrip Python (`fix_spaces.py`) yang:

1. Membaca file dalam mode *binary* untuk melihat byte mentahnya.
2. Mendeteksi dan membuang BOM (*Byte Order Mark*) jika ada.
3. **Jika terdapat karakter Null (`\x00`):** Menghapus semua *null byte* tersebut, lalu merapikan sisa spasi.
4. **Jika spasi memang harfiah:** Menggunakan Regex untuk menghapus spasi tunggal yang mengapit huruf (di dalam kata), dan mengubah spasi ganda (pemisah antar kata) menjadi spasi tunggal yang normal.
5. Menyimpan ulang file dalam encoding `UTF-8` yang bersih.

## Cara Menggunakan

1. Salin `fix_spaces.py` ke direktori yang sama dengan file `.md` yang ingin diperbaiki.
2. Ubah nama target file di dalam skrip jika perlu (secara default mencari `1 Pendahuluan.md` di direktori yang sama dengan skrip).
3. Jalankan dari terminal:

```bash
python fix_spaces.py
```

Atau, jalankan secara langsung menentukan file target melalui kode:

```python
fix_file("/path/lengkap/ke/file-anda.md")
```
