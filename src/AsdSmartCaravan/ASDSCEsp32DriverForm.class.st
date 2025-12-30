Class {
	#name : 'ASDSCEsp32DriverForm',
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
ASDSCEsp32DriverForm class >> componentTitle [

	^ 'Esp32Driver'
]

{ #category : 'initialization' }
ASDSCEsp32DriverForm >> initialize [

	super initialize.
	labelDeviceName := 'Device Name'.
	labelDeviceIp := 'ip Device'.
	labelBrokerIp := 'Ip Broker'.
	labelDeviceId := 'Device Id'.
	
]

{ #category : 'accessing' }
ASDSCEsp32DriverForm >> labelBrokerIp [

	^ labelBrokerIp
]

{ #category : 'accessing' }
ASDSCEsp32DriverForm >> labelDeviceId [

	^ labelDeviceId
]

{ #category : 'accessing' }
ASDSCEsp32DriverForm >> labelDeviceIp [

	^ labelDeviceIp
]

{ #category : 'accessing' }
ASDSCEsp32DriverForm >> labelDeviceName [

	^ labelDeviceName
]

{ #category : 'rendering' }
ASDSCEsp32DriverForm >> renderBrokerIPOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'brokerIP';
				with: self labelBrokerIp.
			html mdlTextFieldInput
				id: 'brokerIP';
				class: 'frm';
				value: self model brokerIP;
				callback: [ :aString | self model brokerIP: aString ];
				required.

			html mdlTextFieldError: 'Bitte eine BrokerIp eingeben' ]
]

{ #category : 'rendering' }
ASDSCEsp32DriverForm >> renderDeviceIdOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'deviceId';
				with: self labelDeviceId.
			html mdlTextFieldInput
				class: 'frm';
				id: 'deviceId';
				value: self model deviceId;
				callback: [ :aString | self model deviceId: aString ] ]
]

{ #category : 'rendering' }
ASDSCEsp32DriverForm >> renderDeviceIpOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDeviceIp.
			html mdlTextFieldInput
				class: 'frm';
				id: html lastId;
				value: self model deviceIp;
				callback: [ :aString | self model deviceIp: aString ] ]
]

{ #category : 'rendering' }
ASDSCEsp32DriverForm >> renderDeviceNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'deviceName';
				with: self labelDeviceName.
			html mdlTextFieldInput
				id: 'deviceName';
				class: 'frm';
				value: self model deviceName;
				required;
				callback: [ :aString | self model deviceName: aString ] ]
]

{ #category : 'rendering' }
ASDSCEsp32DriverForm >> renderFieldsOn: html [

	self renderBrokerIPOn: html.
	self renderDeviceIpOn: html.
	self renderDeviceIdOn: html.
	self renderDeviceNameOn: html
]
