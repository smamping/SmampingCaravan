Class {
	#name : #ASDSCModulModel,
	#superclass : #Object,
	#instVars : [
		'geraeteListe',
		'controller',
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
ASDSCModulModel >> addGeraet: aDevice [
	self geraeteListe add: aDevice
]

{ #category : #accessing }
ASDSCModulModel >> geraeteListe [
	^ geraeteListe ifNil: [ geraeteListe := OrderedCollection new ]
]

{ #category : #accessing }
ASDSCModulModel >> geraeteListe: anObject [
	geraeteListe := anObject
]

{ #category : #initialization }
ASDSCModulModel >> initialize [
super initialize.
	
]
