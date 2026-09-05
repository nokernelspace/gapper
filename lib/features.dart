import 'dart:io';

const GEMINI_ENABLED = false;
const FIREBASE_ENABLED = false;
const NOICE_ENABLED = false;
const VIEW_LOG_AS_SHEET = true;
const SHOW_BOTTOM_NAV = false;
const OFFLINE = true;
const SLIDABLE_EXTENT = 1.0;

/// Assert that certain features are enabled
/// "There is a time and place to do that, but not now" ~Professor Oak
void assertFeatures() {
  // Noice depends on Firebase
  // Firebase does not depend on NoIce
  if (NOICE_ENABLED && !FIREBASE_ENABLED) {
    print("NoIce can only be enabled with Firebase enabled");
    exit(1);
  }

  if (OFFLINE && (FIREBASE_ENABLED || GEMINI_ENABLED)) {
    print("Cannot run in offline mode with Firebase and Gemini");
    exit(1);
  }
}