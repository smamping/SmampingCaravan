Class {
	#name : #ASDSCDeviceModul,
	#superclass : #ASDModel,
	#instVars : [
		'output',
		'schalterGui'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDeviceModul class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCDeviceModul class >> type [
]

{ #category : #accessing }
ASDSCDeviceModul >> output [
	^ output
]

{ #category : #accessing }
ASDSCDeviceModul >> output: anObject [
	output := anObject
]

{ #category : #accessing }
ASDSCDeviceModul >> schalterGui [
	^ schalterGui
]

{ #category : #accessing }
ASDSCDeviceModul >> schalterGui: anObject [
	schalterGui := anObject
]
