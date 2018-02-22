import requests

r = requests.get('http://18.195.21.198/builad/').content
if "HTTP Status 404" not in r:
    print "All Good"
else:
    print "No reponose!"
    exit(9)
