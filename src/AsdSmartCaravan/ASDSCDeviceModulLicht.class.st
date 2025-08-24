Class {
	#name : #ASDSCDeviceModulLicht,
	#superclass : #ASDSCModulModel,
	#instVars : [
		'deviceSensorMotion'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #accessing }
ASDSCDeviceModulLicht class >> type [
^ 'Licht'
]

{ #category : #accessing }
ASDSCDeviceModulLicht >> deviceSensorMotion [

	^ deviceSensorMotion
]

{ #category : #accessing }
ASDSCDeviceModulLicht >> deviceSensorMotion: anObject [

	deviceSensorMotion := anObject
]

{ #category : #initialize }
ASDSCDeviceModulLicht >> initialize [
	super initialize.
]
