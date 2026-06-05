# 🎥 EseeCloud Raw HEVC Video Snatcher & Sanitizer

An automated, lightweight network utility designed to run inside **Termux** on Android. This script connects to local **EseeCloud (Port 80)** security cameras, pulls live video streams or historical recordings via custom API endpoints, and uses **FFmpeg** to seamlessly translate raw, proprietary HEVC data into universally compatible H.264 MP4 videos directly onto your phone's storage.

---

## ⚡ Features
* 🛸 **Raw Stream Snatching:** Captures raw camera feeds directly over local network connections using `curl`.
* 🏎️ **Lightning-Fast Processing:** Uses the FFmpeg `-preset ultrafast` engine to parse video packets instantly without draining phone battery.
* 🧼 **Stream Sanitization:** Rebuilds corrupted timestamps using `-fflags +genpts` so videos play perfectly in the Android Gallery.
* 📱 **Termux Native:** Built purely with shell commands and optimized for ARM processors—no root required!

---

## 🛠️ Prerequisites & Installation

Before firing up the scripts, ensure your Termux environment is fully updated and equipped with the necessary network and video decoding libraries.

Open Termux and run the following command to update packages and install dependencies:

```bash
pkg update && pkg upgrade -y
pkg install curl ffmpeg android-tools -y
