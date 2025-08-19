Class {
	#name : #ASDSCModulModel,
	#superclass : #Object,
	#instVars : [
		'relayListe',
		'sensorListe',
		'type'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCModulModel class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ false
]

{ #category : #actions }
ASDSCModulModel >> addRelay: aDevice [

	relayListe add: aDevice
]

{ #category : #actions }
ASDSCModulModel >> addSensor: aSensor [

	sensorListe add: aSensor
]

{ #category : #initialization }
ASDSCModulModel >> initialize [

	super initialize.
	relayListe := OrderedCollection new.
	sensorListe := OrderedCollection new
]

{ #category : #accessing }
ASDSCModulModel >> relayListe [

	^ relayListe
]

{ #category : #accessing }
ASDSCModulModel >> sensorListe [

	^ sensorListe
]

{ #category : #accessing }
ASDSCModulModel >> type [

	^ type
]
