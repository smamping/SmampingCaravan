Class {
	#name : #ASDSCDeviceModulLicht,
	#superclass : #ASDSCModulModel,
	#instVars : [
		'deviceSensorMotion'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceModulLicht class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

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
	self bez: self class type
]
