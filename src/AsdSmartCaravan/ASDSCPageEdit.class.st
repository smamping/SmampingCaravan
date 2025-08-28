Class {
	#name : #ASDSCPageEdit,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageEdit class >> isAbstract [

	^ self = ASDSCPageEdit
]

{ #category : #accessing }
ASDSCPageEdit class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageEdit class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPageEdit class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPageEdit class >> priority [
	^ self subclassResponsibility
]

{ #category : #initialize }
ASDSCPageEdit >> initialize [

	super initialize.
	self session rootComponent header: ASDSCEditHeader new
]

{ #category : #accessing }
ASDSCPageEdit >> pathName [
	^ self class pathName
]
