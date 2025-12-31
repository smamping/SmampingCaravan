Class {
	#name : 'ASDSCModulesLichtForm',
	#superclass : 'ASDSCModulesForm',
	#instVars : [
		'labelMotionPanel',
		'labelDriverPanel'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCModulesLichtForm class >> componentTitle [

	^ 'LichtModul'
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> edit: anSensor [

	| frm comp |
	frm := ASDSCDevicesForm
		       withModel: (self model deviceSensorMotion)
		       andForm: true.
		
]

{ #category : 'initialization' }
ASDSCModulesLichtForm >> initialize [

	super initialize.
	self labelMotionPanel: 'Bewegungsmelder'.
	self labelDriverPanel: 'Treiber'.
	"self model withMotion: true.
	self model motionSensorOn: true."
]

{ #category : 'accessing' }
ASDSCModulesLichtForm >> labelDriverPanel [

	^ labelDriverPanel
]

{ #category : 'accessing' }
ASDSCModulesLichtForm >> labelDriverPanel: anObject [

	labelDriverPanel := anObject
]

{ #category : 'accessing' }
ASDSCModulesLichtForm >> labelMotionPanel [

	^ labelMotionPanel
]

{ #category : 'accessing' }
ASDSCModulesLichtForm >> labelMotionPanel: anObject [

	labelMotionPanel := anObject
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> renderDriverOn: html [

	self model deviceSensorMotion ifNotNil: [
		html fieldSet
			legend: self labelMotionPanel;
			id: 'panelMotion';
			with: [
				html mdlList
					style: 'width: 300px';
					with: [
						html mdlListItem
							twoLine;
							with: [
								html mdlListPrimaryContent: [
										html mdlIcon
											listItemIcon;
											with: #radar.
										html text: self model deviceSensorMotion bez.
										html mdlListItemSubTitle:
											self model deviceSensorMotion pinNr ].
								html mdlListSecondaryContent: [
									html mdlListItemSecondaryAction html mdlAnchorButton
										callback: [ self edit: self model deviceSensorMotion ];
										icon;
										with: [ "We could also use the #icon: method"
											html mdlIcon: 'mode_edit' ] ] ] ] ] ]
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> renderFieldsOn: html [

	self renderModuleBezeichnungOn: html.
	
	self renderWithMotionOn: html.
	self renderMotionIsOn: html
	
	
	
	
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> renderMotionIsOn: html [
| htmlId |
htmlId := 'motionIsOn'.
	html mdlSwitchContainer
		rippleEffect;
		style: 'width: 150px;';
		for: htmlId;
		with: [ html mdlSwitch id: htmlId;
			value: self model motionSensorOn.
			
			html mdlSwitchLabel: 'On / Off' ]	
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> renderMotionSensorOn: html [

	self model deviceSensorMotion ifNotNil: [
		html fieldSet
			legend: self labelMotionPanel;
			id: 'panelMotion';
			with: [
				html mdlList
					style: 'width: 300px';
					with: [
						html mdlListItem
							twoLine;
							with: [
								html mdlListPrimaryContent: [
										html mdlIcon
											listItemIcon;
											with: #radar.
										html text: self model deviceSensorMotion bez.
										html mdlListItemSubTitle:
											self model deviceSensorMotion pinNr ].
								html mdlListSecondaryContent: [
									html mdlListItemSecondaryAction html mdlAnchorButton
										callback: [ self edit: self model deviceSensorMotion ];
										icon;
										with: [ "We could also use the #icon: method"
											html mdlIcon: 'mode_edit' ] ] ] ] ] ]
]

{ #category : 'rendering' }
ASDSCModulesLichtForm >> renderWithMotionOn: html [

	| htmlId |
	htmlId := 'withMotion'.
	html mdlSwitchContainer
		rippleEffect;
		style: 'width: 150px;';
		for: htmlId;
		with: [
			html mdlSwitch
				id: htmlId;
				value: self model withMotion;
				onClick: (html jQuery ajax callback: [
							 self model withMotion: self model withMotion not ]);
				onClick: (html jQuery: #panelMotion) toggle;
				id: html lastId.
			html mdlSwitchLabel: 'On / Off' ]
]
