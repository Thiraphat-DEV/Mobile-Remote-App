# Fluter + Bloc App

Flutter ใช้ **BLoC** เป็น state management และ **Material Design 3 (MUI)** สำหรับ UI โครงสร้างโปรเจกต์เป็น **Hybrid Architecture** (Feature-first + Layer-first)

## สิ่งที่ใช้

- **Flutter** – UI Framework
- **BLoC (flutter_bloc)** – State Management
- **Material Design 3** – UI (Material UI)
- **Get It** – Dependency Injection
- **Equatable** – Value equality ใน BLoC states
- **Hybrid Architecture** – แยก layer ตาม feature (data / domain / presentation)
- **Localization** – หลายภาษา (EN/TH) ผ่าน **easy_localization** + JSON

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
## เพิ่ม feature ใหม่

1. สร้างโฟลเดอร์ใต้ `lib/features/<feature_name>/`
2. เพิ่ม `data/`, `domain/`, `presentation/` ตาม Hybrid ด้านบน
3. ลงทะเบียน Data sources, Repositories, Use cases และ Bloc ใน `lib/core/di/injection.dart`
4. เพิ่ม `BlocProvider` ใน `lib/app/app.dart` (หรือใช้ lazy ตาม route)
