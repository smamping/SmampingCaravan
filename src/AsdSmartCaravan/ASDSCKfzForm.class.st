Class {
	#name : 'ASDSCKfzForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelBj',
		'labelBreite',
		'labelDisplays',
		'labelGas',
		'labelHeizung',
		'labelHersteller',
		'laderegler',
		'laenge',
		'labelMultimediaSystem',
		'wassertank',
		'webCam'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCKfzForm class >> componentTitle [

	^ 'SystemForm'
]

{ #category : 'initialization' }
ASDSCKfzForm >> initialize [

	super initialize.
	labelBj := 'Bau jahr'.
	labelGas := 'Gas Stand'.
	labelHeizung := 'Heizungssteuerung'.
	laderegler := 'Energieverwaltung'.
	laenge := 'Länge Kfz (in Meter)'.
	wassertank := 'Wasserstand'.
	labelMultimediaSystem := 'Multimediasystem'
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderBjOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'bj';
				with: labelBj.
			html mdlTextFieldInput
				id: 'bj';
				value: self model bj;
				required;
				callback: [ :aString | self model bj: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderFieldsOn: html [

	self renderBjOn: html.
	self renderMqttIpOn: html.
	self renderIpCamOn: html.
	self renderIpMultimediaOn: html.
	self renderSsidOn: html.
	self renderWlanPwdOn: html
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderHostNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'hostName';
				with: self labelHostName.
			html mdlTextFieldInput
				id: 'hostName';
				value: self model hostName;
				required;
				callback: [ :aString | self model hostName: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderIpCamOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelIpCam.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ipCam;
				callback: [ :aString | self model ipCam: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderIpMultimediaOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelIpMultimedia.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ipMultimedia;
				callback: [ :aString | self model ipMultimedia: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderIpOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'ip';
				with: self labelIp.
			html mdlTextFieldInput
				id: 'ip';
				value: self model ip;
				required;
				callback: [ :aString | self model ip: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderMqttIpOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelMqttIp.
			html mdlTextFieldInput
				id: html lastId;
				value: self model mqttIp;
				required;
				callback: [ :aString | self model mqttIp: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderSsidOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelSsid.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ssId;
				required;
				callback: [ :aString | self model ssId: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderWlanPwdOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelWlanPwd.
			html mdlTextFieldInput
				id: html lastId;
				value: self model wlanPwd;
				required;
				callback: [ :aString | self model wlanPwd: aString ] ]
]
