Class {
	#name : #ASDSCInstallModuleTask,
	#superclass : #WATask,
	#instVars : [
		'selected',
		'selectedModule',
		'tmpModules',
		'modulesSubs'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCInstallModuleTask >> chooseModule [

	^ self
		  chooseFrom: self modulesSubs
		  caption: 'Bitte Modul Art auswählen'
]

{ #category : #accessing }
ASDSCInstallModuleTask >> confirmModel [

	^ self confirm: 'Ist ' , selected , ' Ihr ausgewähltes Modul'
]

{ #category : #accessing }
ASDSCInstallModuleTask >> deviceClass: aString [

	^ Smalltalk classNamed: aString
]

{ #category : #running }
ASDSCInstallModuleTask >> go [

	| taskType taskString |
	self selected: self chooseModule.
	taskString := ('ASDSCInstallModuleTask' , self selected) asSymbol.
	Transcript show: ' module ' , taskString.
	

	taskType := self deviceClass: taskString.

	self show: taskType new
]

{ #category : #initialization }
ASDSCInstallModuleTask >> initialize [

	super initialize.
	self tmpModules: (ASDSCModulModel allSubclasses reject: #isAbstract).

	self modulesSubs: (self tmpModules collect: [ :each | each type ]).
	
]

{ #category : #accessing }
ASDSCInstallModuleTask >> modulesSubs [

	^ modulesSubs
]

{ #category : #accessing }
ASDSCInstallModuleTask >> modulesSubs: anObject [

	modulesSubs := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTask >> requestBezeichnung [

	^ self
		  request: 'Bitte Bezeichnung für das Modul auswählen'
]

{ #category : #accessing }
ASDSCInstallModuleTask >> requestModelPinNr [

	^ self request: 'Bitte die Pin Nr Endgerät eingeben' 
]

{ #category : #accessing }
ASDSCInstallModuleTask >> selected [

	^ selected
]

{ #category : #accessing }
ASDSCInstallModuleTask >> selected: anObject [

	selected := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTask >> selectedModule [

	^ selectedModule
]

{ #category : #accessing }
ASDSCInstallModuleTask >> selectedModule: anObject [

	selectedModule := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTask >> tmpModules [

	^ tmpModules
]

{ #category : #accessing }
ASDSCInstallModuleTask >> tmpModules: anObject [

	tmpModules := anObject
]
