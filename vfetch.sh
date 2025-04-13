#!/bin/bash

clear ; clear

# Universal variables
Kernel="$(uname -sr)"
Uptime="$(uptime -p | sed 's/up //')"
Shell="$(basename "$SHELL")"
CPU="$(lscpu | grep Model\ name | sed 's/name:\ //' | sed "s/([^)]*)/()/g" | sed 's/[)(]//g')"
GPU="$(glxinfo -B | grep "OpenGL renderer string" | sed 's/.*: \([^/]*\).*/\1/')"
RAM="$(free -h | awk '/^Mem:/ {print $3 " / " $2}')"
OS1="$(lsb_release -si)"
OS="$(lsb_release -sirc)"
Packages="$(pacman -Q | wc -l)"

# colors
c1="\e[31m"  # Red
c2="\e[32m"  # Light Green
c3="\e[33m"  # Yellow
c4="\e[34m"  # Calm Blue
c5="\e[35m"  # Violet
c6="\e[36m"  # Arch Blue
c7="\e[37m"  # White
c8="\e[38m"  # Sky Blue
c9="\e[39m"  # Light Grey
c10="\e[30m" # Dark Grey
c20="\e[0m"  # Normal
                     
echo -e "${c20} ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷"   "   ___           __     __   _               "
echo -e "${c20} ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇"   "  / _ | ________/ /    / /  (_)__  __ ____ __"
echo -e "${c20} ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽"   " / __ |/ __/ __/ _ \  / /__/ / _ \/ // /\ \ /"
echo -e "${c20} ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕"   "/_/ |_/_/  \__/_//_/ /____/_/_//_/\_,_//_\_\ "
echo -e "${c20} ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕"   "             "${c4} ${USER}${c7}@${c4}$(hostnamectl hostname)
echo -e "${c20} ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕"   
echo -e "${c20} ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄"   ${c4} Kernel:   ${c7}$Kernel
echo -e "${c20} ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕"   ${c4} WM:       ${c7}$WM
echo -e "${c20} ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿"   ${c4} Shell:    ${c7}$Shell
echo -e "${c20} ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"   ${c4} Packages: ${c7}$Packages
echo -e "${c20} ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟"   
echo -e "${c20} ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠"   ${c4} CPU:      ${c7}$CPU
echo -e "${c20} ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙"   ${c4} GPU:      ${c7}$GPU
echo -e "${c20} ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣"   ${c4} RAM:      ${c7}$RAM ${c20}  
