Class {
	#name : #ASDSCPageStart,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageStart class >> isAbstract [

	^ self = ASDSCPageStart
]

{ #category : #accessing }
ASDSCPageStart class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageStart class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPageStart class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPageStart class >> priority [
	^ self subclassResponsibility
]

{ #category : #initialize }
ASDSCPageStart >> initialize [

	super initialize.
	self session rootComponent header: ASDSCStartHeader new
]

{ #category : #accessing }
ASDSCPageStart >> pathName [
	^ self class pathName
]
