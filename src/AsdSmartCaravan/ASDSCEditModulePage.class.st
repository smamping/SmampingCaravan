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
					self moduleList isNotEmpty ifTrue: [ self renderTableOn: html ] ].
			html mdlCell
				middle;
				size: 2;
				with: [  ] ].
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
			 
			 addStringColumnNamed: 'Bezeichnung'
			 evaluated: [ :x | x asString ];
			 addStringColumnNamed: 'As words'
			 evaluated: [ :x | x asWords capitalized ];
			 addAjaxButtonColumnWithIconName: 'explore'
			 onClick: [ :htmlCanvas :x |
				 htmlCanvas javascript alert: 'Explore ' , x asString ]
			 tooltip: 'Explore integer related to the row.';
			 addButtonColumnWithIconName: 'delete' onClick: [ :x |
				 Transcript
					 show: x;
					 show: ' deleted in callback.';
					 cr ]
			 tooltip: 'Delete integer in callback.';
			 collection: (1000 to: 5000 by: 1000);
			 yourself)
]
