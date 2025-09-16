Class {
	#name : #ASDSCDeviceRelayLed,
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
ASDSCDeviceRelayLed class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDSCDeviceRelayLed class >> redLed: aRedId greenLed: aGreenId blueLed: aBlueId [

	^ self new
		  pinRed: aRedId;
		  pinGreen: aGreenId;
		pinBlue: aBlueId;
		  yourself
]

{ #category : #accessing }
ASDSCDeviceRelayLed class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Led'
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> color [

	^ color
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> color: anObject [

	color := anObject
]

{ #category : #initalize }
ASDSCDeviceRelayLed >> initialize [

	super initialize.
	self bez: self class type
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinBlue [

	^ pinBlue
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinBlue: anObject [

	pinBlue := anObject
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinGreen [

	^ pinGreen
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinGreen: anObject [

	pinGreen := anObject
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinRed [

	^ pinRed
]

{ #category : #accessing }
ASDSCDeviceRelayLed >> pinRed: anObject [

	pinRed := anObject
]
