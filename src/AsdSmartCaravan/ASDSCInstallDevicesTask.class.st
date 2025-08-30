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

	^ self
		  chooseFrom: self deviceSubs
		  caption: 'Bitte Endgerät auswählen'.
		
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> confirmModel [

	^ self confirm: 'Ist ' , selected , ' Ihr ausgewähltes Endgerät'
]

{ #category : #accessing }
ASDSCInstallDevicesTask >> createModel [

	| selectedDeviceObject |
	selectedDeviceObject := self selectedDevice
		                        newFromDriver: self session esp32Driver.

	^ ASDSCDevicesForm withModel: selectedDeviceObject andForm: true
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

	[ 
	self selected: self chooseModel.
	self selected isNil ifTrue: [ self chooseModel ].
	self confirmModel ] whileFalse.

	self tmpDevices
		detect: [ :each | each type = self selected ]
		ifFound: [ :class | 
			self selectedDevice: class.

			self show: self createModel onAnswer: [ :a | 
				a ifNotNil: [ 
					self session device: a.
					self session model storeObject: a.
					self session model installReady: true.
					] ] ]
]

{ #category : #initialization }
ASDSCInstallDevicesTask >> initialize [

	super initialize.
	self tmpDevices: (ASDSCDevice allSubclasses reject: #isAbstract).

	self deviceSubs: (self tmpDevices collect: [ :each | each type ]).
	self addDecoration: (ASDCardDecoration new
			 label: '')
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
