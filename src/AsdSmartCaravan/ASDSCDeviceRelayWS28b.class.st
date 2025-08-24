Class {
	#name : #ASDSCDeviceRelayWS28b,
	#superclass : #ASDSCDeviceRelay,
	#instVars : [
		'pinRed',
		'pinGreen',
		'pinBlue',
		'color'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceRelayWS28b class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDSCDeviceRelayWS28b class >> redLed: aRedId greenLed: aGreenId blueLed: aBlueId [

	^ self new
		  pinRed: aRedId;
		  pinGreen: aGreenId;
		pinBlue: aBlueId;
		  yourself
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'SchalterLicht'
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> color [

	^ color
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> color: anObject [

	color := anObject
]

{ #category : #initalize }
ASDSCDeviceRelayWS28b >> initialize [

	super initialize.
	
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinBlue [

	^ pinBlue
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinBlue: anObject [

	pinBlue := anObject
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinGreen [

	^ pinGreen
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinGreen: anObject [

	pinGreen := anObject
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinRed [

	^ pinRed
]

{ #category : #accessing }
ASDSCDeviceRelayWS28b >> pinRed: anObject [

	pinRed := anObject
]
