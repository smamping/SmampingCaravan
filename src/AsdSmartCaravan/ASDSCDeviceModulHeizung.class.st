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

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur [

	^ deviceSensorTemperatur
]

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur: anObject [

	deviceSensorTemperatur := anObject
]

{ #category : 'initialize' }
ASDSCDeviceModulHeizung >> initialize [
	super initialize.
	self bez: self class type.
]

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> startModule [

	^ startModule
]

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> startModule: anObject [

	startModule := anObject
]

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> stopModule [

	^ stopModule
]

{ #category : 'as yet unclassified' }
ASDSCDeviceModulHeizung >> stopModule: anObject [

	stopModule := anObject
]
