# 📚 Mini Library Tracker

Aplikasi manajemen koleksi buku berbasis web (Flutter Web) yang memungkinkan pengguna menyimpan, mengelola, dan memantau progres bacaan mereka by status. Dibangun untuk memenuhi UAS mata kuliah Aplikasi Mobile Berbasis Web (AMBW).

---

##  Fitur

- **Autentikasi**
  - Sign up dan login menggunakan email dan password.
  - Session disimpan menggunakan `SharedPreferences`.

- **Manajemen Buku**
  - Tambah, edit, dan hapus buku.
  - Setiap buku memiliki status: `Not Read`, `Reading`, atau `Finished`.

- **Filter Buku**
  - Filter koleksi berdasarkan status bacaan.

- **Onboarding / Get Started Screen**
  - Tampil hanya sekali saat pengguna pertama kali membuka aplikasi.

- **Data tersimpan di cloud**
  - Semua data buku tersimpan dan diambil dari Supabase.

---

##  Langkah Instalasi & Build

1. **Clone repositori**
   ```bash
   git clone https://github.com/fhose/uas-ambw-c14220151.git
   cd uas-ambw-c14220151
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Build aplikasi untuk web**
   ```bash
   flutter build web --base-href="/uas-ambw-c14220151/"
   ```
4. **Deploy ke GitHub Pages**
   ```bash
    # 1. Build proyek Flutter ke web
    flutter build web --base-href="/uas-ambw-c14220151/"

    # 2. Masuk ke folder hasil build
    cd build/web

    # 3. Inisialisasi repo Git baru di folder ini 
    git init
    git checkout -b gh-pages

    # 4. Tambahkan remote GitHub (jika belum)
    git remote add origin https://github.com/fhose/uas-ambw-c14220151.git (sesuaikan dengan nama repo masing-masing)

    # 5. Tambahkan dan commit semua file
    git add .
    git commit -m "bebas tulis apa"

    # 6. Push ke branch `gh-pages` (dengan force karena branch ini khusus)
    git push -f origin gh-pages
   ```
---

## Teknologi yang Digunakan

- **Flutter Framework**
- **Supabase** – Backend as a Service untuk autentikasi & database
- **SharedPreferences** – Untuk menyimpan sesi login dan onboarding lokal



