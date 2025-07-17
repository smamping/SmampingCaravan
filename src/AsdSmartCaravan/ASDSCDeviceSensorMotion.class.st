Class {
	#name : #ASDSCDeviceSensorMotion,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorMotion class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initialization }
ASDSCDeviceSensorMotion >> initialize [

	super initialize.
	driver beDigitalInputOnPin: pinNr.
	self bez: 'Bewegungssensor'
]
