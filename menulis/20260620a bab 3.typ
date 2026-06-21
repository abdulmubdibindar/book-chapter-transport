// Simple numbering for non-book documents
#let equation-numbering = "(1)"
#let callout-numbering = "1"
#let subfloat-numbering(n-super, subfloat-idx) = {
  numbering("1a", n-super, subfloat-idx)
}

// Theorem configuration for theorion
// Simple numbering for non-book documents (no heading inheritance)
#let theorem-inherited-levels = 0

// Theorem numbering format (can be overridden by extensions for appendix support)
// This function returns the numbering pattern to use
#let theorem-numbering(loc) = "1.1"

// Default theorem render function
#let theorem-render(prefix: none, title: "", full-title: auto, body) = {
  if full-title != "" and full-title != auto and full-title != none {
    strong[#full-title.]
    h(0.5em)
  }
  body
}
// Some definitions presupposed by pandoc's typst output.
#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let fields = old_block.fields()
  let _ = fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => {
          let subfloat-idx = quartosubfloatcounter.get().first() + 1
          subfloat-numbering(n-super, subfloat-idx)
        })
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => block({
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          })

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let children = old_title_block.body.body.children
  let old_title = if children.len() == 1 {
    children.at(0)  // no icon: title at index 0
  } else {
    children.at(1)  // with icon: title at index 1
  }

  // TODO use custom separator if available
  // Use the figure's counter display which handles chapter-based numbering
  // (when numbering is a function that includes the heading counter)
  let callout_num = it.counter.display(it.numbering)
  let new_title = if empty(old_title) {
    [#kind #callout_num]
  } else {
    [#kind #callout_num: #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block,
    block_with_new_content(
      old_title_block.body,
      if children.len() == 1 {
        new_title  // no icon: just the title
      } else {
        children.at(0) + new_title  // with icon: preserve icon block + new title
      }))

  align(left, block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1)))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt)[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}




#let article(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: none,
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  // Set document metadata for PDF accessibility
  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)
  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
   }

  let has-title-block = title != none or (authors != none and authors != ()) or date != none or abstract != none
  if has-title-block {
    place(
      top,
      float: true,
      scope: "parent",
      clearance: 4mm,
      block(below: 1em, width: 100%)[

        #if title != none {
          align(center, block(inset: 2em)[
            #set par(leading: heading-line-height) if heading-line-height != none
            #set text(font: heading-family) if heading-family != none
            #set text(weight: heading-weight)
            #set text(style: heading-style) if heading-style != "normal"
            #set text(fill: heading-color) if heading-color != black

            #text(size: title-size)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
            #(if subtitle != none {
              parbreak()
              text(size: subtitle-size)[#subtitle]
            })
          ])
        }

        #if authors != none and authors != () {
          let count = authors.len()
          let ncols = calc.min(count, 3)
          grid(
            columns: (1fr,) * ncols,
            row-gutter: 1.5em,
            ..authors.map(author =>
                align(center)[
                  #author.name \
                  #author.affiliation \
                  #author.email
                ]
            )
          )
        }

        #if date != none {
          align(center)[#block(inset: 1em)[
            #date
          ]]
        }

        #if abstract != none {
          block(inset: 2em)[
          #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
          ]
        }
      ]
    )
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  doc
}

#set table(
  inset: 6pt,
  stroke: none
)
#let brand-color = (:)
#let brand-color-background = (:)
#let brand-logo = (:)

#set page(
  paper: "a4",
  margin: (bottom: 3cm,left: 4cm,right: 3cm,top: 3cm,),
  numbering: "1",
  columns: 1,
)

#show: doc => article(
  title: [Perencanaan Transportasi],
  authors: (
    ( name: [Muhammad Abdul Mubdi Bindar],
      affiliation: [],
      email: [] ),
    ),
  font: ("Aptos",),
  heading-family: ("Aptos",),
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

