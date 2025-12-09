Class {
	#name : 'ASDSCModulesLichtForm',
	#superclass : 'ASDSCModulesForm',
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCModulesLichtForm class >> componentTitle [

	^ 'LichtModul'
]

{ #category : 'initialization' }
ASDSCModulesLichtForm >> initialize [

	super initialize.
	"self model withMotion: true.
	self model motionSensorOn: true."

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
ASDSCModulesLichtForm >> renderWithMotionOn: html [
| htmlId |
htmlId := 'withMotion'.
	html mdlSwitchContainer
		rippleEffect;
		style: 'width: 150px;';
		for: htmlId;
		with: [ html mdlSwitch id: htmlId;
			value: self model withMotion;
			onClick: (html jQuery ajax callback: [ self model withMotion: self model withMotion not ]);
			onClick: ((html jQuery: #motionPanel) toggle);
								id: html lastId.
			html mdlSwitchLabel: 'On / Off' ]	
]
