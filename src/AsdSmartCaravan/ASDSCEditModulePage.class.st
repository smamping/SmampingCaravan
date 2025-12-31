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

{ #category : 'actions' }
ASDSCEditModulePage >> addLichtItem [

self call: self moduleComponenteLicht.



	
]

{ #category : 'hooks' }
ASDSCEditModulePage >> children [

	^ { self moduleComponenteLicht". self moduleComponenteHeizung" }
]

{ #category : 'actions' }
ASDSCEditModulePage >> editLichtItem: anItem [

	
]

{ #category : 'initalize' }
ASDSCEditModulePage >> initialize [

	super initialize.

	self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	self moduleList: self session model deviceModulesLicht.



	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'as yet unclassified' }
ASDSCEditModulePage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : 'as yet unclassified' }
ASDSCEditModulePage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'align-items: center; height: 100%';
		with: [
			html mdlCell
				middle;
				size: 2;
				with: [  ].
			html mdlCell
				middle;
				size: 8;
				with: [
					].
			html mdlCell
				middle;
				size: 2;
				with: [
		 	html mdlAnchorButton
			icon;
			id: 'newLichtModule';
			callback: [ self addLichtItem ];
			with: [ html mdlIcon: 'add' ].
		html mdlTooltip
			for: 'newLichtModule';
			with: 'self tooltipLabelopenRightPanel' ] ].
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
				with: [
					self moduleList isNotEmpty ifTrue: [ self renderTableOn: html ] ].
			html mdlCell
				middle;
				size: 4;
				with: [  ] ]
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderTableOn: html [

	html render: (MDLTableWidget new
			 addStringColumnNamed: 'Bezeichnung' evaluated: [ :x | x bez ];
			 addNumericColumnNamed: 'Anzahl Lichter'
			 evaluated: [ :x | x relayListe size ];
			 addButtonColumnNamed: 'Bearbeiten'
			 iconName: 'explore'
			 onClick: [ :x |
				self editLichtItem: x ]
			 tooltip: 'Licht Module bearbeiten';
			 collection: self moduleList;
			 yourself)
]
