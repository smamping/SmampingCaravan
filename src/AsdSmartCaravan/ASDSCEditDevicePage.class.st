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

	^ 3
]

{ #category : #hooks }
ASDSCEditDevicePage >> children [

	^ { self deviceComponente }
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

{ #category : #rendering }
ASDSCEditDevicePage >> renderContentOn: html [

	html div
		style: 'min-height: 400px;';
		with: [ html render: self deviceComponente ]
]

{ #category : #accessing }
ASDSCEditDevicePage >> systemComponente [

	^ systemComponente
]

{ #category : #accessing }
ASDSCEditDevicePage >> systemComponente: anObject [

	systemComponente := anObject
]
