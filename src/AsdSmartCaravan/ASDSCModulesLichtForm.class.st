Class {
	#name : #ASDSCModulesLichtForm,
	#superclass : #ASDForm,
	#instVars : [
		'labelDeviceBezeichnung',
		'labelMotionSensor',
		'labelRelayLichtList'
	],
	#category : #'AsdSmartCaravan-Forms'
}

{ #category : #accessing }
ASDSCModulesLichtForm class >> componentTitle [

	^ 'Licht Modul'
]

{ #category : #accessing }
ASDSCModulesLichtForm >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : #accessing }
ASDSCModulesLichtForm >> labelMotionSensor [

	^ labelMotionSensor
]

{ #category : #accessing }
ASDSCModulesLichtForm >> labelRelayLichtList [

	^ labelRelayLichtList
]

{ #category : #rendering }
ASDSCModulesLichtForm >> renderModuleBezeichnungOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'bezeichnungModule';
				with: self labelDeviceBezeichnung.
			html mdlTextFieldInput
				id: 'bezeichnungModule';
				value: self model bez;
				required;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : #rendering }
ASDSCModulesLichtForm >> renderMotionOn: html [

	
]
