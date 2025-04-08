#!/usr/bin/env python3

import requests
import os
from time import sleep

ACCESS_TOKEN = os.getenv("IG_ACCESS_TOKEN")
BUSINESS_ACCOUNT_ID = os.getenv("IG_BUSINESS_ID")
IMAGE_URL = "https://your-image-url.jpg"
CAPTION = "This is your caption. #aaayafuj"

def create_media_object():
    url = f"https://graph.facebook.com/v17.0/{BUSINESS_ACCOUNT_ID}/media"
    payload = {
        "image_url": IMAGE_URL,
        "caption": CAPTION,
        "access_token": ACCESS_TOKEN
    }
    r = requests.post(url, data=payload)
    return r.json().get("id")

def publish_media(media_id):
    url = f"https://graph.facebook.com/v17.0/{BUSINESS_ACCOUNT_ID}/media_publish"
    payload = {
        "creation_id": media_id,
        "access_token": ACCESS_TOKEN
    }
    r = requests.post(url, data=payload)
    return r.json()

if __name__ == "__main__":
    media_id = create_media_object()
    print(f"[+] Media Created: {media_id}")
    sleep(5)
    result = publish_media(media_id)
    print("[+] Publish Result:", result)
