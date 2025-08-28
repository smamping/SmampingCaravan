Class {
	#name : #ASDSCEditDevicePage,
	#superclass : #ASDSCPageEdit,
	#instVars : [
		'deviceComponente',
		'systemComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditDevicePage class >> pageName [

	^ 'Devices'
]

{ #category : #accessing }
ASDSCEditDevicePage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCEditDevicePage >> children [

	^ { self systemComponente }
]

{ #category : #accessing }
ASDSCEditDevicePage >> deviceComponente [

	^ deviceComponente
]

{ #category : #accessing }
ASDSCEditDevicePage >> deviceComponente: anObject [

	deviceComponente := anObject
]

{ #category : #initalize }
ASDSCEditDevicePage >> initialize [

	super initialize.

	self systemComponente: ASDSCSystemComponent new.
	
]

{ #category : #rendering }
ASDSCEditDevicePage >> renderContentOn: html [

	html div
		style: 'min-height: 400px;';
		with: [ html render: self systemComponente  ]
]

{ #category : #accessing }
ASDSCEditDevicePage >> systemComponente [

	^ systemComponente
]

{ #category : #accessing }
ASDSCEditDevicePage >> systemComponente: anObject [

	systemComponente := anObject
]
