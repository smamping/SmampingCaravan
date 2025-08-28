Class {
	#name : #ASDSCDevicesForm,
	#superclass : #ASDForm,
	#instVars : [
		'labelDeviceBezeichnung',
		'labelPinNr'
	],
	#category : #'AsdSmartCaravan-Forms'
}

{ #category : #accessing }
ASDSCDevicesForm class >> componentTitle [

	^ 'Endgeräte'
]

{ #category : #initialization }
ASDSCDevicesForm >> initialize [

	super initialize.
	labelDeviceBezeichnung := 'Device Bezeichnung'.
	labelPinNr := 'Pin Nr.'.
	
]

{ #category : #accessing }
ASDSCDevicesForm >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : #accessing }
ASDSCDevicesForm >> labelPinNr [

	^ labelPinNr
]

{ #category : #rendering }
ASDSCDevicesForm >> renderDeviceBezeichnungOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceBezeichnung.
			html mdlTextFieldInput
				id: html lastId;
				value: self model bez;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : #rendering }
ASDSCDevicesForm >> renderFieldsOn: html [

	self renderDeviceBezeichnungOn: html.
	self renderPinNrOn: html.
	
]

{ #category : #rendering }
ASDSCDevicesForm >> renderPinNrOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelPinNr.
			html mdlTextFieldInput
				id: html lastId;
				value: self model pinNr;
				callback: [ :aString | self model pinNr: aString ] ]
]
