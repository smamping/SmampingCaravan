Class {
	#name : 'ASDSCInstallModuleTaskWebCam',
	#superclass : 'WATask',
	#instVars : [
		'selected',
		'selectedModule',
		'tmpModules',
		'modulesSubs'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> chooseModule [

	^ self
		  chooseFrom: self modulesSubs
		  caption: 'Bitte Modul Art auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> confirmModel [

	^ self confirm: 'Ist ' , selected , ' Ihr ausgewähltes Modul'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> deviceClass: aString [

	^ Smalltalk classNamed: aString
]

{ #category : 'running' }
ASDSCInstallModuleTaskWebCam >> go [

	| taskType taskString |
	self selected: self chooseModule.
	taskString := ('ASDSCInstallModuleTask' , self selected) asSymbol.
	


	taskType := self deviceClass: taskString.

	self call: taskType new
]

{ #category : 'initialization' }
ASDSCInstallModuleTaskWebCam >> initialize [

	super initialize.
	self addDecoration: (WAWindowDecoration new title: 'Kamara Modul')
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> modulesSubs [

	^ modulesSubs
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> modulesSubs: anObject [

	modulesSubs := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> requestBezeichnung [

	^ self
		  request: 'Bitte Bezeichnung für das Modul auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> requestModelPinNr [

	^ self request: 'Bitte die Pin Nr Endgerät eingeben' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> selected [

	^ selected
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> selected: anObject [

	selected := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> selectedModule [

	^ selectedModule
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> selectedModule: anObject [

	selectedModule := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> tmpModules [

	^ tmpModules
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskWebCam >> tmpModules: anObject [

	tmpModules := anObject
]
