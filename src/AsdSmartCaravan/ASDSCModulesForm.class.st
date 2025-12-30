Class {
	#name : 'ASDSCModulesForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelDeviceBezeichnung'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCModulesForm class >> componentTitle [

	^ self subclassResponsibility
]

{ #category : 'initialization' }
ASDSCModulesForm >> initialize [

	super initialize.
	labelDeviceBezeichnung := 'Module Name'.

]

{ #category : 'accessing' }
ASDSCModulesForm >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : 'rendering' }
ASDSCModulesForm >> renderModuleBezeichnungOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'bezeichnungModule';
				with: self labelDeviceBezeichnung.
			html mdlTextFieldInput
				class: 'frm';
				id: 'bezeichnungModule';
				value: self model bez;
				required;
				callback: [ :aString | self model bez: aString ] ]
]
