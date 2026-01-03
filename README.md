# Flutter UI Examples

Collection of beautiful and functional Flutter UI examples showcasing various design patterns and implementations. Each
example demonstrates modern UI/UX principles with responsive layouts and smooth animations.

## Prerequisites

Before getting started, make sure you have the following installed:

- **Flutter SDK**: >=3.10.0 <4.0.0
- **Dart SDK**: >=3.10.0 <4.0.0
- **IDE**: VSCode or Android Studio with Flutter extensions
- **Platforms**:
    - For iOS: Xcode (macOS only)
    - For Android: Android Studio or Android SDK

## Initial Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd flutter_ui_examples
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate assets

The project uses `flutter_gen` to generate type-safe access to assets:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Assets are automatically compiled, including:

- Images
- SVG vector graphics
- Custom fonts

## Development

### Run the application

```bash
flutter run
```

### Run on specific platform

```bash
# iOS
flutter run -d iPhone

# Android
flutter run -d android
```

### Build for production

```bash
# iOS
flutter build ios

# Android (App Bundle)
flutter build appbundle

# Android (APK)
flutter build apk
```

## Project Structure

```
lib/
├── common/                      # Common utilities and shared code
│   ├── gen/                    # Generated assets (flutter_gen)
│   ├── hooks/                  # Custom Flutter hooks
│   └── menu/                   # Menu navigation
├── ui_adidas_ecommerce/        # Adidas e-commerce UI
│   ├── model/                  # Data models
│   └── widget/                 # UI widgets
├── ui_beer/                    # Beer app UI
│   ├── model/
│   └── widget/
├── ui_furniture/               # Furniture store UI
│   ├── model/
│   └── widget/
├── ui_ice_cream/               # Ice cream shop UI
│   ├── model/
│   └── widget/
├── ui_login/                   # Login screens
│   └── widget/
├── ui_music/                   # Music player UI
│   ├── model/
│   └── widget/
├── ui_on_boarding/             # Onboarding screens
│   ├── model/
│   └── widget/
├── ui_shopping/                # Shopping app UI
│   ├── model/
│   └── widget/
├── ui_sneaky/                  # Sneaker store UI
│   ├── model/
│   └── widget/
├── ui_story/                   # Social media story UI
│   ├── model/
│   └── widget/
├── ui_streaming/               # Video streaming UI
│   ├── model/
│   └── widget/
└── ui_switch/                  # Custom switch widgets
    └── widget/
assets/
├── fonts/                      # Custom fonts
│   ├── AvenirLTStd/
│   ├── MuseoSansCyrl/
│   ├── PoetsenOne/
│   └── Ritts/
├── images/                     # Image assets
│   ├── adidas/
│   ├── beer/
│   ├── furniture/
│   ├── ice_cream/
│   ├── login/
│   ├── music/
│   ├── onboarding/
│   ├── shopping/
│   ├── sneaky/
│   ├── story/
│   └── streaming/
└── svg/                        # SVG vector graphics
    ├── furniture/
    ├── ice_cream/
    ├── login/
    ├── shopping/
    └── story/
```

## UI Examples

### 1. Adidas E-commerce

- **Description**: Modern e-commerce interface inspired by Adidas
- **Features**:
    - Product listing with grid layout
    - Product detail view
    - Shopping cart
    - Custom product cards
    - Smooth page transitions

### 2. Beer App

- **Description**: Craft beer discovery interface
- **Features**:
    - Horizontal scrolling beer cards
    - Detailed beer information
    - Rating system
    - Custom animations
    - Rich visual design

### 3. Furniture Store

- **Description**: Elegant furniture shopping experience
- **Features**:
    - Product catalog with category filtering
    - 3D-like product views
    - Add to cart functionality
    - Clean, minimalist design
    - Vector graphics integration

### 4. Ice Cream Shop

- **Description**: Colorful ice cream ordering interface
- **Features**:
    - Visual flavor selection
    - Custom illustrations
    - Order builder
    - Playful animations
    - Vibrant color scheme

### 5. Login Screens

- **Description**: Collection of modern login designs
- **Features**:
    - Multiple login variations
    - Social media authentication
    - Form validation patterns
    - Smooth transitions
    - Responsive layouts

### 6. Music Player

- **Description**: Feature-rich music player interface
- **Features**:
    - Now playing screen
    - Playlist management
    - Seek bar with circular progress
    - Album artwork display
    - Custom audio controls

### 7. Onboarding Screens

- **Description**: Engaging onboarding experience
- **Features**:
    - Swipeable pages
    - Progress indicators
    - Call-to-action buttons
    - Beautiful illustrations
    - Smooth page transitions

### 8. Shopping App

- **Description**: Modern shopping application interface
- **Features**:
    - Product browsing
    - Search functionality
    - Wishlist/favorites
    - Category navigation
    - Shopping cart

### 9. Sneaker Store (Sneaky)

- **Description**: Premium sneaker shopping experience
- **Features**:
    - Featured sneaker showcase
    - Size selection
    - Color variants
    - Add to bag animation
    - Premium feel design

### 10. Social Story

- **Description**: Instagram-style story viewer
- **Features**:
    - Story progress indicators
    - Swipe gestures
    - Profile information
    - Interactive elements
    - Full-screen media display

