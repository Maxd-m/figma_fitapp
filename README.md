# 💪 Figma FitApp

Una aplicación móvil de fitness y seguimiento de entrenamiento construida con Flutter, basada en el UI Kit de Figma "Fitness App UI Kit for Gym Workout App".

## 📱 Descripción

Figma FitApp es una aplicación moderna de seguimiento de fitness diseñada para ayudarte a alcanzar tus objetivos de salud y bienestar. Con una interfaz intuitiva y amigable, puedes registrar tus entrenamientos, hacer seguimiento de tu progreso y conectar con una comunidad de fitness.

## ✨ Características

- **🔐 Autenticación**: Sistema de login y registro intuitivo
- **🏠 Dashboard Principal**: Interfaz clara con acceso rápido a funcionalidades principales
- **❤️ Panel de Favoritos**: Guarda tus ejercicios y rutinas favoritas
- **👤 Perfil de Usuario**: Personaliza tu información y preferencias
- **📚 Centro de Ayuda**: Acceso a recursos y tutoriales

## 🎨 Diseño

Este proyecto implementa el diseño del [Fitness App UI Kit de Vectorfair en Figma](https://www.figma.com/es-la/comunidad/file/1356281690251535631/fitness-app-ui-kit-for-gym-workout-app-fitness-tracker-mobile-app-gym-fitness-mobile-app-ui-kit), que incluye:

- 93 pantallas profesionales
- Más de 50+ componentes UI personalizables
- Interfaz moderna y limpia
- Excelente experiencia de usuario

## 🗂️ Estructura del Proyecto

```
lib/
├── main.dart              # Punto de entrada de la aplicación
├── screens/               # Pantallas principales
│   ├── splash.dart        # Pantalla de splash
│   ├── login.dart         # Login de usuario
│   ├── signup.dart        # Registro de usuario
│   ├── home.dart          # Dashboard principal
│   ├── profile.dart       # Perfil de usuario
│   ├── favorites.dart     # Pantalla de favoritos
│   └── help.dart          # Centro de ayuda
└── widgets/               # Componentes reutilizables
    ├── app_bottom_bar.dart        # Barra de navegación inferior
    ├── article_card.dart          # Tarjeta de artículo
    ├── favorite_card.dart         # Tarjeta de favorito
    └── recomendation_card.dart    # Tarjeta de recomendación
```

## 🚀 Instalación

### Requisitos Previos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versión 3.0+)
- [Dart SDK](https://dart.dev/get-dart)
- Un editor compatible (VS Code, Android Studio, etc.)

### Pasos de Instalación

1. **Clona el repositorio**

   ```bash
   git clone https://github.com/Maxd-m/figma_fitapp.git
   cd figma_fitapp
   ```

2. **Instala las dependencias**

   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 📦 Dependencias Principales

Revisa el archivo [pubspec.yaml](pubspec.yaml) para ver todas las dependencias del proyecto.

## 🏗️ Desarrollo

### Compilación para Diferentes Plataformas

**Android:**

```bash
flutter build apk --release
```

**iOS:**

```bash
flutter build ios --release
```

**Web:**

```bash
flutter build web
```

## 📚 Recursos Útiles

- [Documentación de Flutter](https://docs.flutter.dev/)
- [Cookbook de Flutter](https://docs.flutter.dev/cookbook)
- [Figma Design Kit](https://www.figma.com/es-la/comunidad/file/1356281690251535631/)

## 📄 Licencia

Este proyecto está basado en el UI Kit de Figma de Vectorfair. Revisa las licencias correspondientes para más información.

## 📧 Contacto

Para preguntas o sugerencias, por favor abre un issue en el repositorio.

---

Hecho con ❤️ para tu fitness
