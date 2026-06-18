# Proyek Book Chapter Tentang Transportasi

Proyek ini adalah sebuah _book chapter_ (bab buku) tentang transportasi dengan judul chapter 'Perencanaan Transportasi'. Bab buku ini adalah proyek kolaborasi penulisan buku dengan judul 'Manajemen Transportasi'.

Buku ini punya 10 bab:

Bab 1 : Konsep Dasar Manajemen Transportasi
Bab 2 : Sistem Transportasi dan Moda Transportasi
Bab 3 : Perencanaan Transportasi → _bagian saya_
Bab 4 : Manajemen Operasional Transportasi
Bab 5: Manajemen Infrastruktur Transportasi
Bab 6: Manajemen Lalu Lintas dan Angkutan
Bab 7: Ekonomi dan Pembiayaan Transportasi
Bab 8: Teknologi dalam Manajemen Transportasi
Bab 9: Kebijakan dan Regulasi Transportasi
Bab 10: Transportasi Berkelanjutan

## Direktori Kerja

```text
book-chapter-transport
├── .agents
│   └── skills
│       ├── buat-tabel
│       ├── directory-catalog
│       ├── fix-footnotes
│       ├── fix-spaces
│       ├── office-to-markdown
│       └── unify-paragraph
├── .obsidian
├── brainstorm
│   ├── assets
│   ├── books
│   ├── legals
│   ├── news
│   ├── output
│   ├── pptx
│   └── research
├── how-to-quarto
│   ├── 01-authoring
│   ├── 02-computations
│   ├── 03-tools
│   ├── 04-documents
│   ├── 07-websites
│   └── 08-books
└── menulis
    └── log
```


## Keterangan Skill

| Nama Skill | Gunakan untuk |
|------------|---------------|
| `buat-tabel` | Membuat berbagai jenis tabel di Quarto markdown dengan format yang tepat (pipe tables, list tables, colspan/rowspan, dan panel/subtables) beserta referensi silangnya. |
| `directory-catalog` | Memetakan dan membuat ringkasan/katalog isi dokumen yang ada di dalam suatu direktori menjadi satu berkas ringkasan. |
| `fix-footnotes` | Mendeteksi angka catatan kaki (footnote) polos pada dokumen Markdown dan mengubahnya menjadi format tag HTML `<sup>` secara otomatis dengan analisis batas jumlah rujukan. |
| `fix-spaces` | Membersihkan spasi ekstra di antara huruf-huruf pada kata dalam dokumen Markdown (akibat kesalahan encoding/konversi dari PDF/Word). |
| `office-to-markdown` | Mengonversi berkas Microsoft Office (`.docx`, `.xlsx`, `.pptx`) menjadi dokumen berformat Markdown (`.md`) secara lokal menggunakan pustaka Python `markitdown`. |
| `unify-paragraph` | Menggabungkan baris teks yang terpisah akibat pemisah baris tunggal (line break) menjadi satu paragraf yang utuh dan berkesinambungan. |


## Peta Kerja


| Ketika Anda...                                      | Pergi ke...       | Lalu baca ini...                          |
|-----------------------------------------------------|-------------------|-------------------------------------------|
| Baru merumuskan ide untuk menghasilkan buku         | `@brainstorm`     | [`@CONTEXT.md`](brainstorm/CONTEXT.md)    |
| Merevisi keluaran ide                               | `@brainstorm`     | [`@CONTEXT.md`](brainstorm/CONTEXT.md)    |
| Mendapatkan revisi dari tulisan asli                | `@menulis`        | [`@CONTEXT.md`](menulis/CONTEXT.md)       |
| Betul-betul menulis buku yang menghasilkan keluaran | `@menulis`        | [`@CONTEXT.md`](menulis/CONTEXT.md)       |
| Ingin mempelajari dokumentasi tentang Quarto        | `@how-to-quarto`  | [`@CONTEXT.md`](how-to-quarto/CONTEXT.md) |

## Aturan Umum Proyek

Bahasa utama yang digunakan dalam proyek ini adalah bahasa Indonesia. Bahasa Inggris digunakan HANYA untuk berkomunikasi dengan agen jika diperlukan.

## Apa yang tidak boleh dilakukan

- Membuat asumsi sendiri tanpa mengajukan pertanyaan klarifikasi
- Membuat pilihan sendiri ketika Anda tidak yakin
- Menjadi _black box_ dengan mengerjakan sesuatu yang tidak saya eksplisit suruh, tanpa memberi tahu saya apa yang Anda lakukan, bagaimana Anda melakukannya, dan memaparkan apa akibat yang akan timbul dari pekerjaan Anda

## Apa yang HARUS dilakukan

- Tidak melakukan larangan saya
