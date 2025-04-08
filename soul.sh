#!/bin/bash

# aaayafuj - soul.sh
# This is the soul of the tool. The digital conscience.
# Must be sourced or run before any critical operation.

clear
echo -e "\033[1;36m"
cat << "EOF"
        ▄▄▄▄▄  ▄▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ 
       █     █ █   █ █     █         █
       █     █ █   █ █     █   ▄▄▄▄▄▄█
       █     █ █   █ █     █  █▄▄▄▄▄ 
       █     █ █   █ █     █▄▄▄▄▄   █
       █     █ █   █ █     █▄▄▄▄▄▄▄ █
       █▄▄▄▄▄█ █▄▄▄█ █▄▄▄▄▄█▄▄▄▄▄▄▄▄▄█

   ✦ aaayafuj Ethical Script Execution ✦

EOF

echo -e "\033[0m"
sleep 1

echo "Welcome to the aaayafuj-instagram-hacking toolkit."
echo ""
echo "💀  WARNING: Power without responsibility is destruction."
echo "🧠  This tool must only be used for authorized, ethical research."
echo ""
echo "📜 By proceeding, you declare that you:"
echo "   - Own or are permitted to test the target systems."
echo "   - Are not using this against individuals or accounts unlawfully."
echo "   - Accept all liability for how this is used."
echo ""
echo "🖋️  Log your intention:"
read -p "   What are you using this tool for today? " purpose
echo ""
read -p "⚖️  Do you agree to use this ethically? (yes/no): " agree

if [[ "$agree" != "yes" ]]; then
    echo "[-] You must agree to the terms to continue. Exiting."
    exit 1
fi

echo "[+] Logging session..."
mkdir -p ~/.aaayafuj/logs
echo "$(date) | Purpose: $purpose" >> ~/.aaayafuj/logs/session.log

echo ""
echo "[+] Soul initialized. May the code walk with honor."
sleep 1
