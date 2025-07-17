"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #ASDSCPage,
	#superclass : #ASDSCComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCPage class >> isAbstract [
	^ self = ASDSCPage
]

{ #category : #accessing }
ASDSCPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDSCPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDSCPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCPage >> pathName [
	^ self class pathName
]
