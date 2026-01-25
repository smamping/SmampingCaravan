Class {
	#name : 'ASDSCSystemForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelHostName',
		'labelIp',
		'labelMqttIp',
		'labelSsid',
		'labelWlanPwd',
		'labelIpCam',
		'labelIpMultimedia'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCSystemForm class >> componentTitle [

	^ 'SystemForm'
]

{ #category : 'initialization' }
ASDSCSystemForm >> initialize [

	super initialize.
	labelHostName := 'Hostname'.
	labelIp := 'ip Adresse'.
	labelMqttIp := 'Ip Broker'.
	labelSsid := 'Wlan Name'.
	labelWlanPwd := 'Wlan Passwort'.
	labelIpCam := 'Ip Kamera'.
	labelIpMultimedia := 'Ip Multimediasystem'
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelHostName [

	^ labelHostName
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelIp [

	^ labelIp
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelIpCam [

	^ labelIpCam
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelIpMultimedia [

	^ labelIpMultimedia
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelMqttIp [

	^ labelMqttIp
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelSsid [

	^ labelSsid
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> labelWlanPwd [

	^ labelWlanPwd
]

{ #category : 'rendering' }
ASDSCSystemForm >> renderFieldsOn: html [

	self renderIpOn: html.
	self renderMqttIpOn: html.
	self renderIpCamOn: html.
	self renderIpMultimediaOn: html.
	self renderSsidOn: html.
	self renderWlanPwdOn: html
]

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderHostNameOn: html [

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

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderIpCamOn: html [

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
ASDSCSystemForm >> renderIpMultimediaOn: html [

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

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderIpOn: html [

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

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderMqttIpOn: html [

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

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderSsidOn: html [

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

{ #category : 'as yet unclassified' }
ASDSCSystemForm >> renderWlanPwdOn: html [

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
