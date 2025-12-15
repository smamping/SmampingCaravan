Class {
	#name : 'ASDSCEditModuleSystemPage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteSystem'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditModuleSystemPage class >> pageName [

	^ 'ModuleSystem'
]

{ #category : 'accessing' }
ASDSCEditModuleSystemPage class >> priority [

	^ 3
]

{ #category : 'hooks' }
ASDSCEditModuleSystemPage >> children [

	^ { self moduleComponenteSystem }
]

{ #category : 'initalize' }
ASDSCEditModuleSystemPage >> initialize [

	super initialize.
	self session rootComponent header: ASDSCEditHeader new.
	self moduleComponenteSystem: ASDSCInstallModuleTaskSystem new
	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'accessing' }
ASDSCEditModuleSystemPage >> moduleComponenteSystem [

	^ moduleComponenteSystem
]

{ #category : 'accessing' }
ASDSCEditModuleSystemPage >> moduleComponenteSystem: anObject [

	moduleComponenteSystem := anObject
]

{ #category : 'rendering' }
ASDSCEditModuleSystemPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				middle;
				size: 12;
				with: [ html render: self moduleComponenteSystem.
					
					"html render: (MDLTabWidget new
								 addTabNamed: 'Licht Modul'
								 content: [ html render: ASDSCDeviceModulLicht new ];
								 addTabNamed: 'Heizungs Modul'
								 content: [ html render: ASDSCDeviceModulHeizung new ];
								 yourself) "
					 ] ]
]
