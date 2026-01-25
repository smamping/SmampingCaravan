Class {
	#name : 'ASDSCEditSystemPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'systemComponente'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditSystemPage class >> pageName [

	^ 'System'
]

{ #category : 'accessing' }
ASDSCEditSystemPage class >> priority [

	^ 1
]

{ #category : 'hooks' }
ASDSCEditSystemPage >> children [

	^ { self systemComponente }
]

{ #category : 'initalize' }
ASDSCEditSystemPage >> initialize [

	super initialize.

	self systemComponente: ASDSCSystemComponent new.
	
]

{ #category : 'rendering' }
ASDSCEditSystemPage >> renderContentOn: html [


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
				with: [ html render: self systemComponente ].
			html mdlCell
				middle;
				size: 2 ]
]

{ #category : 'accessing' }
ASDSCEditSystemPage >> systemComponente [

	^ systemComponente
]

{ #category : 'accessing' }
ASDSCEditSystemPage >> systemComponente: anObject [

	systemComponente := anObject
]
