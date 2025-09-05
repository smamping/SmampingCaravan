Class {
	#name : #ASDSCEsp32DriverForm,
	#superclass : #ASDForm,
	#instVars : [
		'labelDeviceName',
		'labelBrokerIp',
		'labelDeviceId',
		'labelDeviceIp'
	],
	#category : #'AsdSmartCaravan-Forms'
}

{ #category : #accessing }
ASDSCEsp32DriverForm class >> componentTitle [

	^ 'Esp32Driver'
]

{ #category : #initialization }
ASDSCEsp32DriverForm >> initialize [

	super initialize.
	labelDeviceName := 'Device Name'.
	labelDeviceIp := 'ip Device'.
	labelBrokerIp := 'Ip Broker'.
	labelDeviceId := 'Device Id'.
	
]

{ #category : #accessing }
ASDSCEsp32DriverForm >> labelBrokerIp [

	^ labelBrokerIp
]

{ #category : #accessing }
ASDSCEsp32DriverForm >> labelDeviceId [

	^ labelDeviceId
]

{ #category : #accessing }
ASDSCEsp32DriverForm >> labelDeviceIp [

	^ labelDeviceIp
]

{ #category : #accessing }
ASDSCEsp32DriverForm >> labelDeviceName [

	^ labelDeviceName
]

{ #category : #rendering }
ASDSCEsp32DriverForm >> renderBrokerIPOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: 'brokerIP';
				with: self labelBrokerIp.
			html mdlTextFieldInput
				id: 'brokerIP';
				value: self model brokerIP;
				callback: [ :aString | self model brokerIP: aString ];
				 pattern: '^\S+$' errorMessage: 'kein leerstring'.
			html mdlTextFieldError: 'Bitte eine BrokerIp eingeben' ].
		
"	
MDLTextFieldWidget new
		  beFloatingLabel;
		  type: 'text';
		  label: gmailLabel;
		  pattern: '^\S+$' errorMessage: 'kein leerstring';
		  callback: [ :aString | self model gmail: aString ];
		  value: self model gmail"
]

{ #category : #rendering }
ASDSCEsp32DriverForm >> renderDeviceIdOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceId.
			html mdlTextFieldInput
				id: html lastId;
				value: self model deviceId;
				callback: [ :aString | self model deviceId: aString ] ]
]

{ #category : #rendering }
ASDSCEsp32DriverForm >> renderDeviceIpOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceIp.
			html mdlTextFieldInput
				id: html lastId;
				value: self model deviceIp;
				callback: [ :aString | self model deviceIp: aString ] ]
]

{ #category : #rendering }
ASDSCEsp32DriverForm >> renderDeviceNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceName.
			html mdlTextFieldInput
				id: html lastId;
				value: self model deviceName;
				callback: [ :aString | self model deviceName: aString ] ]
]

{ #category : #rendering }
ASDSCEsp32DriverForm >> renderFieldsOn: html [

	self renderBrokerIPOn: html.
	self renderDeviceIpOn: html.
	self renderDeviceIdOn: html.
	self renderDeviceNameOn: html
]
