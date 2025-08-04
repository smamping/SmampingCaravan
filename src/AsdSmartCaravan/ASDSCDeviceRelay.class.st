Class {
	#name : #ASDSCDeviceRelay,
	#superclass : #ASDSCDevice,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #testing }
ASDSCDeviceRelay class >> isAbstract [

	^ self = ASDSCDeviceRelay 
]

{ #category : #voyage }
ASDSCDeviceRelay class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initalize }
ASDSCDeviceRelay >> initialize [

	super initialize.
	
	driver beDigitalOutputOnPin: pinNr
]

{ #category : #testing }
ASDSCDeviceRelay >> isOn [

	deviceValue > 0
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #operations }
ASDSCDeviceRelay >> off [
	deviceValue := 0.
	self setRelayState: deviceValue
]

{ #category : #operations }
ASDSCDeviceRelay >> on [

	deviceValue := 1.
	self setRelayState: deviceValue
]

{ #category : #private }
ASDSCDeviceRelay >> setRelayState: aState [

self driver digitalValue: aState intoPin: pinNr
]
