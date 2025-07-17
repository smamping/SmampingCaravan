Class {
	#name : #ASDSCAdminHeader,
	#superclass : #ASDSCHeader,
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #accessing }
ASDSCAdminHeader >> possiblePages [
	^ ASDSCPageAdmin pagesToDisplay
]
