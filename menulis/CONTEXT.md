# Menulis Buku

Bagian ini dijalankan ketika sesi brainstorming sudah selesai. Bagian ini akan menerjemahkan plain text menjadi dokumen Quarto yang utuh sehingga menjadi barang jadi dari buku itu sendiri.

## Penamaan _File_

Setiap _file_ keluaran buku diberi nama berikut, mengikuti penamaan output di [`brainstorm/CONTEXT.md`](../brainstorm/CONTEXT.md) **hanya untuk `YYYYMMDDx`**-nya.

`YYYYMMDDx bab 3.qmd`

Ketika menghasilkan _file_ keluaran, tulis log pengerjaan dalam [log](./log/) dengan format nama `YYYYMMDD-(ringkasan singkat hasil).md`.

## Teknik Produksi

Saya ingin menggunakan Quarto untuk memproduksi buku ini. Format akhir dokumennya adalah `.docx`. Jadi, tolong _render_ file `.qmd` terakhir sebagai file final, dengan format nama yang sama.

Setiap produksi **harus langsung diikuti**  dengan log yang disimpan dalam [`@log`](./log). Format nama file-nya adalah

`YYYYMMDDx-[deskripsi isi].md`

Dengan:

- `YYYYMMDD` adalah tahun bulan tanggal (4-2-2 digit) file dihasilkan
- `x` adalah penguantifikasi file jika dihasilkan dalam satu hari yang sama. Penguantifikasi ini menggunakan huruf: `a`, `b`, `c`, dan seterusnya...
- `[deskripsi isi]` adalah deskripsi singkat dari is log

## Format Akhir

1. Jumlah halaman 5-10 A4 diluar daftar pustaka. jenis font Times New Roman size 12, spasi 1,5.
2. Referensi 10 tahun terakhir berupa buku, jurnal dan prosiding. Jumlah referensi maksimal 15 referensi. Ditulis dengan format APA → _saya akan abaikan_
3. Naskah lengkap + biodata penulis dikirimkan paling lambat 12 Juni 2026 melalui email brizqhamediaqita2@gmail.com (subjek: Transportasi-nama penulis-bab)

## Gaya Tulisan

Terapkan karakteristik berikut untuk gaya penulisan saya:

1. **Pemilihan Kata yang Lebih Natural dan Membumi**: Menghindari jargon akademis yang berlebihan atau kaku (misalnya mengganti "titik episentrum" menjadi "pusat", dan "efisiensi ekonomi" menjadi "menghemat biaya perjalanan").
2. **Memecah Kalimat Kompleks**: Mengurai kalimat yang terlalu panjang dan padat menjadi beberapa kalimat yang lebih pendek dan ringkas agar alur baca lebih nyaman.
3. **Transisi Kalimat yang Jelas**: Menggunakan frasa penghubung (seperti "Hal ini tercermin dari..." atau "Fenomena ini tak lain adalah...") untuk menjaga kohesi dan kelancaran logika antar kalimat.
4. **Spesifik dan Kontekstual**: Memilih padanan kata yang lebih spesifik sesuai dengan konteks transportasi (misal: "simpul transportasi utama" menjadi "stasiun kereta api").

Secara umum, gaya penulisan yang diharapkan adalah **akademis yang komunikatif dan mengalir**, berfokus pada keterbacaan yang tinggi tanpa mengurangi substansi ilmiah.

Saya akan mendemonstrasikan gaya saya menulis dengan memparafrase tulisan dari model AI seperti berikut:

> [!NOTE] **Sumber AI**
> Dinamika urbanisasi di Indonesia telah menempatkan kawasan stasiun kereta api sebagai titik episentrum pertumbuhan ekonomi sekaligus area dengan tekanan spasial yang ekstrem. Fenomena munculnya permukiman padat dengan karakteristik informal atau _slum_ di lahan seluas 5,5 hektar yang berdampingan langsung dengan simpul transportasi utama bukanlah sebuah kebetulan geografis, melainkan hasil dari kebutuhan masyarakat berpenghasilan rendah (MBR) untuk mendekati pusat mobilitas demi efisiensi ekonomi.

> [!NOTE] Parafrase saya
> Dinamika urbanisasi di Indonesia telah menjadikan kawasan stasiun kereta api sebagai pusat pertumbuhan ekonomi sekaligus kawasan yang memiliki tekanan spasial ekstrem. Hal ini tercermin dari fenomena permukiman padat dengan karakteristik informal atau _slum_ di lahan seluas 5,5 hektar yang berdampingan langsung dengan stasiun kereta api. Fenomena ini tak lain adalah hasil dari kebutuhan masyarakat berpenghasilan rendah (MBR) untuk mendekati pusat mobilitas demi menghemat biaya perjalanan mereka.

5. EYD (Ejaan yang disempurnakan): pisahkan 'di' sebagai kata depan dengan kata setelahnya tapi sambung kalau berupa awalan.
   
   > [!WARNING] **Contoh**
>
   > - 'di luar' : ✅
   > - 'diluar' : ❌
   > - 'dimaksud': ✅
   > - 'di maksud': ❌

### Teknik Penyusunan Paragraf

1. Miringkan setiap istilah asing. Contoh: _scaffold_, _benchmark_
2. Dalam menuliskan suatu paragraf, jika ada suatu _figure_ (tabel, gambar, blok) yang diacu, saya tidak pernah menunjukkan lokasinya ("di atas" atau "di bawah"), tetapi saya langsung menggunakan cross-referencing (pelajari [`@14-crossref-basic.md`](../how-to-quarto/01-authoring/14-crossref-basic.md) hingga [`@16-crossref-div-syntax.md`](../how-to-quarto/01-authoring/16-crossref-div-syntax.md`) 
3. Saya selalu menempatkan tulisan sebelum _figure_, sehingga penjelasan _figure_ selalu mendahului _figure_ saya.
4. Selalu tambahkan spasi  antara paragraf dengan butir daftar guna menghindari kesalahan render. Contohnya adala berikut.
   
   ```markdown
   Berikut adalah hobi saya:
   <!-- spasi -->
   - Membaca
   - Berenang
   - Bermain pasel
   - Meminum coklat panas
   ```

### _Figure_

_Figure_ seperti tabel, gambar, dan diagram digunakan untuk menunjang penjelasan teks dan menarik perhatian. Berikut adalah hal-hal yang harus dipatuhi dalam mengolah _figure_:

- Selalu tempatkan _figure_ setelah paragraf, bukan sebaliknya. Jadi, fungsi _figure_ adalah penjelas dari paragraf.
- Untuk _figure_ berupa tabel, _caption_-nya diawali dengan "Tabel" dan ditempatkan di atas tabel. Untuk selain itu, gunakan "Gambar" dan tempatkan di bawah _figure_
- Jika ada ilustrasi yang bisa digunakan dalam [`@brainstorm/assets`](../brainstorm/assets/), pindahkan ke dalam [`@assets`](./assets/) dan inkorporasikan ke teks.
- Jika Anda tidak bisa membuat sendiri _figure_ berupa gambar, cukup tuliskan `<!-- ... -->` dan ganti `...` dengan deskripsi gambar/grafik/ilustrasi yang perlu saya buat

## Revisi dari Tulisan Akhir

Jika ada revisi terhadap tulisan akhir, yakni tulisan terakhir yang dihasilkan dalam direktori ini, baca lagi [CONTEXT.md](../brainstorm/CONTEXT.md) untuk mencari _file_ hasil diskusi/tanggapannya terakhir, pelajari, lalu buat lagi file baru setelahnya.
