Class {
	#name : #ASDSCDeviceSensorTemperatur,
	#superclass : #ASDSCDeviceSensor,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceSensorTemperatur class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceSensorTemperatur class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Temperatur'
]
