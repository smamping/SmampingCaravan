Class {
	#name : #ASDSCDeviceSensor,
	#superclass : #ASDSCDevice,
	#instVars : [
		'sensorValue'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensor class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]
