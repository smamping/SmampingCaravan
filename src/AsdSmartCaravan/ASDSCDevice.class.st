Class {
	#name : 'ASDSCDevice',
	#superclass : 'Object',
	#instVars : [
		'pinNr',
		'deviceValue',
		'displayValue',
		'devMode',
		'driver',
		'bez',
		'deviceArt'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'instance creation' }
ASDSCDevice class >> driver: anObject pinNr: aNumber [
^ self new
		driver: anObject;
		pinNr: aNumber;
	
		yourself
]

{ #category : 'testing' }
ASDSCDevice class >> isAbstract [

	^ self = ASDSCDevice
]

{ #category : 'voyage' }
ASDSCDevice class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDevice class >> type [

	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
ASDSCDevice class >> types [
	^ OrderedCollection
		newFrom:
			{'Licht' . 'Heizung' . 'Termostat' . 'Wassertank' . 'BatterieStand'.
			'GasStand'}
]

{ #category : 'accessing' }
ASDSCDevice >> bez [

	^ bez
]

{ #category : 'accessing' }
ASDSCDevice >> bez: anObject [

	bez := anObject
]

{ #category : 'accessing' }
ASDSCDevice >> devMode [

	^ devMode
]

{ #category : 'accessing' }
ASDSCDevice >> deviceArt [

	^ deviceArt
]

{ #category : 'accessing' }
ASDSCDevice >> deviceArt: anObject [

	deviceArt := anObject
]

{ #category : 'accessing' }
ASDSCDevice >> deviceValue [

	^ deviceValue
]

{ #category : 'accessing' }
ASDSCDevice >> displayValue [

	^ displayValue
]

{ #category : 'accessing' }
ASDSCDevice >> driver [

	^ driver
]

{ #category : 'accessing' }
ASDSCDevice >> driver: anObject [

	driver := anObject
]

{ #category : 'initalize' }
ASDSCDevice >> initialize [

	super initialize.
	deviceValue := 0.
	displayValue := 'Aus'.
	devMode := true.
	
	"self driver: self module driver "
]

{ #category : 'accessing' }
ASDSCDevice >> pinNr [

	^ pinNr
]

{ #category : 'accessing' }
ASDSCDevice >> pinNr: anObject [

	pinNr := anObject
]
