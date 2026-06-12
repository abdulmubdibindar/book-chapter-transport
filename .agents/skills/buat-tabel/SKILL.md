---
name: buat-tabel
description: Skill untuk membuat berbagai jenis tabel di Quarto markdown dengan format yang tepat, mendukung tabel sederhana (pipe), referensi silang, list table untuk konten kompleks, serta penggabungan sel (colspan/rowspan).
---

# Instruksi Skill: buat-tabel

Gunakan skill ini ketika pengguna meminta Anda untuk membuat tabel dalam dokumen Quarto. Quarto mendukung berbagai macam format tabel. Berikut adalah panduan dan format yang harus selalu Anda ikuti berdasarkan referensi praktik terbaik penulisan Quarto.

## 1. Tabel Markdown Dasar (Pipe Tables)
Gunakan *pipe tables* untuk tabel sederhana yang hanya berisi teks biasa tanpa elemen blok tambahan.
- Pisahkan kolom dengan `|`.
- Gunakan `:` pada baris pemisah (header) untuk mengatur perataan (kiri, kanan, tengah).
- Tambahkan *caption*, atribut gaya Bootstrap (seperti `.striped`, `.hover`), dan tentukan ukuran kolom (opsional) menggunakan `tbl-colwidths` setelah tabel.

**Contoh:**
```markdown
| Buah   | Harga |
|:-------|------:|
| Apel   | 2.05  |
| Jeruk  | 3.09  |

: Harga Buah {.striped .hover tbl-colwidths="[70,30]" #tbl-harga-buah}
```
*Catatan: Pastikan semua label referensi tabel diawali dengan awalan `tbl-` (contoh: `#tbl-harga-buah`).*

## 2. Tabel dengan Konten Kompleks (List Tables)
Gunakan *list tables* jika sel tabel berisi konten yang kompleks, seperti beberapa paragraf, blok kode, atau daftar (list). Format ini jauh lebih mudah ditulis dan dipelihara daripada *grid tables*.
- Gunakan *fenced div* `::: {.list-table}`.
- Bullet level atas adalah baris, bullet yang bersarang di dalamnya adalah kolom/sel.
- Atribut tambahan seperti perataan (`aligns="l,r,c"`), lebar kolom (`tbl-colwidths`), dan penonaktifan baris tajuk/header (`header-rows=0`) dapat langsung ditulis di dalam tag div.
- Tambahkan deskripsi caption pada baris pertama di dalam tag div. Jangan lupa sertakan label `id` tabel.

**Contoh:**
```markdown
::: {#tbl-fungsi .list-table aligns="l,l" tbl-colwidths="[30,70]"}
Fungsi Python dan Kegunaannya

- - Fungsi
  - Deskripsi
- - `sum()`
  - Menjumlahkan nilai:
    ```python
    sum([1, 2, 3])
    ```
- - `len()`
  - Menghitung jumlah item:
    - Bisa untuk list
    - Bisa untuk string
:::
```
*Gunakan ini sebagai preferensi utama ketika data berpotensi butuh pemformatan blok.*

## 3. Menggabungkan Sel (Colspan & Rowspan)
Untuk menggabungkan baris atau kolom, pendekatan terbaik adalah menggunakan atribut sel pada *list table* menggunakan tag rentang kosong (`[]{colspan=X}` atau `[]{rowspan=X}`) sebagai elemen pertama pada sel:

**Contoh:**
```markdown
::: {#tbl-gabung .list-table}
Kategori dan Harga Buah

- - []{colspan=2} Kategori / Item
  - Harga
- - []{rowspan=2} Jeruk-jerukan
  - Jeruk
  - 0.90
- - Lemon
  - 0.80
- - []{rowspan=2} Buah Batu
  - Persik
  - 1.20
- - Plum
  - 1.00
:::
```

Jika tidak memungkinkan dengan *list tables*, Quarto mendukung elemen HTML mentah (`<table>`, `<tr>`, `<td>` dengan `colspan` dan `rowspan`), karena Quarto secara otomatis memproses tabel HTML ke Markdown untuk semua format output (termasuk PDF dan lain-lain).

## 4. Tabel Sub-Bagian (Subtables)
Bila ingin merangkai beberapa tabel secara bersisihan atau menjadikannya sub-bagian di satu rujukan induk, gabungkan tabel-tabel di dalam blok *fenced div* dengan keterangan `layout-ncol`.

**Contoh:**
```markdown
::: {#tbl-panel layout-ncol=2}
| Kolom1 | Kolom2 |
|--------|--------|
| A      | B      |

: Tabel Pertama {#tbl-pertama}

| Kolom1 | Kolom2 |
|--------|--------|
| C      | D      |

: Tabel Kedua {#tbl-kedua}

Keterangan Utama Panel Secara Keseluruhan
:::

Lihat @tbl-panel untuk detail, khususnya @tbl-kedua.
```

## Pedoman Pembuatan Rujukan (Cross-Reference)
- Ketika mereferensikan tabel dalam kalimat, selalu gunakan anotasi `@tbl-nama` yang sesuai dengan `id` tabel yang Anda deklarasikan. Jangan gunakan penomoran manual.
- Simpan konsistensi pemberian nama id dan caption di setiap tabel.