### 11. Video Streaming

- **Description**: Netflix-style streaming interface
- **Features**:
    - Content carousel
    - Video thumbnails
    - Category browsing
    - Featured content sections
    - Continue watching

### 12. Custom Switches

- **Description**: Collection of custom switch widgets
- **Features**:
    - Multiple switch styles
    - Smooth animations
    - Custom designs
    - Interactive toggles
    - Reusable components

## Features

### Design Patterns

- **Responsive Layouts**: Adapts to different screen sizes
- **Custom Widgets**: Reusable UI components
- **Animations**: Smooth, native-feeling animations
- **Vector Graphics**: Scalable SVG assets
- **Custom Fonts**: Typography variety with custom fonts
- **Gradient Effects**: Eye-catching gradient implementations

### Technical Highlights

- **Flutter Hooks**: Modern state management
- **Custom Painters**: Advanced drawing capabilities
- **Gesture Handling**: Touch and swipe interactions
- **Page Transitions**: Custom navigation animations
- **Asset Management**: Type-safe asset access with flutter_gen
- **Code Organization**: Feature-based structure

## Main Dependencies

### UI Components

- **circular_seek_bar**: Circular progress/seek bar widget
- **flutter_rating_bar**: Star rating widget
- **simple_gradient_text**: Gradient text effects
- **gap**: Spacing widgets

### Graphics & Design

- **vector_graphics**: Optimized SVG rendering
- **google_fonts**: Google Fonts integration
- **vector_math**: Vector and matrix operations

### Utilities

- **flutter_hooks**: React-like hooks for Flutter
- **uuid**: Unique identifier generation
- **collection**: Enhanced collection utilities

### Dev Dependencies

- **build_runner**: Code generation
- **flutter_gen_runner**: Type-safe asset generation
- **vector_graphics_compiler**: SVG compilation
- **very_good_analysis**: Strict lint rules

## Assets

### Custom Fonts

The project includes several custom font families:

- **AvenirLTStd**: Classic, clean font (Book, Roman, Black weights)
- **PoetsenOne**: Playful, rounded font
- **Ritts**: Cursive, elegant font
- **MuseoSansCyrl**: Modern sans-serif (300, 700 weights)

### Images

Over 100+ high-quality images organized by UI example:

- Product photos
- Background images
- Icons and illustrations
- Profile pictures
- Sample content

### Vector Graphics (SVG)

Optimized SVG assets for:

- Icons
- Illustrations
- Logos
- Decorative elements

All SVGs are compiled to vector graphics format for optimal performance.

## Code Quality

### Run code analysis

The project uses `very_good_analysis` to maintain code quality:

```bash
flutter analyze
```

### Format code

```bash
flutter format .
```

### Generate assets

When adding new assets:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Troubleshooting

### Error: "Flutter SDK not found"

Verify that Flutter is installed correctly and in your PATH:

```bash
flutter doctor
```

### Assets not found

Make sure assets are generated:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### SVG rendering issues

- Verify SVG files are valid
- Check `vector_graphics_compiler` is installed
- Ensure SVG transformers are configured in pubspec.yaml

### Font not loading

- Verify font files exist in assets/fonts/
- Check font family name matches pubspec.yaml
- Run `flutter clean` and rebuild

### Build fails

Clean and rebuild:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Performance Optimization

This project implements several performance optimizations:

- **Vector Graphics**: SVGs compiled to efficient vector format
- **Image Optimization**: Properly sized images for mobile
- **Lazy Loading**: Widgets loaded on demand
- **Const Constructors**: Reduced rebuilds
- **Asset Preloading**: Critical assets loaded early

## Learning Resources

Each UI example demonstrates different Flutter concepts:

- **Layout**: Flex, Stack, Positioned, CustomScrollView
- **Animations**: AnimationController, Tween, Hero
- **Gestures**: GestureDetector, Draggable, Dismissible
- **Custom Painting**: CustomPaint, Canvas operations
- **State Management**: Flutter Hooks, ValueNotifier
- **Navigation**: Navigator 2.0 patterns

## Using These Examples

### As Learning Material

- Study individual UI implementations
- Understand layout patterns
- Learn animation techniques
- Explore gesture handling

### As Starting Points

- Copy and adapt designs for your projects
- Extract reusable widgets
- Use as design inspiration
- Build upon existing patterns

### Best Practices Demonstrated

- Clean code organization
- Reusable components
- Responsive design principles
- Performance considerations

## Contributing

1. Create a branch from `main`
2. Make your changes
3. Run analysis: `flutter analyze`
4. Format code: `flutter format .`
5. Test on multiple devices
6. Create a Pull Request to `main`

## Adding New UI Examples

To add a new UI example:

1. Create a new directory: `lib/ui_example_name/`
2. Add model folder if needed: `lib/ui_example_name/model/`
3. Add widget folder: `lib/ui_example_name/widget/`
4. Create assets folder: `assets/images/example_name/`
5. Add SVG assets if needed: `assets/svg/example_name/`
6. Update pubspec.yaml with new asset paths
7. Run asset generation
8. Add to menu navigation in `lib/common/menu/`

## License

[Include license information here]
