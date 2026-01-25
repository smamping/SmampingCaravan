Class {
	#name : 'ASDSCDeviceModulLicht',
	#superclass : 'ASDSCModulModel',
	#instVars : [
		'deviceSensorMotion',
		'motionSensorOn',
		'withMotion'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceModulLicht class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht class >> type [

	^ 'Licht'
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> deviceSensorMotion [

	^ deviceSensorMotion
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> deviceSensorMotion: anObject [

	deviceSensorMotion := anObject
]

{ #category : 'initialize' }
ASDSCDeviceModulLicht >> initialize [

	super initialize.
	self bez: self class type.
	self withMotion: false.
	self motionSensorOn: true
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> motionSensorOn [

	^ motionSensorOn
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> motionSensorOn: anObject [

	motionSensorOn := anObject
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> withMotion [

	^ withMotion
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> withMotion: anObject [

	withMotion := anObject
]
