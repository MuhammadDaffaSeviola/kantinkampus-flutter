# AI Agent Instructions — KantinKampus Flutter

## 1. Peran AI

AI bertindak sebagai asisten pengembangan frontend untuk project KantinKampus Flutter.

AI wajib:
- Mengikuti arsitektur MVVM yang digunakan project.
- Memahami struktur project sebelum membuat atau mengubah kode.
- Menjaga separation of concerns antar layer.
- Mengikuti `docs/architecture.md`, `docs/design_tokens.md`, dan `docs/project_guidelines.md` jika relevan.
- Meminta klarifikasi jika instruksi bertentangan dengan aturan project.
- Tidak menempatkan business logic kompleks langsung di widget.

## 2. Stack

Project menggunakan:
- Flutter
- Dart
- MVVM
- HTTP untuk komunikasi dengan REST API.
- Shared Preferences untuk penyimpanan lokal sesuai kebutuhan.
- Material Design.

Jangan menambahkan framework, package, atau library baru tanpa alasan yang jelas dan persetujuan tim.

## 3. Konvensi

- Gunakan struktur folder yang telah ditetapkan project.
- Gunakan PascalCase untuk nama class.
- Gunakan camelCase untuk nama method dan variable.
- Gunakan `const` jika memungkinkan.
- Pisahkan View, ViewModel, Model, dan service.
- Gunakan service untuk komunikasi dengan API.
- Gunakan Model untuk representasi data.
- Gunakan ViewModel untuk state dan business logic presentation.
- Widget bertanggung jawab terhadap tampilan dan interaksi UI.
- Gunakan routing yang konsisten dengan struktur project.
- Ikuti design token pada `docs/design_tokens.md`.
- Hindari duplikasi kode.
- Gunakan format dan kontrak API yang sesuai dengan `docs/api_contract.md`.

## 4. Struktur Folder

Struktur utama project:

```text
lib/
├── app/
│   ├── routes/
│   ├── theme/
│   └── app.dart
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── presentation/
│   ├── viewmodels/
│   ├── views/
│   └── widgets/
├── utils/
│   ├── constants/
│   └── helpers/
└── main.dart
```

AI harus menempatkan file pada folder yang sesuai dan tidak membuat struktur baru tanpa alasan yang jelas.

## 5. Larangan

AI tidak boleh:
- Mengubah arsitektur MVVM tanpa persetujuan tim.
- Menggunakan Riverpod atau framework state management lain tanpa persetujuan tim.
- Menempatkan business logic kompleks langsung di widget.
- Mengakses API langsung dari widget jika seharusnya melalui service.
- Mengubah struktur response API tanpa menyesuaikan API contract.
- Mengubah design system tanpa mengacu pada `docs/design_tokens.md`.
- Menambahkan package baru tanpa alasan dan persetujuan tim.
- Menghapus file atau data project tanpa instruksi yang jelas.
- Membocorkan atau memasukkan credential ke repository.
- Memasukkan file `.env` atau secret ke Git.
- Menggunakan `git push --force` pada branch shared.
- Mengabaikan error atau testing yang gagal.

## 6. Cara Menjawab

Sebelum memberikan solusi atau perubahan kode, AI harus:
1. Memahami permintaan dan konteks project.
2. Memeriksa struktur file yang relevan.
3. Mengacu pada `docs/architecture.md`, `docs/design_tokens.md`, `docs/api_contract.md`, dan `docs/project_guidelines.md` jika relevan.
4. Menjelaskan file yang akan dibuat atau diubah.
5. Mengikuti arsitektur MVVM dan separation of concerns.
6. Tidak membuat business logic di dalam widget secara sembarangan.
7. Memberikan solusi yang sederhana dan konsisten dengan project.
8. Jika instruksi bertentangan dengan aturan project, AI harus menjelaskan konflik dan meminta klarifikasi.
9. Setelah perubahan, menyarankan pengujian yang relevan.

AI harus memprioritaskan konsistensi arsitektur, maintainability, keamanan, dan kesesuaian dengan dokumentasi project.