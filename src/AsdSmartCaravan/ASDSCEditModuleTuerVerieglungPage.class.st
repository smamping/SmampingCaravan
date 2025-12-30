Class {
	#name : 'ASDSCEditModuleTuerVerieglungPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteLicht'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditModuleTuerVerieglungPage class >> pageName [

	^ 'ModuleTürVerieglung'
]

{ #category : 'accessing' }
ASDSCEditModuleTuerVerieglungPage class >> priority [

	^ 2
]

{ #category : 'hooks' }
ASDSCEditModuleTuerVerieglungPage >> children [

	^ { self moduleComponenteLicht". self moduleComponenteHeizung" }
]

{ #category : 'initalize' }
ASDSCEditModuleTuerVerieglungPage >> initialize [

	super initialize.
		self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	
	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'as yet unclassified' }
ASDSCEditModuleTuerVerieglungPage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : 'as yet unclassified' }
ASDSCEditModuleTuerVerieglungPage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : 'rendering' }
ASDSCEditModuleTuerVerieglungPage >> renderContentOn: html [

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
ASDSCEditModuleTuerVerieglungPage >> renderTableOn: html [

	html render: self moduleComponenteLicht.
	
]
