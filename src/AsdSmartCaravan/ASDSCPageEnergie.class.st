Class {
	#name : #ASDSCPageEnergie,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageEnergie class >> isAbstract [

	^ self = ASDSCPageEnergie
]

{ #category : #accessing }
ASDSCPageEnergie class >> pagesToDisplay [

	^ (self allSubclasses reject: #isAbstract) sorted:
		  #priority ascending
]
