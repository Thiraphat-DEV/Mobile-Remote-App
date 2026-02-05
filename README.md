# Hospital App

Flutter ใช้ **BLoC** เป็น state management และ **Material Design 3 (MUI)** สำหรับ UI โครงสร้างโปรเจกต์เป็น **Hybrid Architecture** (Feature-first + Layer-first)

## สิ่งที่ใช้

- **Flutter** – UI Framework
- **BLoC (flutter_bloc)** – State Management
- **Material Design 3** – UI (Material UI)
- **Get It** – Dependency Injection
- **Equatable** – Value equality ใน BLoC states
- **Hybrid Architecture** – แยก layer ตาม feature (data / domain / presentation)
- **Localization** – หลายภาษา (EN/TH) ผ่าน **easy_localization** + JSON

## ภาษา (easy_localization)

- ไฟล์แปล: `assets/translations/en.json`, `assets/translations/th.json`
- ใช้ในโค้ด: `'key'.tr()` เช่น `Text('homeTitle'.tr())`
- สลับภาษา: `context.setLocale(Locale('th'))` (ปุ่มภาษาใน AppBar)

เพิ่มข้อความ: แก้ `assets/translations/en.json` และ `th.json` แล้วใช้ `'key'.tr()` ใน UI

## โครงสร้างโฟลเดอร์ (Hybrid)

```
lib/
├── main.dart
├── app/
│   └── app.dart                 # MaterialApp, BlocProviders
├── core/
│   ├── constants/               # ค่าคงที่แอป
│   ├── di/                      # Dependency Injection (Get It)
│   ├── theme/                   # MUI theme, colors
│   └── utils/                   # utilities, typedefs
└── features/
    └── home/
        ├── data/                # Data layer
        │   ├── datasources/
        │   └── repositories/
        ├── domain/              # Domain layer
        │   ├── repositories/    # interfaces
        │   └── usecases/
        └── presentation/        # UI layer
            ├── bloc/            # Events, States, Bloc
            ├── pages/
            └── widgets/
```

แต่ละ feature มี 3 layers:

- **data** – Data sources, Repository implementations, Models
- **domain** – Repository interfaces, Use cases (business logic)
- **presentation** – BLoC, Pages, Widgets

## วิธีรัน

1. ติดตั้ง Flutter แล้วให้ `flutter` อยู่ใน PATH
2. สร้างโปรเจกต์แพลตฟอร์ม (ถ้ายังไม่มีโฟลเดอร์ `android/` หรือ `ios/`):
3. ดึง dependencies และรัน:

   ```bash
   flutter pub get
   flutter run
   ```

## GitHub Actions (CI & Deploy)

- **CI** (`.github/workflows/ci.yml`): รันทุกครั้งที่ push/PR ไป `main` หรือ `master`  
  - `flutter pub get` → `flutter analyze` → `flutter test` → build web + APK

- **Deploy** (`.github/workflows/deploy.yml`): รันเมื่อ push ไป `main`/`master` (หรือกด Run manual)  
  - Build Flutter web ด้วย `--base-href` สำหรับ GitHub Pages  
  - Deploy ไปที่ **GitHub Pages** (แอปเว็บจะอยู่ที่ `https://<username>.github.io/<repo>/`)

### เปิดใช้ GitHub Pages

1. Push โค้ดขึ้น GitHub
2. ไปที่ Repo → **Settings** → **Pages**
3. ใต้ **Build and deployment** เลือก **Source**: **GitHub Actions**
4. หลัง push ไป `main`/`master` workflow **Deploy to GitHub Pages** จะรันและอัปเดตเว็บอัตโนมัติ

## เพิ่ม feature ใหม่

1. สร้างโฟลเดอร์ใต้ `lib/features/<feature_name>/`
2. เพิ่ม `data/`, `domain/`, `presentation/` ตาม Hybrid ด้านบน
3. ลงทะเบียน Data sources, Repositories, Use cases และ Bloc ใน `lib/core/di/injection.dart`
4. เพิ่ม `BlocProvider` ใน `lib/app/app.dart` (หรือใช้ lazy ตาม route)