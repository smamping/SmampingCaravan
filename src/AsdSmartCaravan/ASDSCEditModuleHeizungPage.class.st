Class {
	#name : 'ASDSCEditModuleHeizungPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteLicht'
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

	^ { self moduleComponenteLicht". self moduleComponenteHeizung" }
]

{ #category : 'initalize' }
ASDSCEditModuleHeizungPage >> initialize [

	super initialize.
	self session rootComponent header: ASDSCEditHeader new.
	self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	self moduleComponenteLicht addDecoration: ASDCardDecoration new.
	
	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'accessing' }
ASDSCEditModuleHeizungPage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : 'accessing' }
ASDSCEditModuleHeizungPage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : 'rendering' }
ASDSCEditModuleHeizungPage >> renderCartOn: html [

	html render: self moduleComponenteLicht.
	
]

{ #category : 'rendering' }
ASDSCEditModuleHeizungPage >> renderContentOn: html [

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
