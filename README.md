# Flutter linux

### Dev
```bash
flutter create project
cd ./project
flutter pub get
flutter run -d linux
```

### Build end exec

```bash
cd ./project
flutter build linux --release
ldd build/linux/x64/release/bundle/project
build/linux/x64/release/bundle/project
```
