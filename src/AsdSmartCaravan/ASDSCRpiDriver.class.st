Class {
	#name : 'ASDSCRpiDriver',
	#superclass : 'ASDModel',
	#instVars : [
		'deviceIp',
		'deviceId'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCRpiDriver class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true

	
]

{ #category : 'accessing' }
ASDSCRpiDriver >> deviceId [

	^ deviceId
]

{ #category : 'accessing' }
ASDSCRpiDriver >> deviceId: anObject [

	deviceId := anObject
]

{ #category : 'accessing' }
ASDSCRpiDriver >> deviceIp [

	^ deviceIp
]

{ #category : 'accessing' }
ASDSCRpiDriver >> deviceIp: anObject [

	deviceIp := anObject
]

{ #category : 'initialization' }
ASDSCRpiDriver >> initialize [

	super initialize.
]
