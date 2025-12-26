Class {
	#name : 'ASDSCInstallModuleTaskTuerVerieglung',
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
ASDSCInstallModuleTaskTuerVerieglung class >> label [

	^ 'Modul Türverieglung'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> bez [

	^ bez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> bez: anObject [

	bez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> chooseMotion [
|frm dec | 
frm := (ASDSCDevicesForm withModel: (ASDSCDeviceSensorBewegungsmelder driver: self session esp32Driver pinNr: 16 ) andForm: true).
dec := ASDCardDecoration new.
dec label: 'Bewegungsmelder'.
frm addDecoration: dec.
^ frm


]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> chooseRelay [

	| frm mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.

	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> createModel [

	^ ASDSCDeviceModulLicht new bez: self bez
]

{ #category : 'running' }
ASDSCInstallModuleTaskTuerVerieglung >> go [

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
ASDSCInstallModuleTaskTuerVerieglung >> initialize [

	super initialize.
	"self addDecoration: ASDCardDecoration new"
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> modelModule [

	^ modelModule
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> modelModule: anObject [

	modelModule := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> motionInstancesBezList [

	^ motionInstancesBezList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> motionInstancesBezList: anObject [

	motionInstancesBezList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> motionInstancesList [

	^ motionInstancesList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> motionInstancesList: anObject [

	motionInstancesList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> relayBez [

	^ relayBez
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> relayBez: anObject [

	relayBez := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> relayLichtList [

	^ relayLichtList
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> relayLichtList: anObject [

	relayLichtList := anObject
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
