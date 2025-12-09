Class {
	#name : 'ASDSCSystemHeader',
	#superclass : 'ASDSCHeader',
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCSystemHeader >> possiblePages [

	^ ASDSCPageCarSystem pagesToDisplay
]
