Class {
	#name : 'ASDSCDeviceRelay',
	#superclass : 'ASDSCDevice',
	#instVars : [
		'pinStatus',
		'type'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceRelay class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceRelay class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Relay'
]

{ #category : 'initalize' }
ASDSCDeviceRelay >> initialize [

	super initialize.
	self bez: self class type.
	self devMode ifFalse: [ self driver beDigitalOutputOnPin: pinNr ]
]

{ #category : 'testing' }
ASDSCDeviceRelay >> isOn [

	deviceValue > 0
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : 'operations' }
ASDSCDeviceRelay >> off [
	deviceValue := 0.
	self setRelayState: deviceValue
]

{ #category : 'operations' }
ASDSCDeviceRelay >> on [

	deviceValue := 1.
	self setRelayState: deviceValue
]

{ #category : 'accessing' }
ASDSCDeviceRelay >> pinStatus [

	^ pinStatus
]

{ #category : 'accessing' }
ASDSCDeviceRelay >> pinStatus: anObject [

	pinStatus := anObject
]

{ #category : 'private' }
ASDSCDeviceRelay >> setRelayState: aState [

pinStatus < 1 ifTrue: [
	self driver beDigitalOutputOnPin: pinNr.
	pinStatus := 1.
	  ]. 
self driver digitalValue: aState intoPin: pinNr
]

{ #category : 'accessing' }
ASDSCDeviceRelay >> type [

	^ type
]

{ #category : 'accessing' }
ASDSCDeviceRelay >> type: anObject [

	type := anObject
]
