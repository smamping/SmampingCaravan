Class {
	#name : 'ASDSCEditModulePage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteLicht'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditModulePage class >> pageName [

	^ 'ModuleLicht'
]

{ #category : 'accessing' }
ASDSCEditModulePage class >> priority [

	^ 2
]

{ #category : 'hooks' }
ASDSCEditModulePage >> children [

	^ { self moduleComponenteLicht". self moduleComponenteHeizung" }
]

{ #category : 'initalize' }
ASDSCEditModulePage >> initialize [

	super initialize.
	self session rootComponent header: ASDSCEditHeader new.
	self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	self moduleComponenteLicht addDecoration: ASDCardDecoration new.
	
	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'accessing' }
ASDSCEditModulePage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : 'accessing' }
ASDSCEditModulePage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderCartOn: html [

	html render: self moduleComponenteLicht.
	
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderContentOn: html [

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
