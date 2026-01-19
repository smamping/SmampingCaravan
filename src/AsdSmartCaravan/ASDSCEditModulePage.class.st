Class {
	#name : 'ASDSCEditModulePage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteLicht',
		'list',
		'lichtForm'
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

		html
		render:
			(MDLTableWidget new
				addStringColumnNamed: 'Name' evaluated: [ :x | x bez asString ];
				addStringColumnNamed: 'Treiber' evaluated: [ :x | x driver deviceName asString  ];
				addStringColumnNamed: 'Bewegungsmelder' evaluated: [ :x | x deviceSensorMotion bez ];
				addAjaxButtonColumnNamed: 'Bearbeitenn'
iconName: 'explore'
					onClick: [ :htmlCanvas :x | htmlCanvas javascript alert: 'Explore ' , x asString ]
					tooltip: 'Explore integer related to the row.';
				addButtonColumnWithIconName: 'delete'
					onClick: [ :x | 
					Transcript
						show: x;
						show: ' deleted in callback.';
						cr ]
					tooltip: 'Delete integer in callback.';
				collection: self model deviceModulesLicht;
				yourself)
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderContentOn: html [

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
				with: [  self renderCartOn: html ].
			html mdlCell
				middle;
				size: 2 ]
]
