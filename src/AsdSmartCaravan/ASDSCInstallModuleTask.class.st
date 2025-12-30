Class {
	#name : 'ASDSCInstallModuleTask',
	#superclass : 'WATask',
	#instVars : [
		'modelModule',
		'bez',
		'driver',
		'labelDecoration',
		'dec'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCInstallModuleTask class >> label [ 
^ 'Modul Licht'
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> bez [

	^ bez
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> bez: anObject [

	bez := anObject
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'initialization' }
ASDSCInstallModuleTask >> initialize [

	super initialize.
	dec := ASDCardDecoration new.
	
	"self addDecoration: ASDCardDecoration new"
]

{ #category : 'accessing' }
ASDSCInstallModuleTask >> labelDecoration [

	^ labelDecoration
]

{ #category : 'accessing' }
ASDSCInstallModuleTask >> labelDecoration: anObject [

	labelDecoration := anObject
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> modelModule [

	^ modelModule
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> modelModule: anObject [

	modelModule := anObject
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTask >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
