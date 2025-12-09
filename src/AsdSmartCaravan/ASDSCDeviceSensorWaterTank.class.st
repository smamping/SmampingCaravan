Class {
	#name : 'ASDSCDeviceSensorWaterTank',
	#superclass : 'ASDSCDeviceSensor',
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceSensorWaterTank class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceSensorWaterTank class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Wasserstand'
]
