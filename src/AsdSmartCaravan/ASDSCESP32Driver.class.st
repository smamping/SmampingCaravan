Class {
	#name : #ASDSCESP32Driver,
	#superclass : #ESP32Driver,
	#instVars : [
		'deviceIp',
		'deviceId'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCESP32Driver class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true

	
]

{ #category : #accessing }
ASDSCESP32Driver >> deviceId [

	^ deviceId
]

{ #category : #accessing }
ASDSCESP32Driver >> deviceId: anObject [

	deviceId := anObject
]

{ #category : #accessing }
ASDSCESP32Driver >> deviceIp [

	^ deviceIp
]

{ #category : #accessing }
ASDSCESP32Driver >> deviceIp: anObject [

	deviceIp := anObject
]

{ #category : #initialization }
ASDSCESP32Driver >> initialize [

	super initialize.
]
