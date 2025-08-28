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
		  caption: 'Bitte Endgerät auswählen'
]

{ #category : #accessing }
ASDSCInstallModuleTask >> confirmModel [

	^ self confirm: 'Ist ' , selected , ' Ihr ausgewähltes Modul'
]

{ #category : #accessing }
ASDSCInstallModuleTask >> createModel [

	| selectedDeviceObject |
	selectedDeviceObject := self selectedDevice newFromDriver: self session esp32Driver AndPinNr: self devicePin.
		                       
	^ ASDSCDevicesForm withModel: selectedDeviceObject andForm: true
]

{ #category : #running }
ASDSCInstallModuleTask >> go [

	[ 
	self selected: self chooseModule.
	self selected isNil ifTrue: [ self chooseModule ].
	self confirmModel ] whileFalse.

	self tmpModules 
		detect: [ :each | each type = self selected ]
		ifFound: [ :class | 
			self selectedModule: class.

			self show: self createModel onAnswer: [ :a | 
				a ifNotNil: [ 
					self session device: a.
					self session model storeObject: a.
					self session model installReady: true ] ] ]
]

{ #category : #initialization }
ASDSCInstallModuleTask >> initialize [

	super initialize.
	self tmpModules: (ASDSCModulModel allSubclasses reject: #isAbstract).

	self modulesSubs: (self tmpModules collect: [ :each | each type ]).
	self addDecoration: (ASDCardDecoration new
			 label: '';
			 yourself)
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
