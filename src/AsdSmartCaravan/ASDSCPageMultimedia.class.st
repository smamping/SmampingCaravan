Class {
	#name : #ASDSCPageMultimedia,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageMultimedia class >> isAbstract [

	^ self = ASDSCPageMultimedia
]

{ #category : #accessing }
ASDSCPageMultimedia class >> pagesToDisplay [

	^ (self allSubclasses reject: #isAbstract) sorted:
		  #priority ascending
]
