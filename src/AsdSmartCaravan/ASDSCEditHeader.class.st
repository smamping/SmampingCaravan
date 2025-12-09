Class {
	#name : 'ASDSCEditHeader',
	#superclass : 'ASDSCHeader',
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'initialization' }
ASDSCEditHeader >> initialize [

	super initialize.
]

{ #category : 'accessing' }
ASDSCEditHeader >> possiblePages [

	^ ASDSCPageEdit pagesToDisplay
]
