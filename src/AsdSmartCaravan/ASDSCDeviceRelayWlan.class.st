Class {
	#name : #ASDSCDeviceRelayWlan,
	#superclass : #ASDSCModulModel,
	#instVars : [
		'command',
		'on'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceRelayWlan class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceRelayWlan >> command [
	^ command
]

{ #category : #accessing }
ASDSCDeviceRelayWlan >> command: anObject [
	command := anObject
]

{ #category : #initialize }
ASDSCDeviceRelayWlan >> initialize [
	super initialize.
	self host: nil
]

{ #category : #testing }
ASDSCDeviceRelayWlan >> isOn [ 
	self on ifTrue: [^ true ] 
				ifFalse: [^ false ]
]

{ #category : #accessing }
ASDSCDeviceRelayWlan >> on [
	^ on
]

{ #category : #accessing }
ASDSCDeviceRelayWlan >> on: anObject [
	on := anObject
]
