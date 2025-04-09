echo "[+] Loading optional OSINT & SQL scanner modules..."

echo " 1. Run IP Inspector"
echo " 2. Run SQLMap (legal testing only)"
read -p "Choose tool (1/2): " choice

if [[ $choice == "1" ]]; then
    read -p "Enter IP: " ip
    python3 ip_inspector.py $ip
elif [[ $choice == "2" ]]; then
    read -p "Enter URL: " url
    ./sqlmap_runner.sh $url
else
    echo "[-] Invalid choice."
fi

