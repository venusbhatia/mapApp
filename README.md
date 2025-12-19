# MapApp – iOS Location Explorer

A beautiful and interactive map application built with **SwiftUI** and **MapKit**, allowing users to explore famous landmarks in Paris and Rome with detailed information, images, and smooth navigation.

---

## 📁 Project Structure

```
mapApp/
├── mapApp/
│   ├── Assets.xcassets/          # App icons, images, and assets
│   │   ├── Locations/            # Location-specific images (Paris, Rome)
│   │   └── Logos/                # App logos
│   ├── ContentView.swift         # Main content view
│   ├── mapAppApp.swift           # App entry point
│   ├── Models/
│   │   └── location.swift        # Location data model
│   ├── ViewModels/
│   │   └── LocationsViewModel.swift  # Business logic and state management
│   ├── Views/
│   │   ├── LocationsView.swift              # Main map view
│   │   ├── LocationsListView.swift          # Location list overlay
│   │   ├── LocationDetailView.swift         # Detailed location information
│   │   ├── LocationPreviewView.swift        # Location preview card
│   │   └── LocationMapAnnotationView.swift  # Custom map annotations
│   └── DataServices/
│       └── LocationsDataService.swift       # Location data provider
└── mapApp.xcodeproj/
```

---

## ✨ Features

* 🗺️ **Interactive Map** – Explore locations on a beautiful MapKit interface
* 📍 **Location Annotations** – Custom map markers with smooth animations
* 📋 **Location List** – Toggleable list view to browse all locations
* 🖼️ **Image Galleries** – Multiple images for each landmark
* 📖 **Detailed Information** – Rich descriptions and Wikipedia links
* 🎨 **Smooth Animations** – Elegant transitions between locations
* 🎯 **Location Navigation** – Easy switching between landmarks
* 📱 **Native iOS Design** – Built with SwiftUI best practices

---

## 🏛️ Included Locations

### Rome
* **Colosseum** – Ancient amphitheatre and iconic Roman landmark
* **Pantheon** – Former Roman temple, now a Catholic church
* **Trevi Fountain** – Largest Baroque fountain in Rome

### Paris
* **Eiffel Tower** – Iconic wrought-iron lattice tower
* **Louvre Museum** – World's most-visited museum

---

## ⚙️ Setup Instructions

### 1. Prerequisites

* **Xcode 14.0+** (recommended: latest version)
* **iOS 15.0+** deployment target
* **macOS** for development

### 2. Clone the Repository

```bash
git clone https://github.com/venusbhatia/mapApp.git
cd mapApp
```

### 3. Open in Xcode

```bash
open mapApp.xcodeproj
```

### 4. Build and Run

1. Select your target device or simulator in Xcode
2. Press `⌘ + R` or click the Run button
3. The app will launch on your selected device/simulator

### 5. Build for Release

```bash
# Build for iOS device
xcodebuild -scheme mapApp -configuration Release

# Or use Xcode: Product → Archive
```

---

## 🛠️ Technologies

* **SwiftUI** – Modern declarative UI framework
* **MapKit** – Apple's mapping framework
* **Combine** – Reactive programming for state management
* **MVVM Architecture** – Clean separation of concerns

---

## 🧠 Architecture

The app follows the **MVVM (Model-View-ViewModel)** pattern:

* **Models** (`location.swift`) – Data structures representing locations
* **Views** (`Views/`) – SwiftUI views for UI presentation
* **ViewModels** (`LocationsViewModel.swift`) – Business logic and state management
* **Data Services** (`LocationsDataService.swift`) – Data provisioning layer

---

## 🎨 Design Philosophy

* 🧩 **Clean Architecture** – Separation of concerns with MVVM
* 🎉 **Smooth UX** – Fluid animations and transitions
* 🔁 **Extensible** – Easy to add new locations and features
* 📱 **Native Feel** – Leverages iOS design patterns and conventions

---

## 📝 Key Components

### LocationsViewModel
Manages app state including:
* Current map location
* Map region updates
* Location list visibility
* Navigation between locations

### Location Model
Represents a landmark with:
* Name and city
* Coordinates (latitude/longitude)
* Description
* Image gallery
* Wikipedia link

### Interactive Map
* Custom annotations with tap gestures
* Smooth region transitions
* Visual feedback for selected locations

---

## 🚀 Future Enhancements

Potential features to add:
* Search functionality
* User location tracking
* Favorites/bookmarks
* More cities and landmarks
* Offline map support
* Custom themes
* Social sharing

---

## 📄 License

This project is open source and available for personal and educational use.

---

## 👤 Author

**Venus Bhatia**

Created on December 12-13, 2025

---

## 🙏 Acknowledgments

Built with SwiftUI and MapKit, showcasing modern iOS development practices.

