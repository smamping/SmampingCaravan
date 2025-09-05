Class {
	#name : #ASDSCInstallModuleTaskLicht,
	#superclass : #WATask,
	#instVars : [
		'modelModule',
		'relayLichtList',
		'relayInstances',
		'relayBezList',
		'bez',
		'relayBez'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> addRelayToModel [

	^ (self modelModule addRelay: self session device ) save
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> bez [

	^ bez
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> bez: anObject [

	bez := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> chooseRelay [

	self relayBez: (self chooseFrom: relayBezList caption: 'Bitte Endgerät auswählen').
	self relayBez isNil ifTrue: [ self chooseRelay  ]
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> createModel [

	^ ASDSCDeviceModulLicht bez: self requestBezeichnung save
	
]

{ #category : #running }
ASDSCInstallModuleTaskLicht >> go [

	[ 
	self bez: self requestBezeichnung.
	self bez isNil ifTrue: [ self go ].
	self modelModule: self createModel.
	self session model storeObject: self modelModule.


	self chooseRelay.
	self addRelayToModel.
	self confirmNextRelay ] whileTrue
]

{ #category : #initialization }
ASDSCInstallModuleTaskLicht >> initialize [

	super initialize.
	relayInstances := self session model relayDevicesLicht.
relayInstances isNotNil ifTrue: [  
	relayBezList := relayInstances collect: [ :each | each bez ]].
	self addDecoration: (ASDCardDecoration new
			 label: '';
			 yourself)
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> modelModule [

	^ modelModule
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> modelModule: anObject [

	modelModule := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> relayBez [

	^ relayBez
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> relayBez: anObject [

	relayBez := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> relayLichtList [

	^ relayLichtList
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> relayLichtList: anObject [

	relayLichtList := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> requestBezeichnung [

	self bez: (self request: 'Bitte Bezeichnung für das Modul auswählen').
	self bez isNil ifTrue: [ self requestBezeichnung ].
]
