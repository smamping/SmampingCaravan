Class {
	#name : #ASDSCDeviceSensorWaterTank,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorWaterTank class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]
