# Menulis Buku

Bagian ini dijalankan ketika sesi brainstorming sudah selesai. Bagian ini akan menerjemahkan plain text menjadi dokumen Quarto yang utuh sehingga menjadi barang jadi dari buku itu sendiri.

## Teknis Produksi

Saya ingin menggunakan Quarto untuk memproduksi buku ini. Format akhir dokumennya adalah `.docx`.

Ketika menghasilkan teks keluaran, tulis log pengerjaan dalam [log](./log/) dengan format nama `YYYYMMDD-(ringkasan singkat hasil).md`.

## Format Akhir

- Ekstensi `.docx` (Microsoft Word).
- Ukuran kertas A4
- Margin kertas atas, bawah, dalam, dan luar (cm): 3, 3, 4, 3 
- Format bolak-balik (_mirrored_)
- Gaya font: 'Aptos Display' tebal untuk _heading_ dan 'Aptos' untuk isi 

## Gaya Tulisan

Terapkan karakteristik berikut untuk gaya penulisan saya:
1. **Pemilihan Kata yang Lebih Natural dan Membumi**: Menghindari jargon akademis yang berlebihan atau kaku (misalnya mengganti "titik episentrum" menjadi "pusat", dan "efisiensi ekonomi" menjadi "menghemat biaya perjalanan").
2. **Memecah Kalimat Kompleks**: Mengurai kalimat yang terlalu panjang dan padat menjadi beberapa kalimat yang lebih pendek dan ringkas agar alur baca lebih nyaman.
3. **Transisi Kalimat yang Jelas**: Menggunakan frasa penghubung (seperti "Hal ini tercermin dari..." atau "Fenomena ini tak lain adalah...") untuk menjaga kohesi dan kelancaran logika antar kalimat.
4. **Spesifik dan Kontekstual**: Memilih padanan kata yang lebih spesifik sesuai dengan konteks transportasi (misal: "simpul transportasi utama" menjadi "stasiun kereta api").

Secara umum, gaya penulisan yang diharapkan adalah **akademis yang komunikatif dan mengalir**, berfokus pada keterbacaan yang tinggi tanpa mengurangi substansi ilmiah.

Saya akan mendemonstrasikan gaya saya menulis dengan memparafrase tulisan dari model AI seperti berikut:

> [!NOTE]
> ### Sumber AI
> Dinamika urbanisasi di Indonesia telah menempatkan kawasan stasiun kereta api sebagai titik episentrum pertumbuhan ekonomi sekaligus area dengan tekanan spasial yang ekstrem. Fenomena munculnya permukiman padat dengan karakteristik informal atau _slum_ di lahan seluas 5,5 hektar yang berdampingan langsung dengan simpul transportasi utama bukanlah sebuah kebetulan geografis, melainkan hasil dari kebutuhan masyarakat berpenghasilan rendah (MBR) untuk mendekati pusat mobilitas demi efisiensi ekonomi.

> [!NOTE]
> ### Parafrase saya
> Dinamika urbanisasi di Indonesia telah menjadikan kawasan stasiun kereta api sebagai pusat pertumbuhan ekonomi sekaligus kawasan yang memiliki tekanan spasial ekstrem. Hal ini tercermin dari fenomena permukiman padat dengan karakteristik informal atau _slum_ di lahan seluas 5,5 hektar yang berdampingan langsung dengan stasiun kereta api. Fenomena ini tak lain adalah hasil dari kebutuhan masyarakat berpenghasilan rendah (MBR) untuk mendekati pusat mobilitas demi menghemat biaya perjalanan mereka.

### Teknik Penyusunan Paragraf

1. Miringkan setiap istilah asing dari bahasa Indonesia
2. Dalam menuliskan suatu paragraf, jika ada suatu _figure_ (tabel, gambar, blok) yang diacu, saya tidak pernah menunjukkan lokasinya ("di atas" atau "di bawah"), tetapi saya langsung menggunakan cross-referencing (pelajari [`@14-crossref-basic.md`](../how-to-quarto/01-authoring/14-crossref-basic.md) hingga [`@16-crossref-div-syntax.md`](../how-to-quarto/01-authoring/16-crossref-div-syntax.md`) 
3. Saya selalu menempatkan tulisan sebelum _figure_, sehingga penjelasan _figure_ selalu mendahului _figure_ saya.

## Revisi dari Tulisan Akhir

Jika ada revisi terhadap tulisan akhir, masuk lagi ke direktori brainstorming di [brainstorming/CONTEXT.md](../brainstorm/CONTEXT.md)
