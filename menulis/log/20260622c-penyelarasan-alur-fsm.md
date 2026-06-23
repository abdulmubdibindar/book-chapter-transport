# Log Sesi Pengerjaan: Penyelarasan Alur Subbab FSM
**Tanggal:** Senin, 22 Juni 2026 (16:30 WIB)  
**Versi Output:** `20260622c bab 3.qmd` -> `20260622c bab 3.docx`  
**Penulis:** Antigravity (AI) & Muhammad Abdul Mubdi Bindar  
**Keterangan Sesi:** Penyelarasan alur FSM agar mengalir naratif, tidak kaku dalam format poin-poin  

---

## 1. Latar Belakang & Acuan Kerja
Sesi menulis ini bertujuan menyelaraskan gaya bahasa pada subbab rincian empat tahapan FSM agar terasa lebih mengalir secara naratif (bersifat prosa tebal) dan tidak kaku seperti struktur data teknis (yang sebelumnya berformat poin-poin *fungsi*, *data*, *metode*, dan *keluaran*).

## 2. Poin-poin Perubahan Utama
Berikut adalah rincian modifikasi yang diimplementasikan pada berkas [20260622c bab 3.qmd](file:///C:/Users/LENOVO/book-chapter-transport/menulis/20260622c%20bab%203.qmd):

1. **Paragraf Naratif yang Mengalir:**
   - Mengubah rincian empat subsistem pemodelan (Bangkitan, Distribusi, Pemilihan Moda, Pembebanan Jaringan) menjadi rangkaian paragraf utuh yang saling menyambung (*cohesive text*).
   - Menghubungkan fungsi utama, kebutuhan variabel data primer/sekunder, metode matematika (analisis regresi, model gravitasi, logit multinomial, ekuilibrium Wardrop), dan keluaran (*output* matriks/vektor) secara halus di dalam tubuh paragraf tanpa bullet points.

2. **Kepatuhan Penulisan & EYD:**
   - Mempertahankan penyelarasan istilah asing miring (*trip generation*, *skim matrix*, *category analysis*, dll.).
   - Menjaga kepatuhan aturan ejaan kata depan "di" (seperti *di dalam*, *di mana*, *di atas*).
   - Memastikan tidak ada format yang rusak pada render Quarto.

## 3. Hasil Kompilasi
Perintah eksekusi render:
```powershell
quarto render "20260622c bab 3.qmd" --to docx
```
Kompilasi menghasilkan berkas **`20260622c bab 3.docx`** secara sukses.
