Class {
	#name : 'ASDSCDeviceRelayHeizung',
	#superclass : 'ASDSCDeviceRelay',
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceRelayHeizung class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceRelayHeizung class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Heizung'
]

{ #category : 'initalize' }
ASDSCDeviceRelayHeizung >> initialize [

	super initialize.
	self bez: self class type
]
