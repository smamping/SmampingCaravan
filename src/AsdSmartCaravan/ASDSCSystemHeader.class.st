Class {
	#name : #ASDSCSystemHeader,
	#superclass : #ASDSCHeader,
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCSystemHeader >> possiblePages [

	^ ASDSCPageCarSystem pagesToDisplay
]
