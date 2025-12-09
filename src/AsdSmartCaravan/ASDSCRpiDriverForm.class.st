Class {
	#name : 'ASDSCRpiDriverForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelDeviceName',
		'labelBrokerIp',
		'labelDeviceId',
		'labelDeviceIp'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCRpiDriverForm class >> componentTitle [

	^ 'RpiDriver'
]

{ #category : 'initialization' }
ASDSCRpiDriverForm >> initialize [

	super initialize.
	labelDeviceName := 'Device Name'.
	labelDeviceIp := 'ip Device'.
	labelBrokerIp := 'Ip Broker'.
	labelDeviceId := 'Device Id'.
	
]

{ #category : 'accessing' }
ASDSCRpiDriverForm >> labelBrokerIp [

	^ labelBrokerIp
]

{ #category : 'accessing' }
ASDSCRpiDriverForm >> labelDeviceId [

	^ labelDeviceId
]

{ #category : 'accessing' }
ASDSCRpiDriverForm >> labelDeviceIp [

	^ labelDeviceIp
]

{ #category : 'accessing' }
ASDSCRpiDriverForm >> labelDeviceName [

	^ labelDeviceName
]

{ #category : 'rendering' }
ASDSCRpiDriverForm >> renderBrokerIPOn: html [

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
				required.
				
			html mdlTextFieldError: 'Bitte eine BrokerIp eingeben' ]
]

{ #category : 'rendering' }
ASDSCRpiDriverForm >> renderDeviceIdOn: html [

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

{ #category : 'rendering' }
ASDSCRpiDriverForm >> renderDeviceIpOn: html [

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

{ #category : 'rendering' }
ASDSCRpiDriverForm >> renderDeviceNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceName.
			html mdlTextFieldInput
				id: html lastId;
				value: self model deviceName;
				required;
				callback: [ :aString | self model deviceName: aString ] ]
]

{ #category : 'rendering' }
ASDSCRpiDriverForm >> renderFieldsOn: html [

	self renderBrokerIPOn: html.
	self renderDeviceIpOn: html.
	self renderDeviceIdOn: html.
	self renderDeviceNameOn: html
]
