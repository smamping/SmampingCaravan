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
	self session rootComponent header: ASDSCEditHeader new.
	self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	self moduleComponenteLicht addDecoration: ASDCardDecoration new.
	
	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'accessing' }
ASDSCEditModuleTuerVerieglungPage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : 'accessing' }
ASDSCEditModuleTuerVerieglungPage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : 'rendering' }
ASDSCEditModuleTuerVerieglungPage >> renderCartOn: html [

	html render: self moduleComponenteLicht.
	
]

{ #category : 'rendering' }
ASDSCEditModuleTuerVerieglungPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [
			html mdlCell
				middle;
				desktopOffset: 3;
				tabletOffset: 3;
				phoneOffset: 2;
				desktopSize: 8;
				tabletSize: 5;
				phoneSize: 2;
				with: [ self renderCartOn:html ]. 
			 ]
]
