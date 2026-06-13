Bab 8 dari buku ini berfokus pada "Estimation of Travel Demand Flows" (Estimasi Aliran Permintaan Perjalanan), yang membahas berbagai teknik empiris dan pemodelan untuk mengestimasi permintaan transportasi saat ini maupun memprediksi skenario masa depan. Berikut adalah penjelasan mendalam untuk masing-masing subbabnya:

**8.1 Introduction**
Subbab ini memberikan kerangka kerja bahwa estimasi permintaan perjalanan membutuhkan berbagai sumber informasi dan prosedur statistik. Analisis dapat menggunakan estimasi langsung dari survei, pemodelan disagregat, maupun penggunaan data hitung lalu lintas (*traffic counts*).

**8.2 Direct Estimation of Present Demand**
Subbab ini mengupas cara mengestimasi tingkat permintaan saat ini secara langsung melalui survei pengambilan sampel populasi.
*   **Sampling Surveys:** Mendeskripsikan berbagai strategi survei seperti survei rumah tangga, survei *cordon*, atau wawancara langsung (misalnya *on-board survey*). Strategi statistik yang umum meliputi pengambilan sampel acak sederhana (*simple random sampling*), pengambilan sampel berlapis (*stratified random sampling*), dan *cluster sampling*.
*   **Sampling Estimators:** Membahas rumusan matematika untuk mengekstrapolasi sampel ke seluruh populasi (misalnya untuk memperoleh matriks asal-tujuan atau O-D matrix). Hal ini mencakup penghitungan rata-rata sampel, estimasi varians, standar deviasi, dan ukuran sampel minimum yang diperlukan untuk mencapai presisi tertentu.

**8.3 Disaggregate Estimation of Demand Models**
Membahas proses pengembangan model permintaan berdasarkan survei preferensi yang terungkap (*Revealed Preference* / RP), di mana perilaku pengguna diukur dari pilihan nyata yang mereka buat sehari-hari.
*   **Model Specification:** Tahap awal penentuan struktur fungsi utilitas dan jenis variabel (atribut) yang akan dimasukkan ke dalam model, seperti memilih bentuk logit multinomial dan menentukan konstanta spesifik alternatif (ASA).
*   **Model Calibration:** Proses estimasi parameter model menggunakan teori kemungkinan maksimum (*Maximum Likelihood*). Tujuannya adalah mencari parameter yang membuat probabilitas pilihan yang diobservasi dalam sampel mencapai titik maksimalnya.
*   **Model Validation:** Setelah dikalibrasi, model diuji secara statistik untuk memastikan koefisien yang dihasilkan rasional secara perilaku (seperti rasio nilai waktu / *Value of Time*) serta menggunakan uji-t Student atau statistik uji Rasio Kemungkinan (*Likelihood Ratio*) untuk mengevaluasi kemampuan model dalam mereproduksi data.

**8.4 Disaggregate Estimation of Demand Models with Stated Preference Surveys**
Berbeda dengan RP, survei *Stated Preference* (SP) menggunakan kuesioner eksperimental di mana responden diminta menyatakan preferensinya terhadap skenario pilihan hipotesis. 
*   Pendekatan ini berguna untuk menganalisis alternatif yang saat ini belum beroperasi (misalnya mode transportasi baru) dan mengatasi multikolinearitas yang sering terjadi di data nyata.
*   Fokus pada perancangan eksperimen seperti desain faktorial penuh (*full factorial*) dan faktorial fraksional (*fractional factorial design*), di mana jumlah skenario dikurangi menggunakan blok dan variasi spesifik agar atribut utama tetap dapat dievaluasi secara independen. Subbab ini juga menyoroti pentingnya kalibrasi gabungan RP dan SP untuk mengompensasi kekurangan masing-masing survei.

**8.5 Estimation of O-D Demand Flows Using Traffic Counts**
Fokus pada metode untuk memperbarui atau mengestimasi matriks O-D dengan memanfaatkan data observasi arus lintas di jaringan jalan (*traffic counts*).
*   Ini dianggap sebagai "masalah pembebanan lalu lintas secara terbalik" (*inverse assignment problem*). Analis mencari matriks O-D yang apabila dibebankan ke rute jaringan, akan menghasilkan arus tautan yang paling mendekati arus hasil observasi di lapangan.
*   Model penyelesaian yang digunakan meliputi estimator *Generalized Least Squares* (GLS) dan *Maximum Likelihood* (ML) (dengan asumsi eror terdistribusi Normal atau Poisson), serta estimator Bayesian, yang memformulasikan penyesuaian probabilitas apriori dengan probabilitas teoretis dari hasil hitungan.

**8.6 Aggregate Calibration of Demand Models Using Traffic Counts**
Mengembangkan gagasan di subbab 8.5, subbab ini mengajarkan cara menggunakan *traffic counts* tidak hanya untuk mengestimasi matriks O-D, tetapi untuk mengkalibrasi parameter model permintaan secara langsung.
*   Model diformulasikan untuk menemukan vektor parameter yang menekan perbedaan jarak (secara nonlinier) antara arus yang dihitung di lapangan dengan arus dari penugasan O-D yang dihasilkan oleh model. Pendekatan *NonLinear Generalized Least Squares* (NLGLS) merupakan salah satu metodologi yang paling umum digunakan untuk kasus ini.

**8.7 Estimation of Within-Period Dynamic Demand Flows Using Traffic Counts**
Mengalihkan masalah estimasi O-D dari konteks statis ke konteks dinamis dalam satu periode waktu (bervariasi terhadap waktu).
*   **Simultaneous Estimators:** Melakukan perkiraan permintaan semua matriks interval waktu secara serentak. Walaupun presisi, kebutuhan komputasinya amat berat.
*   **Sequential Estimators:** Melakukan pemecahan masalah dengan mengestimasi permintaan secara iteratif untuk setiap interval secara sekuensial; mengandalkan arus periode waktu sebelumnya yang sudah diperkirakan sebagai variabel tetap.

**8.8 Real-Time Estimation and Prediction of Within-Period Dynamic Demand Flows Using Traffic Counts**
Menangani estimasi permintaan dalam konteks kendali jaringan aktual atau waktu nyata (*real-time*), penting untuk sistem ATIS (*Advanced Traveler Information Systems*). 
*   Alat utamanya adalah *Kalman Filter*. Metode ini menggunakan prosedur estimator rekursif untuk memperbaiki prediksi keadaan (*state variables*) melalui pembobotan antara model teori dan pengukuran lalu lintas terkini. Variabel statusnya dapat berupa aliran O-D itu sendiri maupun selisih/deviasi terhadap arus O-D data historis.

**8.9 Applications of Demand Estimation Methods**
Merupakan penutup dan ringkasan bagaimana metodologi estimasi digunakan berdasarkan fase aplikasinya. 
*   **Estimation of Present Demand:** Pemakaian perpaduan model, survei, atau data lapangan (*counts*) untuk melihat dan menciptakan kerangka kondisi eksisting.
*   **Estimation of Demand Variations (Forecasting):** Penerapan model yang sudah divalidasi ke tata guna lahan atau suplai masa depan (skenario). Cara praktis lainnya adalah teknik *pivoting*, yakni menerapkan prediksi rasio atau perubahan persentase model ke dalam matriks permintaan eksisting sehingga memperkecil risiko kesalahan bawaan dari model.