Transportasi merupakan urat nadi utama bagi pergerakan manusia dan barang dalam suatu wilayah. Namun, pergerakan ini tidak dapat dibiarkan tumbuh secara organik tanpa kendali. Pertumbuhan tanpa arah sering kali menimbulkan masalah akut seperti kemacetan parah, pemborosan energi, dan penurunan kualitas lingkungan. Oleh karena itu, perencanaan hadir sebagai intervensi sadar untuk mengelola dan mengarahkan masa depan mobilitas wilayah. Melalui perencanaan yang matang, penyediaan sarana dan prasarana transportasi dapat diselaraskan dengan perkembangan wilayah. Hal ini penting untuk menciptakan pergerakan yang aman, lancar, dan menghemat biaya perjalanan bagi masyarakat.

Untuk memahami bagaimana pergerakan ini terbentuk, kita harus memandang sistem transportasi sebagai suatu kesatuan yang utuh dan kompleks. Transportasi bukanlah sektor tunggal yang berdiri sendiri, melainkan hasil interaksi dinamis antara berbagai elemen wilayah. Menurut konsep dasar yang digagas oleh #cite(<manheim1979fundamentals>, form: "prose"), sistem pergerakan ditentukan oleh hubungan timbal balik yang dinamis antara tiga variabel utama, yaitu Sistem Transportasi (#emph[Transport system] - T), Sistem Aktivitas (#emph[Activity system] - A), dan Pola Aliran pergerakan (#emph[Flow pattern] - F). Hubungan timbal balik ini sering digambarkan dalam diagram T-A-F seperti yang ditunjukkan pada #ref(<fig-manheim>, supplement: [Figure]).

Sistem aktivitas menggambarkan distribusi spasial dari kegiatan manusia seperti kawasan permukiman, industri, pusat perbelanjaan, dan stasiun kereta api. Kegiatan-kegiatan ini memicu kebutuhan perjalanan untuk berpindah tempat. Pola aliran pergerakan kemudian terbentuk ketika masyarakat memanfaatkan sistem transportasi yang tersedia, seperti jaringan jalan raya dan rel kereta api. Interaksi ini bersifat dinamis dan saling memengaruhi secara terus-menerus. Sebagai contoh, pembukaan jalan tol baru akan meningkatkan aksesibilitas suatu wilayah, yang kemudian merangsang pertumbuhan kawasan perumahan baru di sekitar gerbang tol. Pertumbuhan perumahan ini pada gilirannya akan melahirkan pola pergerakan baru yang memadati jaringan jalan tersebut.

Pentingnya melihat transportasi sebagai satu kesatuan sistem juga ditekankan oleh #cite(<hensher2007handbook>, form: "prose"), yang menyatakan bahwa kegagalan perencanaan sering kali disebabkan oleh pendekatan sektoral yang mengabaikan hubungan timbal balik antar-elemen. Lebih jauh lagi, permasalahan transportasi tidak dapat dipisahkan dari aspek ruang, karena ruang merupakan media fisik tempat terjadinya pergerakan tersebut @rodrigue2020geography. Struktur ruang suatu wilayah menentukan ke mana arah pergerakan mengalir, berapa lama waktu tempuh yang dibutuhkan, dan seberapa besar biaya perjalanan yang harus dikeluarkan oleh komuter.

Untuk menyederhanakan hubungan timbal balik yang rumit ini, #cite(<tamin2019perencanaan>, form: "prose") merumuskan Sistem Transportasi Makro. Sistem makro ini membagi interaksi tersebut ke dalam empat subsistem utama yang saling mengunci secara makro, seperti ditunjukkan pada #ref(<fig-tamin>, supplement: [Figure]). Subsistem kegiatan menentukan jenis dan volume pergerakan yang terjadi, subsistem jaringan menyediakan ruang fisik bagi pergerakan tersebut, subsistem pergerakan mengelola aliran kendaraan dan orang, sedangkan subsistem kelembagaan berfungsi sebagai regulator yang mengoordinasikan aturan hukum dan kebijakan penataan wilayah.

