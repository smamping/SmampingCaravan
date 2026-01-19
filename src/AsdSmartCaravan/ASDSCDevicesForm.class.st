Class {
	#name : 'ASDSCDevicesForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelDeviceBezeichnung',
		'labelPinNr'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCDevicesForm class >> componentTitle [

	^ 'Endgeräte'
]

{ #category : 'initialization' }
ASDSCDevicesForm >> initialize [

	super initialize.
	labelDeviceBezeichnung := 'Device Bezeichnung'.
	labelPinNr := 'Pin Nr.'.
	
]

{ #category : 'accessing' }
ASDSCDevicesForm >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : 'as yet unclassified' }
ASDSCDevicesForm >> labelPinNr [

	^ labelPinNr
]

{ #category : 'rendering' }
ASDSCDevicesForm >> renderDeviceBezeichnungOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'bezeichnung';
				with: self labelDeviceBezeichnung.
			html mdlTextFieldInput
				id: 'bezeichnung';
				value: self model bez;
				required;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : 'rendering' }
ASDSCDevicesForm >> renderFieldsOn: html [

	self renderDeviceBezeichnungOn: html.
	self renderPinNrOn: html.
	
]

{ #category : 'as yet unclassified' }
ASDSCDevicesForm >> renderPinNrOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'pinNr';
				with: self labelPinNr.
			html mdlTextFieldInput
				id: 'pinNr';
				value: self model pinNr;
				required;
				callback: [ :aString | self model pinNr: aString ] ]
]
