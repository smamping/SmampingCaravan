Class {
	#name : 'ASDSCDeviceSensorDoor',
	#superclass : 'ASDSCDeviceSensor',
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceSensorDoor class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceSensorDoor class >> type [
	"Title of the page that will be used in menus and URLs."

	^ 'TürKontakt'
]

{ #category : 'initialization' }
ASDSCDeviceSensorDoor >> initialize [

	super initialize.
	
]

{ #category : 'testing' }
ASDSCDeviceSensorDoor >> isClosed [ 

	(self driver beDigitalInputOnPin: self pinNr) > 0
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]
