Class {
	#name : 'ASDSCAdminDevicePage',
	#superclass : 'ASDSCPageAdmin',
	#instVars : [
		'deviceLichtComponente',
		'deviceBewegungsmelderComponente',
		'devicesLicht',
		'devicesBewegungsmelder'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCAdminDevicePage class >> pageName [

	^ 'Devices'
]

{ #category : 'accessing' }
ASDSCAdminDevicePage class >> priority [

	^ 3
]

{ #category : 'hooks' }
ASDSCAdminDevicePage >> children [

^ { 
		  self deviceLichtComponente.
		  self deviceBewegungsmelderComponente  }
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> deviceBewegungsmelderComponente [

	^ deviceBewegungsmelderComponente
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> deviceBewegungsmelderComponente: anObject [

	deviceBewegungsmelderComponente := anObject
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> deviceLichtComponente [

	^ deviceLichtComponente
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> deviceLichtComponente: anObject [

	deviceLichtComponente := anObject
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> devicesBewegungsmelder [

	^ devicesBewegungsmelder
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> devicesBewegungsmelder: anObject [

	devicesBewegungsmelder := anObject
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> devicesLicht [

	^ devicesLicht
]

{ #category : 'accessing' }
ASDSCAdminDevicePage >> devicesLicht: anObject [

	devicesLicht := anObject
]

{ #category : 'initalize' }
ASDSCAdminDevicePage >> initialize [

	super initialize.

]

{ #category : 'rendering' }
ASDSCAdminDevicePage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				middle;
				size: 12;
				callback: self rootComponent goToHomeView;
				with: [ 'bla' ] ]
]
