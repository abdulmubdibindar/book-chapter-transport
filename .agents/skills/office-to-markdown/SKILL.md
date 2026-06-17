---
name: office-to-markdown
description: >-
  Mengonversi file Microsoft Office (.docx, .xlsx, .pptx) menjadi format Markdown menggunakan markitdown.
  Mendukung pemrosesan satu file maupun batch/direktori dengan penanganan error secara graceful.
---

# Office to Markdown Converter

## Overview
Skill ini digunakan untuk mengonversi dokumen Microsoft Office (`.docx`, `.xlsx`, `.pptx`) menjadi format Markdown (`.md`).
Proses konversi memanfaatkan paket Python `markitdown`. Skrip ini mampu memproses satu per satu file atau semua file secara batch dalam sebuah direktori, melanjutkan proses jika terdapat error pada file tertentu, dan memberikan laporan lengkap dalam format JSON.

## Dependencies
- Paket Python `markitdown` harus sudah terinstal di environment lokal.

## Quick Start
Jika pengguna meminta untuk mengonversi folder yang berisi dokumen Word atau Excel:

```bash
uv run .agents/skills/office-to-markdown/scripts/convert_office.py --target "C:\path\ke\direktori" --output "report.json"
```

## Utility Scripts

### `convert_office.py`
Skrip utama yang menangani proses pencarian dan konversi file.

**Argumen yang didukung:**
- `--target` (Wajib): Path absolut ke file tunggal ATAU direktori yang ingin diproses.
- `--output` (Wajib): Path absolut ke file `.json` tempat menulis laporan konversi.
- `--output-dir` (Opsional): Menentukan direktori output untuk file `.md`. Jika tidak diisi, file `.md` disimpan di direktori yang sama dengan file aslinya.
- `--extensions` (Opsional): Daftar ekstensi yang ingin diproses. Default: `.docx,.xlsx,.pptx`.

**Contoh 1: Memproses satu file dengan direktori output khusus**
```bash
uv run .agents/skills/office-to-markdown/scripts/convert_office.py --target "C:\path\ke\dokumen.docx" --output-dir "C:\path\ke\output" --output "report.json"
```

**Contoh 2: Memproses semua presentasi di sebuah folder**
```bash
uv run .agents/skills/office-to-markdown/scripts/convert_office.py --target "C:\path\ke\folder" --extensions ".pptx" --output "report.json"
```

## Rate Limiting
*Not applicable*. Proses konversi dilakukan secara lokal sehingga tidak memerlukan pengelolaan limitasi API.

## Common Mistakes
1. **Lupa memberikan path absolut:** Agen harus selalu menggunakan absolute path untuk `--target`, `--output-dir`, dan `--output`.
2. **Tidak membaca output JSON:** Agen tidak boleh berasumsi semua file berhasil dikonversi. Selalu baca file JSON yang dihasilkan (`--output`) untuk mengetahui file mana yang gagal dikonversi (status "Failed") sebelum memberi tahu pengguna.
