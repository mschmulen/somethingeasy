

##Quantified Car Toyota Hackathon HackerDojo App

#####[Marcus Proietti](https://plus.google.com/u/0/111176427003335574517/about)
#####[Junichiro Koyama](https://plus.google.com/u/0/114106978812168949525/about)
#####[Matt Schmulen](https://plus.google.com/u/0/+MattSchmulen/about)

<img src="https://raw.github.com/mschmulen/somethingeasy/master/screenshots/landing-mock.png" alt="mock" width="240">
<img src="https://raw.github.com/mschmulen/somethingeasy/master/screenshots/report-mock.png" alt="mock" width="240">

![image](https://raw.github.com/mschmulen/somethingeasy/master/screenshots/flow.png)


###Issues

- Prefer JSON endpoint
- MIME type "text/html" instead of "application/xml" or "text/xml" in the header. 



####API's in use

Vehicle information

	Odometer unit (km/mile) OdoUnit
	Odometer OdoDst Km or mile
	Vehicle positionModule state
	Quantity of residual - fuel RestFu	Fuel consumption - CnsFu

####Technology in use


- [AFNetworking](http://) 
- [Cocoapods](http://)
- [PNChart](https://github.com/kevinzhow/PNChart)

Podfile file 

```
platform :ios, '7.0'
pod "AFNetworking", "~> 2.0"
pod 'PNChart', '~> 0.1.5'
```





optional technology

	NewAer
	Zapier 
	Pearson API
	Firebase

