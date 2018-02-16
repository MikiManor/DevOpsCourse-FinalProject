import requests

r = requests.get('http://18.195.21.198/build/').content
if r in "Welcome to Devops":
    print "All Good"
else:
    print "No reponose!"
    exit(9)
