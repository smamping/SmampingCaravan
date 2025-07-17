Class {
	#name : #ASDSCDevice,
	#superclass : #ASDModel,
	#instVars : [
		'driver',
		'pinNr',
		'pin'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDevice class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDSCDevice class >> newFromDriver: aDriver AndPinNr: aPinNr [

	^ self new
		  	driver:aDriver;
			pinNr: aPinNr;
		  yourself
]

{ #category : #accessing }
ASDSCDevice >> driver [

	^ driver
]

{ #category : #initalize }
ASDSCDevice >> initialize [

	super initialize.
]

{ #category : #accessing }
ASDSCDevice >> pinNr [

	^ pinNr
]
