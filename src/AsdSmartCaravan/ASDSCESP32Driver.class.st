Class {
	#name : 'ASDSCESP32Driver',
	#superclass : 'ESP32Driver',
	#instVars : [
		'deviceIp',
		'deviceId'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCESP32Driver class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true

	
]

{ #category : 'magritte descriptions' }
ASDSCESP32Driver >> descriptionBrokerIp [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Broker IP';
		priority: 2;
		accessor: #brokerIp;
		beRequired;
		requiredErrorMessage: 'Bitte die IP für den mqtt Server eingeben';
		comment: 'IP für den mqtt Server';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : 'magritte descriptions' }
ASDSCESP32Driver >> descriptionDeviceId [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Device Id';
		priority: 1;
		accessor: #deviceId;
		beRequired;
		requiredErrorMessage: 'Bitte eine Id für das Endgerät eingeben';
		comment: 'Bitte einen Namen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : 'magritte descriptions' }
ASDSCESP32Driver >> descriptionDeviceIp [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Device IP';
		priority: 3;
		accessor: #deviceIp;
		
		comment: 'IP für das Endgerät';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : 'magritte descriptions' }
ASDSCESP32Driver >> descriptionDeviceName [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Device Name';
		priority: 4;
		accessor: #deviceName;
		beRequired;
		requiredErrorMessage: 'Bitte einen Namen für das Endgerät eingeben';
		comment: 'Name für das Endgerät';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : 'accessing' }
ASDSCESP32Driver >> deviceId [

	^ deviceId
]

{ #category : 'accessing' }
ASDSCESP32Driver >> deviceId: anObject [

	deviceId := anObject
]

{ #category : 'accessing' }
ASDSCESP32Driver >> deviceIp [

	^ deviceIp
]

{ #category : 'accessing' }
ASDSCESP32Driver >> deviceIp: anObject [

	deviceIp := anObject
]

{ #category : 'initialization' }
ASDSCESP32Driver >> initialize [

	super initialize.
]
