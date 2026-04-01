import requests
import time

def check(url):
    start = time.time()
    try:
        r = requests.get(url)
        return True, (time.time() - start) * 1000
    except:
        return False, None