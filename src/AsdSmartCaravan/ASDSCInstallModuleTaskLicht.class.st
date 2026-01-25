Class {
	#name : 'ASDSCInstallModuleTaskLicht',
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

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht class >> label [ 
^ 'Modul Licht'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> bez [

	^ bez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> bez: anObject [

	bez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> chooseMotion [

	| frm |
	frm := ASDSCDevicesForm
		       withModel: (ASDSCDeviceSensorBewegungsmelder
				        driver: self session esp32Driver
				        pinNr: 16)
		       andForm: true.


	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> chooseRelay [

	| frm mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.

	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> createModel [

	^ ASDSCDeviceModulLicht new bez: self bez
]

{ #category : 'running' }
ASDSCInstallModuleTaskLicht >> go [

	| drv motion relay |
	self bez: self requestBezeichnung.

	self modelModule: self createModel.
	self session modulModelLicht: modelModule.

	drv := self call:
		       (ASDSCEsp32DriverForm
			        withModel: ASDSCESP32Driver new
			        andForm: true).


	drv ifNotNil: [
		self session devMode ifFalse: [ drv setup ].

		self modelModule driver: drv.

		self session model storeObject: drv.
		self session model storeObject: self modelModule.
		self session esp32Driver: drv ].
	self confirmMotion ifTrue: [
		motion := self call: self chooseMotion.
		motion ifNotNil: [
			self modelModule withMotion: true.
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
	self answer: self modelModule
]

{ #category : 'initialization' }
ASDSCInstallModuleTaskLicht >> initialize [

	super initialize.
	"self addDecoration: ASDCardDecoration new"
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> modelModule [

	^ modelModule
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> modelModule: anObject [

	modelModule := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> motionInstancesBezList [

	^ motionInstancesBezList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> motionInstancesBezList: anObject [

	motionInstancesBezList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> motionInstancesList [

	^ motionInstancesList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> motionInstancesList: anObject [

	motionInstancesList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> relayBez [

	^ relayBez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> relayBez: anObject [

	relayBez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> relayLichtList [

	^ relayLichtList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> relayLichtList: anObject [

	relayLichtList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
