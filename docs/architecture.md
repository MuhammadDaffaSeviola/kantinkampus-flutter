# Architecture – KantinKampus Flutter

## 1. Overview

KantinKampus menggunakan arsitektur MVVM (Model–View–ViewModel) dengan pemisahan layer untuk menjaga kode tetap terstruktur, mudah dikembangkan, dan mudah dipelihara.

Struktur utama:

- `app` : konfigurasi aplikasi, routing, dan theme.
- `data` : model, datasource, dan repository.
- `presentation` : halaman, view, viewmodel, dan widget UI.
- `utils` : constants dan helper.

## 2. Project Structure

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