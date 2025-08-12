"
Description
--------------------

Simple session for the AsdSmartCaravan. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #ASDSCSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'currentUser',
		'model',
		'ip',
		'installIndex',
		'arrayInstallSize'
	],
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #accessing }
ASDSCSession >> arrayInstallSize [

	^ arrayInstallSize
]

{ #category : #accessing }
ASDSCSession >> arrayInstallSize: anObject [

	arrayInstallSize := anObject
]

{ #category : #accessing }
ASDSCSession >> currentUser [
	^ currentUser
]

{ #category : #accessing }
ASDSCSession >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #initialization }
ASDSCSession >> initialize [

	super initialize.
	self currentUser: nil.
		"(ASDSCUser benutzerName: 'asdmundt' password: 'pwd' admin: false)."
	model := ASDSCDataBase current.
	installIndex := 1
]

{ #category : #accessing }
ASDSCSession >> installIndex [

	^ installIndex
]

{ #category : #accessing }
ASDSCSession >> ip [

	^ ip
]

{ #category : #accessing }
ASDSCSession >> ip: anObject [

	ip := anObject
]

{ #category : #'accessing values' }
ASDSCSession >> isInstallReady [ 

	 (  self arrayInstallSize = self installIndex ifTrue: [ ^ true ] ifFalse: [ ^ false ] )
]

{ #category : #'accessing values' }
ASDSCSession >> isLogged [

	^ self currentUser notNil
]

{ #category : #accessing }
ASDSCSession >> model [
	^ model
]

{ #category : #accessing }
ASDSCSession >> model: anObject [

	model := anObject
]

{ #category : #accessing }
ASDSCSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
ASDSCSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
