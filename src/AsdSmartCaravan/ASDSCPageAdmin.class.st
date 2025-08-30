Class {
	#name : #ASDSCPageAdmin,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageAdmin class >> isAbstract [

	^ self = ASDSCPageAdmin
]

{ #category : #accessing }
ASDSCPageAdmin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageAdmin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPageAdmin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPageAdmin class >> priority [
	^ self subclassResponsibility
]

{ #category : #initialize }
ASDSCPageAdmin >> initialize [
	super initialize.
	self session rootComponent header: ASDSCAdminHeader new
]

{ #category : #accessing }
ASDSCPageAdmin >> pathName [
	^ self class pathName
]
