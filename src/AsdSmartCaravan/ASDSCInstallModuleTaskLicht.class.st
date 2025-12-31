Class {
	#name : 'ASDSCInstallModuleTaskLicht',
	#superclass : 'ASDSCInstallModuleTask',
	#instVars : [
		'relayLichtList',
		'motionInstancesBezList',
		'motionInstancesList',
		'motionBez'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCInstallModuleTaskLicht class >> label [ 
^ 'Modul Licht'
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> chooseMotion [

	| frm |
	frm := ASDSCDevicesForm
		       withModel: (ASDSCDeviceSensorBewegungsmelder
				        driver: self session esp32Driver
				        pinNr: 16)
		       andForm: true.


	^ frm
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> chooseRelay [

	| frm mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.

	^ frm
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> createModel [

	^ ASDSCDeviceModulLicht new bez: self bez
]

{ #category : 'as yet unclassified' }
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
	^ self answer: self modelModule 
]

{ #category : 'initialization' }
ASDSCInstallModuleTaskLicht >> initialize [

	super initialize.
	dec label: 'Licht Modul'.
	self addDecoration: dec
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> motionInstancesBezList [

	^ motionInstancesBezList
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> motionInstancesBezList: anObject [

	motionInstancesBezList := anObject
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> motionInstancesList [

	^ motionInstancesList
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> motionInstancesList: anObject [

	motionInstancesList := anObject
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> relayLichtList [

	^ relayLichtList
]

{ #category : 'as yet unclassified' }
ASDSCInstallModuleTaskLicht >> relayLichtList: anObject [

	relayLichtList := anObject
]
