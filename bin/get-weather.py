import time, os.path, os, json, urllib2, sys, datetime

# cachefile = 'dasksky-response'
# json_response = None

# if os.path.isfile(cachefile):
# 	if (time.time() - os.path.getmtime(cachefile)) < (60*10):
# 		with open(cachefile, 'r') as f:
# 			json_response = f.read()

# if json_response == None:
# 	response = urllib2.urlopen('https://api.forecast.io/forecast/bb41b186e9a7c98072b55b06d2113553/37.8267,-122.423')
# 	json_response = response.read()
# 	with open(cachefile, 'w') as f:
# 		f.write(json_response)

response = urllib2.urlopen('https://api.forecast.io/forecast/bb41b186e9a7c98072b55b06d2113553/39.937,-75.155')
json_response = response.read()

data = json.loads(json_response)
precipProb = data['daily']['data'][0]['precipProbability']
precipProbStr = str(int(float(precipProb) * 100))


output = " %s%% " % precipProbStr

rainy = [ d['time'] for d in data['hourly']['data'][0:24] if d['precipProbability'] > 0.3 ]

if rainy:
	rainyRange = [datetime.datetime.fromtimestamp(r).strftime("%I%p").lstrip('0').lower() for r in [rainy[0], rainy[-1]]]
	output += "[%s - %s]" % (rainyRange[0], rainyRange[1])

tempMax = int(data['daily']['data'][0]['temperatureMax'])
tempMin = int(data['daily']['data'][0]['temperatureMin'])
curTemp = int(data['currently']['temperature'])

output += " | %sF > %sF > %sF " % (tempMax, curTemp, tempMin)

print output