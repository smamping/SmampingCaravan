Class {
	#name : #ASDSCSystemForm,
	#superclass : #ASDForm,
	#instVars : [
		'labelHostName',
		'labelIp',
		'labelMqttIp',
		'labelSsid',
		'labelWlanPwd',
		'labelIpCam',
		'labelIpMultimedia'
	],
	#category : #'AsdSmartCaravan-Forms'
}

{ #category : #accessing }
ASDSCSystemForm class >> componentTitle [

	^ 'SystemForm'
]

{ #category : #initialization }
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

{ #category : #accessing }
ASDSCSystemForm >> labelHostName [

	^ labelHostName
]

{ #category : #accessing }
ASDSCSystemForm >> labelIp [

	^ labelIp
]

{ #category : #accessing }
ASDSCSystemForm >> labelIpCam [

	^ labelIpCam
]

{ #category : #accessing }
ASDSCSystemForm >> labelIpMultimedia [

	^ labelIpMultimedia
]

{ #category : #accessing }
ASDSCSystemForm >> labelMqttIp [

	^ labelMqttIp
]

{ #category : #accessing }
ASDSCSystemForm >> labelSsid [

	^ labelSsid
]

{ #category : #accessing }
ASDSCSystemForm >> labelWlanPwd [

	^ labelWlanPwd
]

{ #category : #rendering }
ASDSCSystemForm >> renderFieldsOn: html [

	self renderIpOn: html.
	self renderMqttIpOn: html.
	self renderIpCamOn: html.
	self renderIpMultimediaOn: html.
	self renderSsidOn: html.
	self renderWlanPwdOn: html
]

{ #category : #rendering }
ASDSCSystemForm >> renderHostNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelHostName.
			html mdlTextFieldInput
				id: html lastId;
				
				value: self model hostName;
				callback: [ :aString | self model hostName: aString ] ]
]

{ #category : #rendering }
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

{ #category : #rendering }
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

{ #category : #rendering }
ASDSCSystemForm >> renderIpOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelIp.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ip;
				callback: [ :aString | self model ip: aString ] ]
]

{ #category : #rendering }
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
				callback: [ :aString | self model mqttIp: aString ] ]
]

{ #category : #rendering }
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
				callback: [ :aString | self model ssId: aString ] ]
]

{ #category : #rendering }
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
				callback: [ :aString | self model wlanPwd: aString ] ]
]
