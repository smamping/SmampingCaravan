Class {
	#name : 'ASDSCInstallModuleTaskTuerVerieglung',
	#superclass : 'ASDSCInstallModuleTask',
	#instVars : [
		'relayBezList',
		'relayBez'
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
ASDSCInstallModuleTaskTuerVerieglung >> chooseRelay [

	| frm mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.

	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskTuerVerieglung >> createModel [

	^ ASDSCDeviceModulTuerVerieglung new bez: self bez
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
	dec label: 'Sicherheits Modul'.
	self addDecoration: dec
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
ASDSCInstallModuleTaskTuerVerieglung >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
