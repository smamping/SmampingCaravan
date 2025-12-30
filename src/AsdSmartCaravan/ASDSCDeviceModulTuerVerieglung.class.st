Class {
	#name : 'ASDSCDeviceModulTuerVerieglung',
	#superclass : 'ASDSCModulModel',
	#instVars : [
		'deviceRelay',
		'deviceSensorDoor'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung class >> type [

	^ 'Heizung'
]

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung >> deviceRelay [

	^ deviceRelay
]

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung >> deviceRelay: anObject [

	deviceRelay := anObject
]

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung >> deviceSensorDoor [

	^ deviceSensorDoor
]

{ #category : 'accessing' }
ASDSCDeviceModulTuerVerieglung >> deviceSensorDoor: anObject [

	deviceSensorDoor := anObject
]

{ #category : 'initialize' }
ASDSCDeviceModulTuerVerieglung >> initialize [
	super initialize.
	self bez: self class type.
]
