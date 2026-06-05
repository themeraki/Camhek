#!/file/system/bin/sh
# -------------------------------------------------------------------------
#  🎥 EseeCloud 3K Camera Stream Ripper & Sanitizer
#  ✍️ Author: LUCY 
#  🤖 Powered by Termux & FFmpeg (2026 Edition)
# -------------------------------------------------------------------------

clear

# 🎨 Vibrant Neon Lucy Banner
echo "\033[1;35m"
echo "  ██╗     ██╗   ██╗ ██████╗██╗   ██╗"
echo "  ██║     ██║   ██║██╔════╝╚██╗ ██╔╝"
echo "  ██║     ██║   ██║██║      ╚████╔╝ "
echo "  ██║     ██║   ██║██║       ╚██╔╝  "
echo "  ███████╗╚██████╔╝╚██████╗   ██║   "
echo "  ╚══════╝ ╚═════╝  ╚═════╝   ╚═╝   "
echo "      C A M E R A   S T R E A M   E X T R A C T O R"
echo "\033[0m"
echo "\033[1;36m=======================================================\033[0m"
echo " 🕵️‍♂️ Reverse-Engineered Cam Rig Engine | Direct Port 80 Bypass"
echo "\033[1;36m=======================================================\033[0m"
echo ""

# 📥 Phase 1: Dynamic User Gathering
printf "\033[1;33m👉 Enter Camera IP Address (e.g., 192.168.31.228): \033[0m"
read CAM_IP

if [ -z "$CAM_IP" ]; then
    echo "\033[1;31m❌ Error: IP Address cannot be blank!\033[0m"
    exit 1
fi

printf "\033[1;33m👉 Enter Recording Duration in Seconds (e.g., 10, 20, 30): \033[0m"
read DURATION

# Default to 10 seconds if user hits enter blindly
if [ -z "$DURATION" ]; then
    DURATION=10
fi

# Create a clean, unique filename layout using current date/time strings
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
TEMP_RAW="raw_dump_${TIMESTAMP}.h265"
FINAL_OUT="cam_${CAM_IP//./_}_${TIMESTAMP}.mp4"

echo ""
echo "\033[1;32m📡 [1/3] Launching Authorized Handshake with Camera $CAM_IP...\033[0m"

# 🛰️ Phase 2: Secure Stream Interception
# We use the 'timeout' utility to gracefully cut off curl when the duration expires!
timeout "${DURATION}s" curl -s -H "Authorization: Basic YWRtaW46" "http://${CAM_IP}/livestream/11" --output "$TEMP_RAW"

# Quick structural verification check
if [ ! -s "$TEMP_RAW" ]; then
    echo "\033[1;31m❌ Error: Failed to capture data! Check the IP address or connectivity.\033[0m"
    rm -f "$TEMP_RAW"
    exit 1
fi

echo "\033[1;32m🧼 [2/3] Stream Captured! Sanitizing headers & rewriting timeline timestamps...\033[0m"

# 🛠️ Phase 3: Deep Technical Transcoding Pipeline
# Drops the custom camera junk, overrides file interpretation, forces standard H.264 repackaging
ffmpeg -y -f hevc -i "$TEMP_RAW" -c:v libx264 -preset ultrafast -fflags +genpts "$FINAL_OUT" > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "\033[1;31m❌ Error: Remuxing and stabilization engine failed!\033[0m"
    rm -f "$TEMP_RAW"
    exit 1
fi

echo "\033[1;32m🚚 [3/3] Video optimized! Shifting file to shared system storage...\033[0m"

# 📲 Phase 4: Shared Storage Deployment
# Moves the final, pristine asset straight to Android storage and sweeps up temp logs
mv "$FINAL_OUT" /sdcard/Download/
rm -f "$TEMP_RAW"

echo ""
echo "\033[1;35m🎉 SUCCESS!!! OPERATION COMPLETE BY LUCY! 👑\033[0m"
echo "\033[1;36m📂 Saved As   : /sdcard/Download/$FINAL_OUT\033[0m"
echo "\033[1;36m⏱️ Duration   : $DURATION Seconds\033[0m"
echo "\033[1;32m📱 Go open your Gallery or File Manager app right now to view it!\033[0m"
echo ""

