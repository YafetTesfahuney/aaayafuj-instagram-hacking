#!/usr/bin/env python3

import requests
import time
import os

ACCESS_TOKEN = os.getenv("IG_ACCESS_TOKEN")
BUSINESS_ACCOUNT_ID = os.getenv("IG_BUSINESS_ID")

def get_follower_count():
    url = f"https://graph.facebook.com/v17.0/{BUSINESS_ACCOUNT_ID}"
    params = {
        "fields": "followers_count",
        "access_token": ACCESS_TOKEN
    }
    r = requests.get(url, params=params)
    data = r.json()
    print(f"[+] Follower Count: {data.get('followers_count')}")
    return data.get("followers_count")

if __name__ == "__main__":
    while True:
        count = get_follower_count()
        with open("followers.log", "a") as log:
            log.write(f"{int(time.time())},{count}\n")
        time.sleep(3600)  # track hourly
