#!/usr/bin/env python3

import requests
import os

ACCESS_TOKEN = os.getenv("IG_ACCESS_TOKEN")
BUSINESS_ACCOUNT_ID = os.getenv("IG_BUSINESS_ID")

def get_insights():
    url = f"https://graph.facebook.com/v17.0/{BUSINESS_ACCOUNT_ID}/insights"
    params = {
        "metric": "impressions,reach,profile_views",
        "period": "day",
        "access_token": ACCESS_TOKEN
    }
    r = requests.get(url, params=params)
    if r.ok:
        print("[+] Insights:")
        print(r.json())
    else:
        print("[-] Error:", r.status_code, r.text)

if __name__ == "__main__":
    get_insights()
 _________________________________________________________________________________________________
|💡 Add your IG_ACCESS_TOKEN and IG_BUSINESS_ID to a .env file or export them before running this.|
|_________________________________________________________________________________________________|
