Class {
	#name : #ASDSCEditModulePage,
	#superclass : #ASDSCPageEdit,
	#instVars : [
		'moduleComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditModulePage class >> pageName [

	^ 'Module'
]

{ #category : #accessing }
ASDSCEditModulePage class >> priority [

	^ 4
]

{ #category : #hooks }
ASDSCEditModulePage >> children [

	^ { self moduleComponente }
]

{ #category : #initalize }
ASDSCEditModulePage >> initialize [

	| devices |
	super initialize.
	devices := self session model devices .
	devices size < 1
		ifTrue: [ 
		self deviceComponente: ASDSCObjectViewTableDevicesComponent new ]
		ifFalse: [ 
			self deviceComponente:
				(ASDSCObjectViewTableDevicesComponent withList: devices) ]
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponente [

	^ moduleComponente
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponente: anObject [

	moduleComponente := anObject
]

{ #category : #rendering }
ASDSCEditModulePage >> renderContentOn: html [

	html div
		style: 'min-height: 400px;';
		with: [ html render: self moduleComponente ]
]
