Class {
	#name : 'ASDSCPageStartInstall',
	#superclass : 'ASDSCComponent',
	#category : 'AsdSmartCaravan-Core',
	#package : 'AsdSmartCaravan',
	#tag : 'Core'
}

{ #category : 'testing' }
ASDSCPageStartInstall class >> isAbstract [

	^ self = ASDSCPageStart
]

{ #category : 'accessing' }
ASDSCPageStartInstall class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
ASDSCPageStartInstall class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : 'accessing' }
ASDSCPageStartInstall class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : 'accessing' }
ASDSCPageStartInstall class >> priority [
	^ self subclassResponsibility
]

{ #category : 'initialize' }
ASDSCPageStartInstall >> initialize [

	super initialize.
	self session rootComponent header: ASDSCStartHeader new
]

{ #category : 'accessing' }
ASDSCPageStartInstall >> pathName [
	^ self class pathName
]
