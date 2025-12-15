Class {
	#name : 'ASDSCInstallModuleTaskSystem',
	#superclass : 'WATask',
	#instVars : [
		'modelModule',
		'relayLichtList',
		'relayInstances',
		'motionInstancesBezList',
		'motionInstancesList',
		'motionBez',
		'relayBezList',
		'bez',
		'relayBez',
		'driver'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem class >> label [ 
^ 'Modul System'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> bez [

	^ bez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> bez: anObject [

	bez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> chooseMotion [
|frm dec | 
frm := (ASDSCDevicesForm withModel: (ASDSCDeviceSensorBewegungsmelder driver: self session esp32Driver pinNr: 16 ) andForm: true).
dec := ASDCardDecoration new.
dec label: 'Bewegungsmelder'.
frm addDecoration: dec.
^ frm


]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> chooseRelay [

	| frm mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.

	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> createModel [

	^ ASDSCDeviceModulLicht new bez: self bez
]

{ #category : 'running' }
ASDSCInstallModuleTaskSystem >> go [

	| drv motion relay |
	self bez: self requestBezeichnung.

	self modelModule: self createModel.
	self session modulModelLicht: modelModule.

	drv := self call:
		       (ASDSCEsp32DriverForm
			        withModel: ASDSCESP32Driver new
			        andForm: true).


	drv ifNotNil: [ 
		self modelModule driver: drv.

		self session model storeObject: drv.
		self session model storeObject: self modelModule.
		self session esp32Driver: drv ].
	self confirmMotion ifTrue: [ 
		motion := self call: self chooseMotion.
		motion ifNotNil: [ 
			self session model storeObject: motion.
			self modelModule deviceSensorMotion: motion.
			self session model storeObject: self modelModule ] ].
	[ 
	relay := self call: self chooseRelay.
	relay ifNotNil: [ 
		self session model storeObject: relay.
		self modelModule addRelay: relay.
		self session model storeObject: self modelModule ].
	self confirmNextRelay ] whileTrue.


	self session model installReady: true.
	self inform: 'gespeichert'.
]

{ #category : 'initialization' }
ASDSCInstallModuleTaskSystem >> initialize [

	super initialize.
	self addDecoration: ASDCardDecoration new
	
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> modelModule [

	^ modelModule
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> modelModule: anObject [

	modelModule := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> motionInstancesBezList [

	^ motionInstancesBezList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> motionInstancesBezList: anObject [

	motionInstancesBezList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> motionInstancesList [

	^ motionInstancesList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> motionInstancesList: anObject [

	motionInstancesList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> relayBez [

	^ relayBez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> relayBez: anObject [

	relayBez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> relayLichtList [

	^ relayLichtList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> relayLichtList: anObject [

	relayLichtList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskSystem >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
