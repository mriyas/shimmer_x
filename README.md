# ⭐ ShimmerX

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)
![Libraries.io dependency status](https://img.shields.io/librariesio/release/pub/shimmer_animation)
![License](https://img.shields.io/github/license/mriyas/shimmer_animation)

_**Supports Null Safety**_

The **ShimmerXn** widget allows you to easily create elegant skeleton loaders for Flutter apps. Shimmer is widely used as a standard animation effect for loading placeholders across the development community. With a clean and customizable API, you can quickly add beautiful shimmer effects to Android, iOS, and Web apps.

This package helps you focus on building your core functionality while ensuring users experience smooth loading transitions.

---

## 📌 Examples

You can find fully working usage examples in the `example` directory of this repository.

Additional detailed examples are available in this **Examples Repository**:  
🔗 https://github.com/mriyas/shimmer_x/tree/master/example


## 🚀 How to Use

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  shimmer_xn: ^1.0.10
```

Import it in your Dart code:

```dart
import 'package:shimmer_x/shimmer_x.dart';
```

Wrap any widget with a `Shimmer` widget:

```dart
ShimmerX(
  child: Container(
    color: Colors.deepPurple,
  ),
),
```

### 🎛 Customizable Parameters

```dart
ShimmerX(
duration: const Duration(seconds: 3),
interval: const Duration(seconds: 5),
color: Colors.white,
colorOpacity: 0.3,
enabled: true,
direction:  ShimmerDirection.leftToRight,
child: Container(
color: Colors.deepPurple,
),
),
```

---

## 🧩 Parameter Reference

| Parameter | Type | Description | Default |
|----------|------|-------------|---------|
| **child** | `Widget` | The widget on which shimmer is applied | _Required_ |
| **color** | `Color` | Overlay shimmer color | `Colors.white` |
| **colorOpacity** | `double` | Opacity of shimmer overlay | `0.3` |
| **enabled** | `bool` | Turns shimmer animation on/off | `true` |
| **duration** | `Duration` | Animation cycle duration | `Duration(seconds: 3)` |
| **interval** | `Duration` | Delay before repeating animation | `Duration.zero` |
| **direction** | `ShimmerDirection` | Shimmer motion direction | `ShimmerDirection.fromLTRB()` |

---

## 📄 License

This package is available under the **MIT License**.

🔗 https://github.com/mriyas/shimmer_x/blob/master/LICENSE

---

### 💬 Feedback & Contributions

Contributions, issue reports, and feature requests are always welcome!  
If you create your own shimmer examples, feel free to share them in the examples repository.

---

### 🔗 Quick Links

- [Shimmer Animation](#-shimmer-animation)
- [Examples](#-examples)
- [How to Use](#-how-to-use)
- [Parameter Reference](#-parameter-reference)
- [License](#-license)

---

Happy coding! 🚀
