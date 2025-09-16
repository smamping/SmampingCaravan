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

	^ (self modelModule addRelay: self session device) 
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

	
	self relayBez:
		(self chooseFrom: relayBezList caption: 'Bitte Endgerät auswählen').
	self relayBez isNil
		ifTrue: [ self chooseRelay ]
		ifFalse: [ 
			self session device:
				(self session model relayDeviceLichtFromBez: self relayBez) ].
	
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : #accessing }
ASDSCInstallModuleTaskLicht >> createModel [

	^ ASDSCDeviceModulLicht bez: self requestBezeichnung
]

{ #category : #running }
ASDSCInstallModuleTaskLicht >> go [

	self bez: self requestBezeichnung.

	self modelModule: self createModel.

	self session model installReady: true.
	self confirmMotion ifTrue: [ self session model ].

	self chooseRelay.
	self addRelayToModel.
	self halt.
	self confirmNextRelay
		ifTrue: [ 
			self session model storeObject: self modelModule.
			self go ]
		ifFalse: [ 
			self session model storeObject: self modelModule.
			self session rootComponent goToHomeView ]
]

{ #category : #initialization }
ASDSCInstallModuleTaskLicht >> initialize [

	super initialize.
	relayInstances := self session model relayDevicesLicht.
	relayInstances isNotNil ifTrue: [ 
		relayBezList := relayInstances collect: [ :each | each bez ] ].
	
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

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
