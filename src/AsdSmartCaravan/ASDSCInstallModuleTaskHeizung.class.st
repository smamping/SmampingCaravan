Class {
	#name : #ASDSCInstallModuleTaskHeizung,
	#superclass : #WATask,
	#instVars : [
		'modelModule',
		'relayLichtList',
		'relayInstances',
		'motionInstancesBezList',
		'motionInstancesList',
		'motionBez',
		'relayBezList',
		'bez',
		'relayBez'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> addRelayToModel [

	^ (self modelModule addRelay: self session device) 
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> bez [

	^ bez
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> bez: anObject [

	bez := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> chooseMotion [

	motionBez := self
		             chooseFrom: motionInstancesBezList
		             caption: 'Bitte Bewegungsmelder auswählen'.
	motionBez isNil
		ifTrue: [ self chooseMotion ]
		ifFalse: [ 
			self session modulModelLicht:
				(self session model sensorDeviceMotionFromBez:  motionBez) ]
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> chooseRelay [

	self relayBez:
		(self chooseFrom: relayBezList caption: 'Bitte Endgerät auswählen').
	self relayBez isNil
		ifTrue: [ self chooseRelay ]
		ifFalse: [ 
			self session device:
				(self session model relayDeviceLichtFromBez: self relayBez).
				self addRelayToModel.
				 ]
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> createModel [

	^ ASDSCDeviceModulHeizung bez: self bez
]

{ #category : #running }
ASDSCInstallModuleTaskHeizung >> go [

	self bez: self requestBezeichnung.

	self modelModule: self createModel.


	self confirmMotion ifTrue: [ self chooseMotion ].

	self chooseRelay.


	self session model installReady: true.
	self confirmNextRelay
		ifTrue: [ 
			
			self go ]
		ifFalse: [ 
			self session model storeObject: self modelModule.
			self inform: 'gespeichert'.
			self session rootComponent goToHomeView ]
]

{ #category : #initialization }
ASDSCInstallModuleTaskHeizung >> initialize [

	super initialize.
	relayInstances := self session model relayDevicesLicht.
	relayInstances isNotNil ifTrue: [ 
		relayBezList := relayInstances collect: [ :each | each bez ] ].
	motionInstancesList := self session model relayDevicesLicht.
	motionInstancesList isNotNil ifTrue: [ 
		motionInstancesBezList := motionInstancesList collect: [ :each | each bez ] ]
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> modelModule [

	^ modelModule
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> modelModule: anObject [

	modelModule := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> motionInstancesBezList [

	^ motionInstancesBezList
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> motionInstancesBezList: anObject [

	motionInstancesBezList := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> motionInstancesList [

	^ motionInstancesList
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> motionInstancesList: anObject [

	motionInstancesList := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> relayBez [

	^ relayBez
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> relayBez: anObject [

	relayBez := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> relayLichtList [

	^ relayLichtList
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> relayLichtList: anObject [

	relayLichtList := anObject
]

{ #category : #accessing }
ASDSCInstallModuleTaskHeizung >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
