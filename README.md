# Draggable & Sortable Dock in Flutter
This project demonstrates a draggable and sortable dock, inspired by the macOS dock, where users can drag icons and rearrange them with smooth animations. The dock provides visual feedback when dragging icons and places them in their respective slots when released.

# Features
Draggable Icons: Icons can be dragged and rearranged within the dock.
Slot-based Reordering: Icons automatically shift between slots as they are dragged left or right.
Smooth Animations: Transitions between slots and resizing of icons are animated for a more intuitive user experience.
Dynamic Margin: Icons have dynamic spacing, making the dragged icon stand out visually.
Fully Responsive: The dock layout adjusts based on the number of icons and screen size.
Preview

# Getting Started
To run this project on your local machine, follow these steps:

# Prerequisites
Make sure you have the following installed:

# Flutter SDK
A code editor such as VS Code or Android Studio

#Installation
Clone this repository:
git clone https://github.com/your-username/draggable-dock-flutter.git

# Navigate to the project directory:
cd draggable-dock-flutter

# Install the required dependencies:

flutter pub get

# Run the project:
flutter run

# Usage
- Drag and drop icons within the dock.
- Icons will animate into place when dropped into a new position.
- Code Explanation
- The main logic resides in the DraggableDock widget, which manages the list of icons and handles dragging and sorting.

# Key Components
- DraggableDock: A widget that holds the icons and provides the drag-and-drop functionality.
- Draggable: Wraps each icon to make it draggable.
- DragTarget: Defines where a draggable icon can be dropped and handles reordering.
- _onReorder Method: Reorders the icons when one is dropped into a new position.
- Animations: The AnimatedContainer widget is used to animate the movement
