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
- Paket Python `markitdown` harus sudah terinstal di environment lokal. Skrip [convert_office.py](file:///C:/Users/LENOVO/book-chapter-transport/.agents/skills/office-to-markdown/scripts/convert_office.py) akan mendeteksi secara otomatis dan menginstalnya jika belum ada.
- Sistem pengguna disarankan memiliki `uv` untuk proses instalasi yang lebih cepat. Jika tidak ada `uv`, sistem akan menggunakan fallback `pip` standar.
- Cara menginstal `uv` jika belum tersedia:
  - **Windows (PowerShell)**:
    ```powershell
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    ```
  - **Linux/macOS**:
    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```
- Sistem pengguna sebaiknya memiliki `conda` sebagai _package manager_ Python. Jika belum, peringatkan dulu pengguna untuk menginstalnya.
  - Jika sudah, _environment_ bernama 'markitdown' sudah tersedia. Jika belum, minta izin kepada pengguna untuk menjalankan:
  ```bash
  conda create -n "markitdown" python=3.12
  conda activate markitdown
  ```
  - Instalasi paket `markitdown` di lingkungan tersebut (akan dicoba otomatis oleh skrip menggunakan `uv` jika tersedia, atau `pip` sebagai fallback):
  ```bash
  uv pip install markitdown
  # ATAU jika tanpa uv:
  pip install markitdown
  ```
- Aktifkan _environment_ `markitdown` dan lanjutkan proses di environment tersebut

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
