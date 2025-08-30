Class {
	#name : #ASDSCPageHome,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPageHome class >> isAbstract [

	^ self = ASDSCPageHome
]

{ #category : #accessing }
ASDSCPageHome class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageHome class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPageHome class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPageHome class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPageHome >> pathName [
	^ self class pathName
]
