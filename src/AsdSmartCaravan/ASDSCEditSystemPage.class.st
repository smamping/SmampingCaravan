Class {
	#name : #ASDSCEditSystemPage,
	#superclass : #ASDSCPageEdit,
	#instVars : [
		'systemComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditSystemPage class >> pageName [

	^ 'System'
]

{ #category : #accessing }
ASDSCEditSystemPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCEditSystemPage >> children [

	^ { self systemComponente }
]

{ #category : #initalize }
ASDSCEditSystemPage >> initialize [

	super initialize.

	self systemComponente: ASDSCSystemComponent new.
	
]

{ #category : #rendering }
ASDSCEditSystemPage >> renderContentOn: html [

	html div
		style: 'min-height: 400px;';
		with: [ html render: self systemComponente  ]
]

{ #category : #accessing }
ASDSCEditSystemPage >> systemComponente [

	^ systemComponente
]

{ #category : #accessing }
ASDSCEditSystemPage >> systemComponente: anObject [

	systemComponente := anObject
]
