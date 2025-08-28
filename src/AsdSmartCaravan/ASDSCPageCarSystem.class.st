Class {
	#name : #ASDSCPageCarSystem,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageCarSystem class >> isAbstract [
	^ self = ASDSCPage
]

{ #category : #accessing }
ASDSCPageCarSystem class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageCarSystem class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPageCarSystem class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPageCarSystem class >> priority [
	^ self subclassResponsibility
]

{ #category : #initialize }
ASDSCPageCarSystem >> initialize [

	super initialize.
	self session rootComponent header: ASDSCSystemHeader new
]

{ #category : #accessing }
ASDSCPageCarSystem >> pathName [
	^ self class pathName
]
