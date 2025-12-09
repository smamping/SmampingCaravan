Class {
	#name : 'ASDSCAdminHeader',
	#superclass : 'ASDSCHeader',
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCAdminHeader >> possiblePages [
	^ ASDSCPageAdmin pagesToDisplay
]
