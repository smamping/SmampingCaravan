Class {
	#name : #ASDSCEditHeader,
	#superclass : #ASDSCHeader,
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCEditHeader >> possiblePages [

	^ ASDSCPageEdit pagesToDisplay
]
