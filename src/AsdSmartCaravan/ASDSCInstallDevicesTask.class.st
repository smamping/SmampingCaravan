Class {
	#name : #ASDSCInstallDevicesTask,
	#superclass : #WATask,
	#instVars : [
		'selected',
		'selectedDevice',
		'tmpDevices',
		'deviceSubs',
		'devicePin'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCInstallDevicesTask >> chooseModel [

	| deviceArt deviceTyp selDev |
	deviceArt := self
		             chooseFrom: #( 'Relay' 'Sensor' )
		             caption: 'Bitte auswählen ob Relay oder Sensor'.
	deviceArt isNil ifTrue: [ self chooseModel ].

	deviceTyp := self
		             chooseFrom: self deviceSubs
		             caption: 'Bitte Endgerät auswählen'.
	selDev := 'ASDSCDevice' , deviceArt , deviceTyp.
	^ selDev asSymbol 
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> confirmModel [

	^ self confirm: 'Ist ' , selected , ' Ihr ausgewähltes Endgerät'
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> createModel [

	| selectedDeviceObject |
	selectedDeviceObject := self deviceClass newFromDriver:
		                        self session esp32Driver.
	self selected:  selectedDeviceObject
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> deviceClass [

	^ Smalltalk classNamed: self selectedDevice 
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> devicePin [

	^ devicePin
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> devicePin: anObject [

	devicePin := anObject
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> deviceSubs [

	^ deviceSubs
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> deviceSubs: anObject [

	deviceSubs := anObject
]

{ #category : #running }
ASDSCInstallDevicesTask >> go [

	self selectedDevice: self chooseModel.
	Transcript show: ' selectedDevice ' , self selectedDevice.

	self createModel.
	self
		call: (ASDSCDevicesForm withModel: selected andForm: true)
		onAnswer: [ :a | 
			a ifNotNil: [ 
				
				self session device: a.
				self session model storeObject: a.
				Transcript show: ' models ' , a bez.
				self session rootComponent goToEditModuleView ] ]
]

{ #category : #initialization }
ASDSCInstallDevicesTask >> initialize [

	super initialize.
	
	self tmpDevices: (ASDSCDevice allSubclasses reject: #isAbstract).

	self deviceSubs: (self tmpDevices collect: [ :each | each type ])
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> requestModelPinNr [

	^ self request: 'Bitte die Pin Nr Endgerät eingeben' 
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> selected [

	^ selected
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> selected: anObject [

	selected := anObject
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> selectedDevice [

	^ selectedDevice
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> selectedDevice: anObject [

	selectedDevice := anObject
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> tmpDevices [

	^ tmpDevices
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> tmpDevices: anObject [

	tmpDevices := anObject
]
