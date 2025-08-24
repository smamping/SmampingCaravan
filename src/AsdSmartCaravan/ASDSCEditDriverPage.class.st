Class {
	#name : #ASDSCEditDriverPage,
	#superclass : #ASDSCPageEdit,
	#instVars : [
		'driverComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditDriverPage class >> pageName [

	^ 'Treiber'
]

{ #category : #accessing }
ASDSCEditDriverPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCEditDriverPage >> children [

	^ { self driverComponente }
]

{ #category : #accessing }
ASDSCEditDriverPage >> driverComponente [

	^ driverComponente
]

{ #category : #accessing }
ASDSCEditDriverPage >> driverComponente: anObject [

	driverComponente := anObject
]

{ #category : #initalize }
ASDSCEditDriverPage >> initialize [

	super initialize.

	self driverComponente: ASDSCObjectViewTableDriverComponent new
]

{ #category : #rendering }
ASDSCEditDriverPage >> renderContentOn: html [

	html div
		style: 'min-height: 400px;';
		with:[html render: self driverComponente ]
]
