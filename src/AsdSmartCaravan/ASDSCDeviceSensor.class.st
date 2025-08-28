Class {
	#name : #ASDSCDeviceSensor,
	#superclass : #ASDSCDevice,
	#instVars : [
		'sensorValue'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #testing }
ASDSCDeviceSensor class >> isAbstract [

	^ self = ASDSCDeviceSensor 
]

{ #category : #voyage }
ASDSCDeviceSensor class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initialization }
ASDSCDeviceSensor >> initialize [

	super initialize
]

{ #category : #accessing }
ASDSCDeviceSensor >> pinNr: anObject [

	pinNr := anObject.
	self driver beDigitalInputOnPin: pinNr
]
