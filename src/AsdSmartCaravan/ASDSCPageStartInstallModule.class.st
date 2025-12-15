Class {
	#name : 'ASDSCPageStartInstallModule',
	#superclass : 'ASDSCComponent',
	#category : 'AsdSmartCaravan-Core',
	#package : 'AsdSmartCaravan',
	#tag : 'Core'
}

{ #category : 'testing' }
ASDSCPageStartInstallModule class >> isAbstract [

	^ self = ASDSCPageStart
]

{ #category : 'accessing' }
ASDSCPageStartInstallModule class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
ASDSCPageStartInstallModule class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : 'accessing' }
ASDSCPageStartInstallModule class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : 'accessing' }
ASDSCPageStartInstallModule class >> priority [
	^ self subclassResponsibility
]

{ #category : 'initialize' }
ASDSCPageStartInstallModule >> initialize [

	super initialize.
	self session rootComponent header: ASDSCStartHeader new
]

{ #category : 'accessing' }
ASDSCPageStartInstallModule >> pathName [
	^ self class pathName
]
