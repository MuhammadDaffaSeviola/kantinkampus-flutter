# Project Guidelines — KantinKampus Flutter

## 1. Overview

KantinKampus Flutter merupakan aplikasi frontend yang digunakan untuk mendukung sistem KantinKampus dan berkomunikasi dengan backend Laravel melalui RESTful API.

Project menggunakan arsitektur MVVM dengan pemisahan antara tampilan, state/presentation logic, model, repository, dan service.

Dokumen ini menjadi panduan utama pengembangan Flutter dan digunakan bersama:

- `AGENTS.md`
- `docs/architecture.md`
- `docs/design_tokens.md`
- `docs/api_contract.md`

Tujuan utama project adalah menjaga kode tetap terstruktur, konsisten, mudah diuji, dan mudah dikembangkan oleh seluruh anggota tim.

## 2. Arsitektur Flutter

Project menggunakan pola MVVM dengan separation of concerns.

Struktur utama:

- `app/` untuk konfigurasi aplikasi, routing, dan theme.
- `data/models/` untuk representasi data.
- `data/repositories/` untuk pengelolaan akses data.
- `data/services/` untuk komunikasi dengan REST API.
- `presentation/viewmodels/` untuk state dan business logic pada presentation layer.
- `presentation/views/` untuk halaman atau tampilan aplikasi.
- `presentation/widgets/` untuk komponen UI yang dapat digunakan kembali.
- `utils/constants/` untuk konstanta.
- `utils/helpers/` untuk fungsi bantuan.
- `main.dart` sebagai entry point aplikasi.

Prinsip utama:

- View bertanggung jawab terhadap tampilan dan interaksi pengguna.
- ViewModel menangani state dan presentation logic.
- Model merepresentasikan data.
- Service menangani komunikasi API.
- Repository mengatur akses dan pengelolaan data.
- Business logic tidak ditempatkan langsung di widget.

## 3. Database Summary

Flutter tidak mengelola struktur database server secara langsung.

Data aplikasi diperoleh melalui RESTful API yang disediakan oleh backend Laravel.

Struktur data dan relasi yang digunakan oleh aplikasi harus mengikuti kontrak API dan dokumentasi project.

Dokumen yang menjadi acuan:

- `docs/api_contract.md`
- `docs/architecture.md`

Perubahan struktur data yang memengaruhi Flutter harus dikomunikasikan dengan tim backend agar model dan API tetap konsisten.

## 4. API Summary

Flutter berkomunikasi dengan backend KantinKampus menggunakan RESTful API.

Ketentuan:

- Komunikasi API dilakukan melalui service.
- Widget tidak melakukan request API secara langsung jika seharusnya melalui service.
- Format endpoint mengikuti `docs/api_contract.md`.
- HTTP method harus sesuai dengan API contract.
- Request dan response harus mengikuti format yang telah ditentukan.
- Model digunakan untuk merepresentasikan response API.
- Error API harus ditangani dengan baik pada layer yang sesuai.
- Perubahan endpoint atau format response harus disepakati dengan tim backend.

HTTP communication menggunakan package `http` sesuai konfigurasi project.

## 5. Design System

Tampilan aplikasi harus mengikuti design system yang telah ditetapkan project.

Sumber utama design system:

`docs/design_tokens.md`

Ketentuan:

- Gunakan token warna yang telah ditentukan.
- Gunakan typography sesuai design tokens.
- Gunakan spacing yang konsisten.
- Gunakan komponen UI yang dapat digunakan kembali.
- Hindari membuat nilai visual yang berbeda-beda tanpa alasan.
- Perubahan design system harus mengacu pada dokumentasi project.
- Jangan mengubah design system secara sembarangan.

Theme dan konfigurasi tampilan utama ditempatkan pada:

`lib/app/theme/`

## 6. Code Review Checklist

Sebelum perubahan di-merge, reviewer memeriksa:

- [ ] Struktur file sesuai arsitektur MVVM.
- [ ] View hanya menangani tampilan dan interaksi.
- [ ] Business logic presentation berada pada ViewModel.
- [ ] Model digunakan untuk representasi data.
- [ ] Komunikasi API dilakukan melalui service.
- [ ] Repository digunakan sesuai kebutuhan akses data.
- [ ] Routing mengikuti struktur project.
- [ ] Design system mengikuti `docs/design_tokens.md`.
- [ ] API mengikuti `docs/api_contract.md`.
- [ ] Tidak ada credential atau secret di repository.
- [ ] Tidak ada file `.env` yang di-commit.
- [ ] Tidak menambahkan package tanpa alasan dan persetujuan tim.
- [ ] Tidak ada perubahan yang tidak berkaitan dengan fitur.
- [ ] Testing atau verifikasi yang relevan telah dilakukan.
- [ ] Kode tidak mengandung business logic kompleks di widget.

## 7. Rules untuk AI

AI harus:

- Membaca `AGENTS.md` sebelum memberikan perubahan kode.
- Mengacu pada `docs/architecture.md`.
- Mengacu pada `docs/design_tokens.md` untuk kebutuhan UI.
- Mengacu pada `docs/api_contract.md` untuk kebutuhan API.
- Mengacu pada `docs/project_guidelines.md` jika relevan.
- Memahami struktur file sebelum membuat atau mengubah kode.
- Menempatkan file pada layer yang sesuai.
- Mempertahankan arsitektur MVVM.
- Menjaga separation of concerns.
- Menjelaskan file yang akan dibuat atau diubah.
- Menyarankan pengujian setelah perubahan.

AI tidak boleh:

- Mengubah arsitektur MVVM tanpa persetujuan tim.
- Menggunakan Riverpod atau state management lain tanpa persetujuan tim.
- Menempatkan business logic kompleks langsung di widget.
- Mengakses API langsung dari widget jika seharusnya melalui service.
- Mengubah API contract secara diam-diam.
- Mengubah design system tanpa mengacu pada `docs/design_tokens.md`.
- Menambahkan package baru tanpa alasan dan persetujuan.
- Menghapus file atau data tanpa instruksi yang jelas.
- Memasukkan credential, secret, atau `.env` ke Git.
- Menggunakan `git push --force` pada branch shared.

## 8. Git Workflow

Pengembangan dilakukan menggunakan branch agar `main` tetap stabil.

Struktur branch:

```text
main
└── dev
    ├── feature/[nama]
    ├── fix/[nama]
    └── docs/[nama]
```

Aturan:

1. Jangan bekerja langsung pada `main`.
2. Buat branch dari `dev` untuk perubahan.
3. Gunakan Conventional Commits.
4. Push branch ke repository.
5. Buat Pull Request menuju `dev`.
6. Pull Request harus direview anggota lain.
7. Setelah disetujui, perubahan dapat di-merge.
8. Perubahan yang sudah dipush dibatalkan menggunakan `git revert` jika diperlukan.
9. Jangan menggunakan `git push --force` pada branch shared.

Contoh commit:

```text
feat(menu): add menu screen
fix(order): fix order state
docs(api): update API documentation
test(menu): add menu test
```

## Referensi Proyek

Dokumen yang menjadi acuan pengembangan:

- `AGENTS.md`
- `docs/architecture.md`
- `docs/design_tokens.md`
- `docs/api_contract.md`
- `docs/project_guidelines.md`