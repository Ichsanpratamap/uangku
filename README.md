# 💰 UangKu

Aplikasi **UangKu** merupakan aplikasi manajemen keuangan pribadi berbasis **Flutter** yang dirancang untuk membantu pengguna mencatat, memantau, dan mengelola pemasukan serta pengeluaran secara digital, praktis, dan real-time.

Aplikasi ini dikembangkan sebagai bagian dari **laporan/tugas Pemrograman Mobile**, dengan menerapkan konsep state management, database cloud, dan arsitektur aplikasi modern.

---

## 🎯 Tujuan Aplikasi

Tujuan utama dari pengembangan aplikasi **UangKu** adalah:

* Membantu pengguna mencatat transaksi keuangan harian
* Menampilkan saldo secara otomatis berdasarkan pemasukan dan pengeluaran
* Menerapkan konsep CRUD (Create, Read, Update, Delete)
* Mengintegrasikan Flutter dengan Firebase
* Menerapkan state management menggunakan Riverpod

---

## 🚀 Fitur Utama

* 📥 Pencatatan transaksi pemasukan
* 📤 Pencatatan transaksi pengeluaran
* 🕒 Penyimpanan tanggal dan waktu transaksi
* ✏️ Edit dan 🗑️ hapus transaksi
* 📊 Perhitungan saldo otomatis
* 🔄 Sinkronisasi data real-time dengan Firebase Firestore
* 🎨 Antarmuka sederhana dan responsif

---

## 🛠️ Teknologi yang Digunakan

* **Flutter** (Framework UI)
* **Dart** (Bahasa Pemrograman)
* **Firebase Firestore** (Database NoSQL)
* **Firebase Core**
* **Flutter Riverpod** (State Management)
* **Material Design**

---

## 🗂️ Struktur Folder Utama

```
lib/
├── core/
│   └── theme/
├── models/
├── providers/
├── routes/
├── screens/
│   ├── splash/
│   ├── home/
│   └── add_transaction/
├── services/
├── widgets/
└── main.dart
```

---

## 🔄 Alur Aplikasi

1. Aplikasi dibuka → **Splash Screen**
2. Otomatis berpindah ke **Home Screen**
3. Pengguna menambahkan transaksi melalui tombol `+`
4. Data disimpan ke **Firebase Firestore**
5. Setelah disimpan, aplikasi kembali ke Home Screen
6. Saldo dan daftar transaksi diperbarui secara real-time

---

## 📦 Manajemen Versi Aplikasi

Aplikasi ini menggunakan sistem versioning Flutter dengan format:

```
MAJOR.MINOR.PATCH+BUILD
```

### Riwayat Versi

* **v1.0.0+1**

  * Inisialisasi proyek Flutter
  * Implementasi Splash Screen
  * Integrasi Firebase Firestore
  * CRUD transaksi keuangan

* **v1.0.1+2**

  * Perbaikan navigasi aplikasi
  * Penambahan tanggal dan jam transaksi
  * Perbaikan konfigurasi `pubspec.yaml`

---

## ▶️ Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terpasang
2. Jalankan perintah berikut di terminal:

```
flutter pub get
flutter run
```

3. Gunakan emulator atau perangkat Android

---

## 📚 Penutup

Dengan adanya aplikasi **UangKu**, diharapkan pengguna dapat lebih mudah dalam mengelola keuangan pribadi secara digital. Aplikasi ini juga menjadi sarana penerapan teori pemrograman mobile, arsitektur aplikasi, serta integrasi layanan cloud dalam pengembangan aplikasi modern.

---

✍️ **Dikembangkan oleh:** Ichsan Pratama P

# uangku

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
