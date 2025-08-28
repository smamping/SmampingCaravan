Class {
	#name : #ASDSCDeviceModulHeizung,
	#superclass : #ASDSCModulModel,
	#instVars : [
		'deviceSensorTemperatur'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #accessing }
ASDSCDeviceModulHeizung class >> type [

	^ 'Heizung'
]

{ #category : #accessing }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur [

	^ deviceSensorTemperatur
]

{ #category : #accessing }
ASDSCDeviceModulHeizung >> deviceSensorTemperatur: anObject [

	deviceSensorTemperatur := anObject
]

{ #category : #initialize }
ASDSCDeviceModulHeizung >> initialize [
	super initialize.
]
