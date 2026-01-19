Class {
	#name : 'ASDSCEditModulePage',
	#superclass : 'ASDSCPageEdit',
	#instVars : [
		'moduleComponente'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCEditModulePage class >> pageName [

	^ 'Module'
]

{ #category : 'accessing' }
ASDSCEditModulePage class >> priority [

	^ 4
]

{ #category : 'hooks' }
ASDSCEditModulePage >> children [

	^ { self moduleComponente }
]

{ #category : 'initalize' }
ASDSCEditModulePage >> initialize [

	| devices |
	super initialize.
	devices := self session model devices .
	devices size < 1
		ifTrue: [ 
		self deviceComponente: ASDSCObjectViewTableDevicesComponent new ]
		ifFalse: [ 
			self deviceComponente:
				(ASDSCObjectViewTableDevicesComponent withList: devices) ]
]

{ #category : 'accessing' }
ASDSCEditModulePage >> moduleComponente [

	^ moduleComponente
]

{ #category : 'accessing' }
ASDSCEditModulePage >> moduleComponente: anObject [

	moduleComponente := anObject
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

	html div
		style: 'min-height: 400px;';
		with: [ html render: self moduleComponente ]
]
