# _Brainstorm_ Isi Bab Buku

## Ikhtisar
_File_ ini berisi arahan dalam membantu saya, dosen Perencanaan Wilayah dan Kota Institut Teknologi Sumatera (ITERA), untuk menuntaskan _book chapter_ tentang Perencanaan Transportasi. Bagian ini akan menghasilkan sebuah dokumen Markdown mentah yang nanti akan diproses menjadi sebuah draft final dalam sesi menulis (`@../menulis`).

## Isi Direktori

```text
book-chapter-transport
└── brainstorm
    ├── CONTEXT.md         → konteks dan arahan untuk sesi brainstorming ini
    ├── overview-bab-buku.md → gambaran umum isi bab buku (sering berubah)
    ├── assets             → aset visual (gambar, diagram SVG, dsb.)
    │   ├── Pasted image 20260612230823.png
    │   ├── manheim-diagram.drawio.svg
    │   └── tamin-diagram.drawio.svg
    ├── books              → catatan dan ringkasan buku-buku referensi
    │   ├── @anderson1995guidelines.md
    │   ├── @fricker2004fundamentals.md  → catatan buku Fricker & Whitford (2004)
    │   ├── @manheim1979fundamentals.md
    │   ├── cascetta        → catatan per-bab dari Cascetta (2009)
    │   ├── hensher-button  → catatan per-bab dari Hensher & Button (2007)
    │   ├── pdf             → file PDF buku-buku referensi
    │   └── tamin           → catatan per-bab dari Tamin (2019)
    ├── legals             → dokumen aturan dan legal
    │   ├── permen-atrbpn-no-6-tahun-2026.md
    │   └── permen-atrbpn-no-6-tahun-2026.pdf
    ├── output             → hasil brainstorming
    └── pptx               → salindia (slide) presentasi referensi
        ├── 1_Sistem Transportasi Total.md
        └── 1_Sistem Transportasi Total.pptx
```

## Hasil Brainstorming
- 2026-06-17: [[20260617 diskusi isi bab]]
## Gambaran Umum isi Buku
Perumusan isi buku ada di `@overview-bab-buku.md`. Ingat bahwa ini adalah sesi _brainstorming_, sehingga isi `@overview-bab-buku.md` akan sangat sering berubah.

## Figur (Gambar, Tabel, Grafik)
Pikirkan apa ilustrasi yang cocok untuk memperjelas suatu paragraf. Berikan deskripsi figur yang pas di dalam sintaks komentar `<!--  -->` agar saya bisa mengusahakannya sendiri.

## Referensi Literatur
Saya menggunakan sumber-sumber yang langsung berada di dalam direktori ini (`@brainstorm`). Sumber-sumber tersebut dapat berupa:

- buku → `@books`
- aset-aset berupa gambar, tabel, dataset, dan sejenisnya → `@assets`
- dokumen aturan dan legal → `@legals`
- salindia (_slide_) presentasi → `@pptx`
- ...(akan ditambahkan kemudian)

### Buku-buku
Berikut adalah _textbook-textbook_ yang saya gunakan dalam penulisan _book chapter_ ini.

#### [[@hensher2007handbook]]

```bibtex
@book{hensher2007handbook,
  title={Handbook of Transport Modelling},
  author={Hensher, D.A. and Button, K.J. and Button, K.},
  isbn={9780080453767},
  lccn={01371524},
  series={Handbook of Transport Modelling},
  url={https://books.google.co.id/books?id=oYMgAQAAMAAJ},
  year={2007},
publisher={Emerald Group Publishing Limited}
}
```

#### [[@manheim1979fundamentals]]

```bibtex
@book{manheim1979fundamentals,
  title={Fundamentals of Transportation Systems Analysis: Basic Concepts},
  author={Manheim, M.L.},
  number={v. 1},
  isbn={9780262632898},
  series={MIT Press Classic},
  url={https://books.google.co.id/books?id=5jplswEACAAJ},
  year={1979},
  publisher={MIT Press}
}

```

#### [[@anderson1995guidelines]]

```bibtex
@book{anderson1995guidelines,
  title={Guidelines for Preparing Urban Plans},
  author={Anderson, L.T.},
  isbn={9781884829079},
  lccn={94077951},
  url={https://books.google.co.id/books?id=bdaAswEACAAJ},
  year={1995},
  publisher={Planners Press, American Planning Association}
}

```

#### [[@cascetta2009transportation]]

```bibtex
@book{cascetta2009transportation,
  title={Transportation Systems Analysis: Models and Applications},
  author={Cascetta, E.},
  isbn={9780387758572},
  lccn={2009926028},
  series={Springer Optimization and Its Applications},
  url={https://books.google.co.uk/books?id=AbU69bKmVScC},
  year={2009},
  publisher={Springer US}
}
```

#### [[@tamin2019perencanaan]]

```bibtex
@book{tamin2019perencanaan,
  title={Perencanaan, pemodelan, dan rekayasa transportasi: teori, contoh soal, dan aplikasi},
  author={Tamin, O.Z.},
  editor={Warsidi, E.},
  year={2019},
  publisher={ITB Press},
  address={Bandung}
}
```

#### [[@fricker2004fundamentals]]

```bibtex
@book{fricker2004fundamentals,
  title={Fundamentals of Transportation Engineering: A Multimodal Systems Approach},
  author={Fricker, J.D. and Whitford, R.K.},
  isbn={9780130351241},
  url={https://books.google.co.id/books/about/Fundamentals_of_Transportation_Engineeri.html?id=MYMnAQAAMAAJ&redir_esc=y},
  year={2004},
  publisher={Pearson Prentice Hall}
}
```