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

{ #category : #accessing }
ASDSCDeviceSensorMotion class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Bewegungsmelder'
]

{ #category : #initialization }
ASDSCDeviceSensorMotion >> initialize [

	super initialize.
	self bez: self class type
]

{ #category : #testing }
ASDSCDeviceSensorMotion >> isOn [

	(self driver beDigitalInputOnPin: (self pinNr))  > 0
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]
