# Implementation Plan - Fix AppLifecycleListener Initialization

To keep the `LIFECYCLE` variable as requested, we need to address the lazy initialization behavior and ensure the listener is active from the start.

## Proposed Changes

### [main.dart](file:///Users/lyoko/Projects/flutter-projects/gapper/lib/main.dart)

- **Force Initialization**: In the `main()` function, we will simply reference the `LIFECYCLE` variable. This ensures the top-level `final` object is constructed and registers itself with the Flutter engine.
- **Handling First Launch**: Since `onResume` only fires when returning from the background, I will suggest adding a check in `main()` or `initState` for the "cold start" navigation, while keeping `LIFECYCLE` for subsequent resumes if desired.
- **Refine Navigation**: Ensure the navigation logic uses the `NAVKEY` correctly once the widget tree is ready.

#### [MODIFY] [main.dart](file:///Users/lyoko/Projects/flutter-projects/gapper/lib/main.dart)
- Update `main()` to include `LIFECYCLE;` (or a more explicit initialization).
- (Optional but recommended) Add a check for the API key in `main` to handle the very first navigation before the app even fully renders.

## Verification Plan

### Manual Verification
1. Run the app and check if "YO" prints when minimizing and resuming the app.
2. Confirm that navigation occurs as expected after the 2-second delay on resume.
3. Test if referencing the variable in `main` resolves the "not working" issue.
