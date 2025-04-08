import requests
import json
import time

# Instagram API credentials (Replace with your credentials)
ACCESS_TOKEN = "your_access_token"
INSTAGRAM_USER_ID = "your_instagram_user_id"  # This is your Instagram business account ID

# Instagram API URLs
BASE_URL = "https://graph.instagram.com"
USER_INFO_URL = f"{BASE_URL}/{INSTAGRAM_USER_ID}?fields=id,username,followers_count,follows_count&access_token={ACCESS_TOKEN}"
FOLLOW_URL = f"{BASE_URL}/{INSTAGRAM_USER_ID}/following"
HASHTAG_URL = f"{BASE_URL}/ig_hashtag_search?user_id={INSTAGRAM_USER_ID}&q=#example_hashtag&access_token={ACCESS_TOKEN}"

# Function to get user info
def get_user_info():
    response = requests.get(USER_INFO_URL)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Failed to get user info: {response.text}")
        return None

# Function to follow a user
def follow_user(user_id):
    follow_url = f"{BASE_URL}/{INSTAGRAM_USER_ID}/follows?access_token={ACCESS_TOKEN}&user_id={user_id}"
    response = requests.post(follow_url)
    if response.status_code == 200:
        print(f"Successfully followed user: {user_id}")
    else:
        print(f"Failed to follow user {user_id}: {response.text}")

# Function to get hashtag suggestions
def get_hashtag_suggestions():
    response = requests.get(HASHTAG_URL)
    if response.status_code == 200:
        hashtags = response.json()
        return hashtags['data']
    else:
        print(f"Failed to get hashtags: {response.text}")
        return []

# Function to like a post (Requires post ID)
def like_post(post_id):
    like_url = f"{BASE_URL}/{post_id}/likes?access_token={ACCESS_TOKEN}"
    response = requests.post(like_url)
    if response.status_code == 200:
        print(f"Successfully liked post: {post_id}")
    else:
        print(f"Failed to like post {post_id}: {response.text}")

# Function to comment on a post (Requires post ID)
def comment_on_post(post_id, comment_text):
    comment_url = f"{BASE_URL}/{post_id}/comments?access_token={ACCESS_TOKEN}"
    data = {'message': comment_text}
    response = requests.post(comment_url, data=data)
    if response.status_code == 200:
        print(f"Successfully commented on post {post_id}: {comment_text}")
    else:
        print(f"Failed to comment on post {post_id}: {response.text}")

# Main function to increase followers
def increase_followers():
    # 1. Get User Information
    user_info = get_user_info()
    if user_info:
        print(f"User Info: {user_info}")
    
    # 2. Get Hashtags suggestions
    hashtags = get_hashtag_suggestions()
    if hashtags:
        print("Hashtags to use:")
        for hashtag in hashtags:
            print(f"#{hashtag['name']}")
    
    # 3. Interact with posts (Example: like and comment)
    example_post_id = 'example_post_id'  # Replace with actual post ID
    like_post(example_post_id)
    comment_on_post(example_post_id, "Great post! #Inspiration")
    
    # 4. Follow users based on interests (e.g., users with common interests)
    follow_user('user_id_to_follow')  # Replace with actual user ID to follow

    # 5. Log actions
    print("Actions completed, now sleeping to avoid rate limit...")
    time.sleep(60 * 5)  # Sleep for 5 minutes to avoid hitting Instagram's rate limits.

if __name__ == "__main__":
    increase_followers()
