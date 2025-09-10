Class {
	#name : #ASDSCDeviceSensorBewegungsmelder,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorBewegungsmelder class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceSensorBewegungsmelder class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Bewegungsmelder'
]

{ #category : #initialization }
ASDSCDeviceSensorBewegungsmelder >> initialize [

	super initialize.
	self bez: self class type
]

{ #category : #testing }
ASDSCDeviceSensorBewegungsmelder >> isOn [

	(self driver beDigitalInputOnPin: (self pinNr))  > 0
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]
