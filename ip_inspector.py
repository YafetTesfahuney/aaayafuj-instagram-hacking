#!/usr/bin/env python3

import requests
import sys

def get_ip_info(ip):
    url = f"https://ipapi.co/{ip}/json/"
    try:
        r = requests.get(url)
        if r.ok:
            data = r.json()
            print(f"""
[+] IP Address: {data.get('ip')}
[+] City: {data.get('city')}
[+] Region: {data.get('region')}
[+] Country: {data.get('country_name')}
[+] ISP: {data.get('org')}
[+] Latitude: {data.get('latitude')}
[+] Longitude: {data.get('longitude')}
[+] Timezone: {data.get('timezone')}
""")
        else:
            print("[-] Error: Unable to fetch IP info.")
    except Exception as e:
        print("[-] Exception:", e)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 ip_inspector.py <IP>")
        sys.exit(1)

    ip = sys.argv[1]
    get_ip_info(ip)
