Class {
	#name : 'ASDSCSystemPageDeviceModulLichtPage',
	#superclass : 'ASDSCPageCarSystem',
	#instVars : [
		'lights'
	],
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCSystemPageDeviceModulLichtPage class >> pageName [

	^ 'DeviceModul Ansicht'
]

{ #category : 'accessing' }
ASDSCSystemPageDeviceModulLichtPage class >> priority [

	^ 3
]

{ #category : 'initialization' }
ASDSCSystemPageDeviceModulLichtPage >> initialize [

	super initialize.
	self lights: self session model relayDevicesLicht
	
]

{ #category : 'accessing' }
ASDSCSystemPageDeviceModulLichtPage >> lights [

	^ lights
]

{ #category : 'accessing' }
ASDSCSystemPageDeviceModulLichtPage >> lights: anObject [

	lights := anObject
]

{ #category : 'rendering' }
ASDSCSystemPageDeviceModulLichtPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
			stretch;
				class: 'grid-middle';
				
				size: 2;
				with: ''.
			html mdlCell
				class: 'grid-cell-demo';
				id: 'licht';
				 stretch;
				size: 8;
				with: [	
						html mdlList
		style: 'width: 300px';
		with: [ 
			self lights do: [ :each | 
			html
				mdlListItem: [ html
						mdlListPrimaryContent: [ html mdlIcon
								listItemAvatar;
								with: #light.
							html text: each bez ].
					html mdlListItemSecondaryAction
						with: [ html mdlSwitchContainer
								for: html nextId;
								with: [ html mdlSwitch
										id: html lastId;
										value: '1'.
									html mdlSwitchLabel ] ] ] ]]].
			html mdlCell
			stretch;
				class: 'grid-cell-demo';
				
				size: 2;
				with: ''.
			 ]
]
