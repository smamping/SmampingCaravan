Class {
	#name : 'ASDSCVirtualModulModel',
	#superclass : 'ASDModel',
	#instVars : [
		'relayListe',
		'sensorListe',
		'modulLichtList'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCVirtualModulModel class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'actions' }
ASDSCVirtualModulModel >> addRelay: aDevice [

	relayListe add: aDevice
]

{ #category : 'actions' }
ASDSCVirtualModulModel >> addSensor: aSensor [

	sensorListe add: aSensor
]

{ #category : 'initialization' }
ASDSCVirtualModulModel >> initialize [

	super initialize.
	relayListe := OrderedCollection new.
	sensorListe := OrderedCollection new.
	
]

{ #category : 'accessing' }
ASDSCVirtualModulModel >> relayListe [

	^ relayListe
]

{ #category : 'accessing' }
ASDSCVirtualModulModel >> relayListe: anObject [

	relayListe := anObject
]

{ #category : 'accessing' }
ASDSCVirtualModulModel >> sensorListe [

	^ sensorListe
]

{ #category : 'accessing' }
ASDSCVirtualModulModel >> sensorListe: anObject [

	sensorListe := anObject
]

{ #category : 'accessing' }
ASDSCVirtualModulModel >> type [

	^ type
]
