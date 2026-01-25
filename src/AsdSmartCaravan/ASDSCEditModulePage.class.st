Class {
	#name : 'ASDSCEditModulePage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponenteLicht',
		'list',
		'lichtForm',
		'divID'
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
ASDSCEditModulePage >> add [

	self call: (self moduleComponenteLicht
			 addDecoration: ASDCardDecoration new;
			 yourself)
]

{ #category : 'hooks' }
ASDSCEditModulePage >> children [

	^ { self moduleComponenteLicht . self lichtForm }
]

{ #category : 'accessing' }
ASDSCEditModulePage >> divID [

	^ divID
]

{ #category : 'initalize' }
ASDSCEditModulePage >> initialize [

	super initialize.
	divID := #lichtForm.
	self session rootComponent header: ASDSCEditHeader new.
	self moduleComponenteLicht: ASDSCInstallModuleTaskLicht new.
	self lichtForm: (ASDSCModulesLichtForm withModel: ASDSCDeviceModulLicht new)

	"self moduleComponenteHeizung: ASDSCDeviceModulHeizung new."
]

{ #category : 'accessing' }
ASDSCEditModulePage >> lichtForm [

	^ lichtForm
]

{ #category : 'accessing' }
ASDSCEditModulePage >> lichtForm: anObject [

	lichtForm := anObject
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

	html render: (MDLTableWidget new
			 addStringColumnNamed: 'Name' evaluated: [ :x | x bez asString ];
			 addStringColumnNamed: 'Treiber'
			 evaluated: [ :x | x driver deviceName asString ];
			 addStringColumnNamed: 'Bewegungsmelder'
			 evaluated: [ :x | x deviceSensorMotion bez ];
			 addAjaxButtonColumnNamed: 'Bearbeiten'
			 iconName: 'explore'
			 onClick: [ :htmlCanvas :x |
				 htmlCanvas jQuery ajax script: [ :s |
					self lichtForm model: x.
						 s << (s jQuery: self divID) html: [ :r | self renderFormOn: r ] ] ]
			 tooltip: 'Explore integer related to the row.';
			 collection: self session model deviceModulesLicht;
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
				size: 2;
				with: [
					html mdlAnchorButton
						callback: [ self add ];
						fab;
						colored;
						with: '+' ].
			html mdlCell
				middle;
				size: 8;
				with: [ self renderCartOn: html ].
			html mdlCell
				middle;
				size: 2 ].
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
				with: [ self renderFormOn: html ].
			html mdlCell
				middle;
				size: 2 ]
]

{ #category : 'rendering' }
ASDSCEditModulePage >> renderFormOn: html [

	html div
		id: self divID;
		with: [ html render: self lichtForm ]
]
