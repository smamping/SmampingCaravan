Class {
	#name : #ASDSCDeviceSensorGasBottle,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorGasBottle class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]
