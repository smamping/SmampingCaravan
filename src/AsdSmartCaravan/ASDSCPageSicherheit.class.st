Class {
	#name : #ASDSCPageSicherheit,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageSicherheit class >> isAbstract [

	^ self = ASDSCPageSicherheit
]

{ #category : #accessing }
ASDSCPageSicherheit class >> pagesToDisplay [

	^ (self allSubclasses reject: #isAbstract) sorted:
		  #priority ascending
]
