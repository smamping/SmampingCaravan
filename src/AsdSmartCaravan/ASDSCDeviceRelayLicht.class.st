Class {
	#name : #ASDSCDeviceRelayLicht,
	#superclass : #ASDSCDeviceRelay,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceRelayLicht class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceRelayLicht class >> type [

	"Title of the page that will be used in menus and URLs."

	^ 'Licht'
]

{ #category : #initalize }
ASDSCDeviceRelayLicht >> initialize [

	super initialize.
	self bez: self class type
]