#figure([
#box(image("assets/manheim-diagram.drawio.svg"))
], caption: figure.caption(
position: bottom, 
[
Diagram Interaksi T-A-F Manheim (Sumber: diadaptasi dari #cite(<manheim1979fundamentals>, form: "prose"))
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-manheim>


#figure([
#box(image("assets/tamin-diagram.drawio.svg"))
], caption: figure.caption(
position: bottom, 
[
Diagram Sistem Transportasi Makro (Sumber: diadaptasi dari #cite(<tamin2019perencanaan>, form: "prose"))
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-tamin>


= Perencanaan dan Transportasi
<perencanaan-dan-transportasi>
Sebelum menyatukan kedua konsep ini menjadi sebuah disiplin terpadu, kita perlu memahami esensi dari perencanaan dan transportasi secara terpisah. Perencanaan merupakan suatu tindakan rasional yang berorientasi ke masa depan untuk mencapai tujuan tertentu melalui pemanfaatan sumber daya secara efisien. Dalam literatur tata ruang, proses perencanaan sering kali mengikuti kerangka kerja proses perencanaan rasional yang digagas oleh #cite(<anderson1995guidelines>, form: "prose"). Proses ini digambarkan sebagai siklus dinamis sembilan tahap yang berkesinambungan, mulai dari identifikasi masalah wilayah, perumusan tujuan, pengumpulan dan analisis data, penyusunan alternatif rencana, evaluasi dampak, hingga pengelolaan program implementasi dan pemantauan hasil di lapangan. Siklus ini tidak bersifat linier satu arah, melainkan interaktif di mana hasil pemantauan dapat menjadi masukan untuk merevisi tujuan rencana di masa depan.

Berikut adalah gambaran umum dari alur siklus perencanaan tersebut:

Sementara itu, transportasi secara fisik merujuk pada perpindahan orang, barang, dan kendaraan melintasi ruang geografis. Karakteristik utama dari transportasi adalah sifatnya sebagai permintaan turunan (#emph[derived demand]). Konsep ini menjelaskan bahwa perjalanan tidak dilakukan demi perjalanan itu sendiri. Seseorang mengemudikan kendaraan atau naik bus bukan karena ingin berada di jalan raya, melainkan karena perlu melakukan aktivitas sosial-ekonomi di lokasi tujuan, seperti bekerja di kantor, menuntut ilmu di sekolah, atau berbelanja di pasar swalayan. Konsep permintaan turunan ini sangat penting dalam perencanaan, karena implikasinya adalah bahwa cara terbaik untuk mengelola pergerakan adalah dengan mengelola aktivitas guna lahan yang memicu perjalanan tersebut.

Karakteristik permintaan ini juga memengaruhi paradigma pembangunan infrastruktur wilayah. Secara umum, terdapat dua paradigma pembangunan yang dikembangkan oleh para perencana. Paradigma pertama adalah #emph[ship follows the trade], di mana pembangunan infrastruktur transportasi bersifat reaktif untuk memfasilitasi aktivitas ekonomi yang sudah berkembang pesat di suatu kawasan. Paradigma kedua adalah #emph[trade follows the ship], di mana pembangunan infrastruktur transportasi diletakkan secara proaktif sebagai pemicu awal untuk merangsang tumbuhnya pusat-pusat pertumbuhan ekonomi baru di wilayah yang masih tertinggal.

Integrasi antara perencanaan dan transportasi ini diwujudkan melalui proses pengumpulan data yang sistematis sebagai landasan pemodelan pergerakan. Sesuai dengan skala kedalaman analisis geografis yang dijelaskan oleh #cite(<rodrigue2020geography>, form: "prose"), terdapat tiga skala wilayah analisis yang digunakan oleh perencana:

- #strong[Skala Makro (Strategis):] Menganalisis pergerakan skala besar antar-kota atau regional, seperti rencana induk sistem transit cepat metropolitan.
- #strong[Skala Meso (Taktis):] Menganalisis pergerakan pada koridor jalan arteri tertentu atau kawasan khusus seperti pusat bisnis kota.
- #strong[Skala Mikro (Operasional):] Menganalisis manajemen lalu lintas lokal secara mendetail, seperti geometri persimpangan jalan atau optimalisasi waktu lampu lalu lintas.

Untuk mengisi data pada ketiga skala analisis tersebut, perencana mengumpulkan data primer dan sekunder menggunakan berbagai metode survei. Data primer dikumpulkan langsung di lapangan, sementara data sekunder diperoleh dari dokumen lembaga resmi seperti Badan Pusat Statistik (BPS). Berbagai metode pengumpulan data ini dirangkum pada #ref(<tbl-metode-survei>, supplement: [Table]).

#figure([
#table(
  columns: (33.33%, 33.33%, 33.33%),
  align: (left,left,left,),
  table.header([Jenis Survei], [Metode Pengumpulan Data], [Kegunaan Utama dalam Pemodelan],),
  table.hline(),
  [#strong[Pencacahan Lalu Lintas (#emph[Traffic Count])]], [Penghitungan manual atau sensor otomatis volume kendaraan di jalan], [Mengetahui volume lalu lintas aktual (#emph[screening] V/C Ratio)],
  [#strong[Survei Asal-Tujuan (#emph[Origin-Destination])]], [Wawancara tepi jalan, pos kordon, pelacakan plat nomor, atau MPD], [Menyusun matriks asal-tujuan perjalanan antar-TAZ @bps2024mpd],
  [#strong[Survei Wawancara Rumah Tangga (#emph[Household Interview])]], [Kuesioner langsung mengenai profil demografi dan perjalanan keluarga], [Menganalisis bangkitan dan tarikan perjalanan berbasis individu],
  [#strong[Inventarisasi Prasarana]], [Pengukuran lebar jalan, kondisi permukaan, dan jenis sinyal], [Mengestimasi kapasitas jaringan jalan (#emph[supply] sistem)],
  [#strong[Survei Sosio-Ekonomi (Sekunder)]], [Pencatatan data BPS (jumlah penduduk, lapangan kerja, pendapatan)], [Menjadi variabel penjelas dalam regresi bangkitan perjalanan],
)
], caption: figure.caption(
position: top, 
[
Metode Pengumpulan Data dan Survei Perencanaan Transportasi
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-metode-survei>


= Model dalam Transportasi
<model-dalam-transportasi>
Realitas pergerakan di suatu wilayah sangatlah rumit. Kompleksitas ini dipicu oleh ribuan pilihan manusia yang acak (stokastik), interaksi kemacetan fisik di jalan raya, tundaan ruang-waktu, dan keterbatasan kapasitas infrastruktur. Untuk memahami dan merekayasa realitas yang rumit ini, perencana memerlukan model. Model dapat didefinisikan sebagai penyederhanaan dari kondisi nyata wilayah untuk memprediksi dampak dari suatu kebijakan atau pembangunan fisik jalan sebelum dana investasi besar digelontorkan ke lapangan.

Dalam melakukan pemodelan, langkah pertama yang dilakukan adalah membagi wilayah studi secara geografis menjadi beberapa Zona Analisis Lalu Lintas (#emph[Traffic Analysis Zone] - TAZ). Pergerakan perjalanan di dalam dan antar-zona ini direpresentasikan mengalir melalui titik pusat aktivitas (#emph[centroid]) zona, yang terhubung ke jaringan jalan fisik melalui garis konektor virtual.

Pendekatan kuantitatif standar yang paling luas digunakan dalam memproyeksikan arus lalu lintas adalah Model Empat Tahap (#emph[Four-Step Model] - FSM). Prosedur klasik ini membagi analisis pergerakan secara runtut ke dalam empat tahap komputasi yang saling berkaitan. Setiap tahapan diselesaikan menggunakan formulasi matematika esensial seperti dijabarkan pada #ref(<tbl-four-step-model>, supplement: [Table]).

#figure([
#table(
  columns: (25%, 40%, 35%),
  align: (left,left,left,),
  table.header([Tahapan], [Mekanisme Komputasional & Teori], [Variabel Utama & Formulasi Esensial],),
  table.hline(),
  [#strong[Bangkitan & Tarikan (#emph[Trip Generation])]

  ], [Mengukur jumlah perjalanan harian yang diproduksi oleh perumahan atau ditarik oleh tempat kerja di setiap TAZ.

  ], [Variabel: Jumlah penduduk, pekerjaan.

  Formula: $P_i = a + b X_i$

  ],
  [#strong[Distribusi Perjalanan (#emph[Trip Distribution])]

  ], [Menghubungkan produksi dan tarikan perjalanan ke dalam matriks asal-tujuan. Tahap ini bertumpu pada analogi hukum Gravitasi Newton.

  ], [Variabel: Waktu/biaya perjalanan antar-zona.

  Formula: $T_(i j) = A_i P_i B_j D_j f \( C_(i j) \)$

  ],
  [#strong[Pemilihan Moda (#emph[Mode Choice])]

  ], [Menghitung probabilitas komuter memilih kendaraan pribadi atau transportasi umum berdasarkan maksimisasi utilitas acak.

  ], [Variabel: Selisih biaya dan waktu tempuh.

  Formula: $P_m = frac(e^(U_m), sum e^(U_k))$

  ],
  [#strong[Pembebanan Jaringan (#emph[Traffic Assignment])]

  ], [Membebankan perjalanan ke rute jaringan jalan nyata berdasarkan asumsi waktu tempuh terpendek (Ekuilibrium Wardrop).

  ], [Variabel: Rasio volume/kapasitas jalan.

  Formula: $t = t_0 \[ 1 + alpha \( V \/ C \)^beta \]$

  ],
)
], caption: figure.caption(
position: top, 
[
Struktur Komponen Model Empat Tahap Klasik (FSM)
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-four-step-model>


Waktu tempuh aktual di jalan raya sangat dipengaruhi oleh volume lalu lintas ($V$) yang menggunakan jalan tersebut dibanding kapasitas fisiknya ($C$). Hubungan ini diukur melalui rasio volume terhadap kapasitas (#strong[V/C Ratio]) yang ditunjukkan pada formula pembebanan rute BPR di #ref(<tbl-four-step-model>, supplement: [Table]). Peningkatan volume kendaraan akan memperbesar V/C Ratio dan menurunkan kecepatan, yang kemudian menurunkan Tingkat Pelayanan Jalan (#emph[Level of Service] - LOS). LOS jalan diklasifikasikan dari huruf A (sangat lancar) hingga F (kemacetan total di mana arus lalu lintas terhenti). Evaluasi LOS ini menjadi dasar bagi perencana untuk menentukan apakah suatu ruas jalan membutuhkan pelebaran fisik atau manajemen rekayasa lalu lintas baru. Sumber utama teori pemodelan ini bersandar pada konsep yang dikembangkan oleh #cite(<ortuzar2011modelling>, form: "prose") dan #cite(<tamin2019perencanaan>, form: "prose").

= Perkembangan dan Evolusi Model Transportasi
<perkembangan-dan-evolusi-model-transportasi>
Meskipun model empat tahap klasik (FSM) terbukti sangat membantu dalam merancang proyek jalan raya besar selama beberapa dekade, model ini memiliki beberapa kelemahan mendasar. Asumsi sekuensial FSM dinilai terlalu kaku karena memperlakukan setiap tahapan secara terpisah tanpa umpan balik yang terintegrasi secara dinamis. Selain itu, FSM bersifat berbasis perjalanan (#emph[trip-based]) yang mengabaikan hubungan antar-perjalanan yang dilakukan seseorang dalam sehari. Sebagai contoh, FSM gagal merekam pola perjalanan komuter yang mampir ke pasar swalayan atau menjemput anak sekolah dalam perjalanan pulang kantor (#emph[trip chaining]).

Keterbatasan ini mendorong lahirnya evolusi pemodelan menuju pendekatan yang lebih presisi. Pada sisi permintaan, berkembang Model Berbasis Aktivitas (#emph[Activity-Based Modeling] - ABM) yang menyimulasikan perjalanan sebagai kebutuhan yang diturunkan dari rencana aktivitas harian individu secara berkesinambungan. Sementara itu pada sisi suplai, diperkenalkan metode Pembebanan Jaringan Dinamis (#emph[Dynamic Traffic Assignment] - DTA) untuk melacak pergerakan kendaraan secara inkremental dari waktu ke waktu guna mengakomodasi kemacetan yang berubah setiap menit.

Evolusi ini memuncak pada pengembangan pemodelan berbasis agen (#emph[Agent-Based Modeling]) menggunakan kerangka kerja simulasi multi-agen berskala besar seperti #emph[Multi-Agent Transport Simulation] (MATSim). Dalam model MATSim, masyarakat disimulasikan secara diskrit sebagai jutaan "agen" sintetik otonom. Setiap agen memiliki profil demografis dan rencana aktivitas harian sendiri. Agen-agen ini bersaing memperebutkan ruang jalan virtual dalam simulator fisik, lalu memperbarui rencana perjalanan mereka di hari berikutnya untuk menghindari kemacetan berdasarkan fungsi utilitas skor perjalanan mereka. Di Indonesia, model MATSim skala besar telah berhasil dikembangkan untuk wilayah megapolitan Jakarta guna menyimulasikan jutaan agen komuter secara bersamaan dan mengevaluasi dampak kebijakan pembatasan kendaraan secara multimodal @matsim2026jakarta.

Di era terkini, penerapan teknologi pengumpulan data raya (#emph[big data]) dan Kecerdasan Buatan (AI) telah membawa revolusi besar bagi pemodelan transportasi di Indonesia. Sektor swasta memelopori pemanfaatan algoritma AI melalui orkestrasi jutaan perjalanan harian oleh platform #emph[ride-hailing] seperti Gojek dan Grab. Perusahaan ini memanfaatkan model penyesuaian harga dinamis (#emph[dynamic pricing]) berbasis algoritma pembelajaran mesin untuk menyeimbangkan jumlah pengemudi dan permintaan pengguna secara waktu nyata di wilayah perkotaan yang padat.

Pada sektor pelayanan publik, Pemerintah Provinsi DKI Jakarta melalui unit #emph[Jakarta Smart City] telah menerapkan lampu lalu lintas pintar (#emph[Intelligent Traffic Control System] - ITCS) berbasis AI dan IoT di puluhan persimpangan jalan arteri vital @its2025jakarta. Sistem ini memanfaatkan kamera pemantau berbasis #emph[Computer Vision] untuk menghitung volume kendaraan secara otomatis dan mengonfirmasi tingkat kepadatan di setiap lengan persimpangan. Algoritma ITCS kemudian memanipulasi durasi siklus lampu hijau secara adaptif dan terkoordinasi antar-persimpangan, menciptakan aliran "gelombang hijau" yang terbukti meningkatkan kelancaran lalu lintas hingga 15% tanpa memerlukan pelebaran fisik jalan raya.

Selain itu, survei pergerakan konvensional kini mulai digantikan oleh pemodelan geospasial berbasis data posisi ponsel (#emph[Mobile Positioning Data] - MPD) @bps2024mpd. Dengan menganalisis data sinyal seluler pasif secara agregat, otoritas perencana nasional seperti Bappenas dan BPS berhasil memetakan proporsi pergerakan komuter harian secara presisi di sepuluh kawasan metropolitan utama di Indonesia, mulai dari Mebidangro di Sumatera Utara hingga Mamminasata di Sulawesi Selatan. Langkah ini meminimalisasi biaya survei lapangan dan menghasilkan data yang sangat representatif untuk perencanaan pembangunan infrastruktur regional.

= Integrasi Perencanaan Transportasi dan Tata Ruang
<integrasi-perencanaan-transportasi-dan-tata-ruang>
Pemodelan pergerakan pada dasarnya tidak boleh dilepaskan dari perencanaan tata guna lahan. Keduanya saling berinteraksi secara melingkar dalam kerangka hubungan guna lahan dan transportasi (#emph[Land-Use Transport Interaction] - LUTI). Pola pemanfaatan ruang (seperti pembangunan pusat perbelanjaan baru) akan melahirkan bangkitan perjalanan yang memadati jaringan jalan di sekitarnya. Sebaliknya, peningkatan aksesibilitas akibat pembukaan jaringan jalan baru akan menaikkan harga lahan, yang kemudian merangsang pertumbuhan kawasan permukiman baru di sepanjang koridor tersebut.

Di Indonesia, integrasi antara pemodelan transportasi dan penataan ruang telah diatur secara hukum dalam \[\[permen-atrbpn-no-6-tahun-2026\]\]. Regulasi ini mengamanatkan bahwa penyusunan Rencana Tata Ruang Wilayah (RTRW) dan Rencana Detail Tata Ruang (RDTR) di tingkat provinsi, kabupaten, dan kota harus diselaraskan secara ketat dengan pemodelan transportasi makro. Penyelarasan ini diwujudkan dalam dua dimensi utama penataan ruang:

+ #strong[Rencana Struktur Ruang:] Menentukan hierarki jaringan jalan (jalan arteri primer/sekunder, kolektor, lokal) berdasarkan proyeksi V/C Ratio dan LOS jalan di masa depan yang dihasilkan oleh model transportasi. Jalan dengan proyeksi LOS yang buruk harus diintervensi melalui peningkatan kapasitas atau pengalihan rute.
+ #strong[Rencana Pola Ruang:] Mengendalikan kepadatan bangunan dan jenis kegiatan guna lahan agar bangkitan perjalanannya tidak melampaui kapasitas jalan yang tersedia. Regulasi ini juga mendorong penerapan konsep Pembangunan Berorientasi Transit (#emph[Transit-Oriented Development] - TOD) di sekitar simpul-simpul transportasi utama, seperti stasiun LRT, stasiun Commuter Line, dan halte bus rapid transit untuk mereduksi penggunaan kendaraan pribadi.

Tantangan terbesar dalam mewujudkan integrasi tata ruang dan transportasi di Indonesia tak lain adalah fragmentasi kelembagaan. Pembangunan infrastruktur fisik jaringan jalan sering kali dikelola oleh Dirjen Bina Marga di bawah Kementerian Pekerjaan Umum, sementara pengelolaan arus lalu lintas dan sistem angkutan umum berada di bawah Kementerian Perhubungan. Sinkronisasi kebijakan dan koordinasi yang erat antar-instansi ini merupakan prasyarat mutlak untuk menghasilkan ruang wilayah yang teratur, efisien, dan berkelanjutan.

= Penutup/Kesimpulan
<penutupkesimpulan>
Perencanaan transportasi merupakan instrumen strategis yang menjembatani kebutuhan mobilitas masyarakat dengan penataan ruang wilayah yang teratur. Memahami transportasi sebagai sistem makro yang dinamis (T-A-F) memandu perencana dalam mengumpulkan data survei spasial yang akurat. Dari data tersebut, pemodelan empat tahap klasik hingga era simulasi multi-agen berbasis kecerdasan buatan dapat dijalankan dengan baik untuk memproyeksikan pergerakan di masa depan. Pada akhirnya, integrasi yang erat antara pemodelan pergerakan dengan pengendalian guna lahan di bawah naungan regulasi tata ruang adalah kunci utama untuk mewujudkan mobilitas perkotaan yang berkelanjutan. Hal ini sekaligus menjadi fondasi penting sebelum melangkah pada pembahasan mengenai manajemen operasional sistem transportasi yang mencakup manajemen lalu lintas dan penyediaan armada angkutan umum secara lebih teknis.

#bibliography(("references.bib"))

