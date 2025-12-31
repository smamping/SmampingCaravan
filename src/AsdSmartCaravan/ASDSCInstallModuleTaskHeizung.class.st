Class {
	#name : 'ASDSCInstallModuleTaskHeizung',
	#superclass : 'ASDSCInstallModuleTask',
	#instVars : [
		'relayTemperaturList',
		'temperaturBez',
		'temperaturInstancesBezList'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung class >> label [ 
^ 'Modul Heizung'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> addRelayToModel [

	^ (self modelModule addRelay: self session device) 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> chooseRelay [

	| frm dec mod |
	mod := ASDSCDeviceRelay driver: self session esp32Driver pinNr: 18.
	mod type: 'light'.
	frm := ASDSCDevicesForm withModel: mod andForm: true.
	dec := ASDCardDecoration new.
	dec label: 'Relay'.
	frm addDecoration: dec.
	^ frm
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> chooseTemparatur [

		temperaturBez := self
		             chooseFrom: temperaturInstancesBezList
		             caption: 'Bitte Termometer auswählen'.
	temperaturBez isNil
		ifTrue: [ self chooseTemparatur ]
		ifFalse: [ 
			self session modulModelHeizung:
				(self session model sensorDeviceMotionFromBez:  temperaturBez) ].
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> confirmMotion [

	^ self confirm: 'Ein Bewegungssensor auswählen'
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> confirmNextRelay [
^ self confirm: 'Ein weiteres Relay auswählen' 
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> createModel [

	^ ASDSCDeviceModulHeizung bez: self bez
]

{ #category : 'running' }
ASDSCInstallModuleTaskHeizung >> go [

	self bez: self requestBezeichnung.

	self modelModule: self createModel.


	 self chooseTemparatur.

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

{ #category : 'initialization' }
ASDSCInstallModuleTaskHeizung >> initialize [

	super initialize.
	dec label: 'Heizungs Modul'.
	self addDecoration: dec
]

{ #category : 'accessing' }
ASDSCInstallModuleTaskHeizung >> requestBezeichnung [

	^ (self request: 'Bitte Bezeichnung für das Modul auswählen').
	
]
