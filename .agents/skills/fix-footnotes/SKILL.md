---
name: fix-footnotes
description: >-
  Mendeteksi angka catatan kaki polos di dokumen Markdown dan memformatnya dengan tag <sup> menggunakan guardrails batas jumlah rujukan dan analisis konteks kata.
---

# Fix Footnotes

## Overview
Skill ini digunakan untuk merapikan dokumen Markdown dengan mengonversi angka catatan kaki polos menjadi tag HTML `<sup>` secara otomatis. Skill ini menggunakan guardrail berupa jumlah rujukan maksimum di daftar pustaka untuk menghindari false positives (seperti memformat tahun atau angka lain yang bukan footnote).

## Dependencies
Tidak ada skill lain yang diperlukan sebagai ketergantungan langsung.

## Quick Start
Jalankan perintah berikut pada file Markdown yang ingin diformat:
```bash
uv run python .agents/skills/fix-footnotes/scripts/fix_footnotes.py format <path_file.md>
```

## Utility Scripts
Skrip pembantu terletak di `.agents/skills/fix-footnotes/scripts/fix_footnotes.py`.

### format
Memformat file Markdown untuk membungkus angka catatan kaki polos dengan tag `<sup>`.

**Contoh Penggunaan:**
```bash
# Simulasi perubahan (dry-run) tanpa menyimpan
uv run python .agents/skills/fix-footnotes/scripts/fix_footnotes.py format brainstorm/research/document.md --dry-run

# Memformat file langsung dan menyimpan perubahan
uv run python .agents/skills/fix-footnotes/scripts/fix_footnotes.py format brainstorm/research/document.md
```

## Rate Limiting
Tidak ada pembatasan kecepatan (rate limits) karena skrip berjalan secara lokal pada berkas sistem.

## Common Mistakes
1. **EMME/2 atau Versi Software Lainnya Terubah**: Skrip ini sudah diprogram agar tidak memformat angka setelah tanda garis miring (slash `/`) untuk mencegah kesalahan format pada nama/versi perangkat lunak.
2. **Tahun Terformat secara Keliru**: Jika ada tahun (misal `1980` atau `1997`) yang tidak diikuti dengan footnote, skrip tidak akan menyentuhnya karena polanya disaring agar mendeteksi minimal 5 digit untuk tahun yang memiliki footnote (misal `19352` -> `1935<sup>2</sup>`).
3. **Mengabaikan Peringatan (Warnings)**: Jika ada angka di luar batas jumlah rujukan N yang menempel pada kata, skrip akan menampilkan warning ke stderr. Pastikan untuk meninjau secara manual jika terdapat peringatan tersebut.
