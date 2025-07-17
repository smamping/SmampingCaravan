Class {
	#name : #ASDSCDeviceRelay,
	#superclass : #ASDSCDevice,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceRelay class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initalize }
ASDSCDeviceRelay >> initialize [

	super initialize.
	driver beDigitalOutputOnPin: pinNr 
]

{ #category : #operations }
ASDSCDeviceRelay >> off [

	self driver digitalValue: 0 intoPin: pinNr
]

{ #category : #operations }
ASDSCDeviceRelay >> on [

	self driver digitalValue: 1 intoPin: pinNr 
]
