---
applyTo: "**/*.dart"
---

# KantinKampus Flutter Project Rules

- Ikuti arsitektur MVVM dan separation of concerns.
- Gunakan struktur lib/app, lib/data, lib/presentation, dan lib/utils.
- View bertanggung jawab terhadap UI dan interaksi.
- ViewModel menangani state dan presentation logic.
- Model merepresentasikan data.
- Service menangani komunikasi REST API.
- Jangan menempatkan business logic kompleks langsung di widget.
- Jangan menggunakan Riverpod atau state management lain tanpa persetujuan tim.
- Gunakan package yang sudah tersedia di pubspec.yaml.
- Ikuti docs/architecture.md, docs/design_tokens.md, dan docs/api_contract.md.
- Jangan mengubah API contract atau design system secara sembarangan.
- Jangan memasukkan credential, secret, atau .env ke Git.
- Jangan menggunakan git push --force pada branch shared.
- Jika instruksi bertentangan dengan aturan project, jelaskan konflik dan minta klarifikasi.
- Setelah perubahan kode, sarankan pengujian yang relevan.
