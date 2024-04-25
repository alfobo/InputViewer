# InputViewer

Developed as a way to better understand Godot. The Input Viewer is a simple tool that will display your controller inputs.

## Features:

- Input visualization
- Button timings and analog position
- Chroma key support

Binaries can be found under [released](https://alfobo.itch.io/inputviewer) and [itch.io](https://alfobo.itch.io/inputviewer).

---
## Current state

This software was tested using a 8bitdo Pro2 controller and as such it allowed me to test it with different controller api's and connection types:

### Wired:

- X-Input: When plugged in, it works flawlessly on both Windows 10 and Linux (Fedora 39). 

- D-Input: Works in Windows but the triggers acts as buttons.

- A: Works as intended on both platforms

- Switch: Works similarly to D-input in Linux, analog triggers act as a digital button. On Windows on the other hand... *RAVE!RAVE!RAVE!*

### Bluetooth

- X-Input: Under Linux, there's a problem with the guide button where it goes out of bound and acts as the A button. In windows on the other hand, it does get recognized but not in a long press.

- D-Input: Functions the same to their platform counterparts.

- A: Non-functional

- Switch: Functions the same as when wired under Linux. Under windows, it won't establish any connection.
