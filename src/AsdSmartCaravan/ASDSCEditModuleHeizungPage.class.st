Class {
	#name : 'ASDSCEditModuleHeizungPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteHeizung'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditModuleHeizungPage class >> pageName [

	^ 'ModuleHeizung'
]

{ #category : 'accessing' }
ASDSCEditModuleHeizungPage class >> priority [

	^ 2
]

{ #category : 'hooks' }
ASDSCEditModuleHeizungPage >> children [

	^ { self moduleComponenteHeizung }
]

{ #category : 'initalize' }
ASDSCEditModuleHeizungPage >> initialize [

	super initialize.
	

	self moduleComponenteHeizung: ASDSCDeviceModulHeizung new.
]

{ #category : 'as yet unclassified' }
ASDSCEditModuleHeizungPage >> moduleComponenteHeizung [

	^ moduleComponenteHeizung
]

{ #category : 'as yet unclassified' }
ASDSCEditModuleHeizungPage >> moduleComponenteHeizung: anObject [

	moduleComponenteHeizung := anObject
]

{ #category : 'rendering' }
ASDSCEditModuleHeizungPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'align-items: center; height: 100%';
		with: [
			html mdlCell
				middle;
				size: 4;
				with: [  ].
			html mdlCell
				middle;
				size: 4;
				with: [ self renderTableOn: html ].
			html mdlCell
				middle;
				size: 4;
				with: [  ] ]
]

{ #category : 'rendering' }
ASDSCEditModuleHeizungPage >> renderTableOn: html [

	html render: self moduleComponenteLicht.
	
]
