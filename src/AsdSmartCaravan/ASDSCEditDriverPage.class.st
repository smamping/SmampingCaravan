Class {
	#name : 'ASDSCEditDriverPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'driverComponente'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditDriverPage class >> pageName [

	^ 'Treiber'
]

{ #category : 'accessing' }
ASDSCEditDriverPage class >> priority [

	^ 3
]

{ #category : 'hooks' }
ASDSCEditDriverPage >> children [

	^ { self driverComponente }
]

{ #category : 'accessing' }
ASDSCEditDriverPage >> driverComponente [

	^ driverComponente
]

{ #category : 'accessing' }
ASDSCEditDriverPage >> driverComponente: anObject [

	driverComponente := anObject
]

{ #category : 'initalize' }
ASDSCEditDriverPage >> initialize [

	| drivers |
	super initialize.
	drivers := self session model esp32Drivers.
	drivers size < 1
		ifTrue: [ 
		self driverComponente: ASDSCObjectViewTableDriverEsp32Component new ]
		ifFalse: [ 
			self driverComponente:
				(ASDSCObjectViewTableDriverEsp32Component withList: drivers) ]
]

{ #category : 'rendering' }
ASDSCEditDriverPage >> renderContentOn: html [



	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				middle;
				size: 2.
			html mdlCell
				middle;
				size: 8;
				with: [ html render: self driverComponente ].
			html mdlCell
				middle;
				size: 2 ]
]
