Class {
	#name : 'ASDSCEditDevicePage',
	#superclass : 'ASDSCPageEdit',
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
ASDSCEditDevicePage class >> pageName [

	^ 'Devices'
]

{ #category : 'accessing' }
ASDSCEditDevicePage class >> priority [

	^ 3
]

{ #category : 'hooks' }
ASDSCEditDevicePage >> children [

^ { 
		  self deviceLichtComponente.
		  self deviceBewegungsmelderComponente  }
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> deviceBewegungsmelderComponente [

	^ deviceBewegungsmelderComponente
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> deviceBewegungsmelderComponente: anObject [

	deviceBewegungsmelderComponente := anObject
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> deviceLichtComponente [

	^ deviceLichtComponente
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> deviceLichtComponente: anObject [

	deviceLichtComponente := anObject
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> devicesBewegungsmelder [

	^ devicesBewegungsmelder
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> devicesBewegungsmelder: anObject [

	devicesBewegungsmelder := anObject
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> devicesLicht [

	^ devicesLicht
]

{ #category : 'accessing' }
ASDSCEditDevicePage >> devicesLicht: anObject [

	devicesLicht := anObject
]

{ #category : 'initalize' }
ASDSCEditDevicePage >> initialize [

	super initialize.

]

{ #category : 'rendering' }
ASDSCEditDevicePage >> renderContentOn: html [

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
