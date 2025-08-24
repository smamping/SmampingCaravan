"
Description
--------------------

Abstract superclass of all Seaside components of AsdSmartCaravan. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #ASDSCComponent,
	#superclass : #WAComponent,
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #convenience }
ASDSCComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
ASDSCComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
ASDSCComponent >> rootComponent [
	^ self session rootComponent
]
