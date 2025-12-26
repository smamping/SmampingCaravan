Class {
	#name : 'ASDSCAdminDriverPage',
	#superclass : 'ASDSCPageAdmin',
	#instVars : [
		'driverComponente'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCAdminDriverPage class >> pageName [

	^ 'Treiber'
]

{ #category : 'accessing' }
ASDSCAdminDriverPage class >> priority [

	^ 3
]

{ #category : 'hooks' }
ASDSCAdminDriverPage >> children [

	^ { self driverComponente }
]

{ #category : 'accessing' }
ASDSCAdminDriverPage >> driverComponente [

	^ driverComponente
]

{ #category : 'accessing' }
ASDSCAdminDriverPage >> driverComponente: anObject [

	driverComponente := anObject
]

{ #category : 'initalize' }
ASDSCAdminDriverPage >> initialize [

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
ASDSCAdminDriverPage >> renderContentOn: html [



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
