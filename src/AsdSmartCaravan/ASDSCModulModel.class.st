Class {
	#name : #ASDSCModulModel,
	#superclass : #ASDModel,
	#instVars : [
		'relayListe',
		'sensorListe'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #accessing }
ASDSCModulModel class >> isAbstract [

	^ self = ASDSCModulModel
]

{ #category : #voyage }
ASDSCModulModel class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ false
]

{ #category : #accessing }
ASDSCModulModel class >> type [

	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
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
ASDSCModulModel >> relayListe: anObject [

	relayListe := anObject
]

{ #category : #accessing }
ASDSCModulModel >> sensorListe [

	^ sensorListe
]

{ #category : #accessing }
ASDSCModulModel >> sensorListe: anObject [

	sensorListe := anObject
]

{ #category : #accessing }
ASDSCModulModel >> type [

	^ type
]
