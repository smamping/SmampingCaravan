Class {
	#name : #ASDSCDeviceSensorBatterieValue,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorBatterieValue class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceSensorBatterieValue class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'BatterieStand'
]
