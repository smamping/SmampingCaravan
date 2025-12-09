Class {
	#name : 'ASDSCDeviceModulHeizung',
	#superclass : 'ASDSCModulModel',
	#instVars : [
		'deviceSensorTemperatur',
		'startModule',
		'stopModule'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'accessing' }
ASDSCDeviceModulHeizung class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung class >> type [

	^ 'Heizung'
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur [

	^ deviceSensorTemperatur
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur: anObject [

	deviceSensorTemperatur := anObject
]

{ #category : 'initialize' }
ASDSCDeviceModulHeizung >> initialize [
	super initialize.
	self bez: self class type.
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> startModule [

	^ startModule
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> startModule: anObject [

	startModule := anObject
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> stopModule [

	^ stopModule
]

{ #category : 'accessing' }
ASDSCDeviceModulHeizung >> stopModule: anObject [

	stopModule := anObject
]
