Class {
	#name : 'ASDSCDeviceModulLicht',
	#superclass : 'ASDSCModulModel',
	#instVars : [
		'deviceSensorMotion',
		'motionSensorOn',
		'withMotion'
	],
	#category : 'AsdSmartCaravan-Model',
	#package : 'AsdSmartCaravan',
	#tag : 'Model'
}

{ #category : 'voyage' }
ASDSCDeviceModulLicht class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht class >> type [

	^ 'Licht'
]

{ #category : 'magritte descriptions' }
ASDSCDeviceModulLicht >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : 'magritte descriptions' }
ASDSCDeviceModulLicht >> descriptionDeviceSensorMotion [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			id:'sensorMotion';
			componentClass: MAExternalEditorComponent;
			classes: (Array with: ASDSCDeviceSensorBewegungsmelder);
			accessor: #deviceSensorMotion;
			label: 'Bewegungs Melder';
			priority: 50;
			yourself
]

{ #category : 'magritte descriptions' }
ASDSCDeviceModulLicht >> descriptionDriver [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			id:'esp32Treiber';
			componentClass: MAExternalEditorComponent;
			classes: (Array with: ASDSCESP32Driver);
			accessor: #driver;
			label: 'ESP32 treiber';
			priority: 50;
			yourself
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> deviceSensorMotion [

	^ deviceSensorMotion
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> deviceSensorMotion: anObject [

	deviceSensorMotion := anObject
]

{ #category : 'initialize' }
ASDSCDeviceModulLicht >> initialize [

	super initialize.
	self bez: self class type.
	self withMotion: true.
	self motionSensorOn: true
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> motionSensorOn [

	^ motionSensorOn
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> motionSensorOn: anObject [

	motionSensorOn := anObject
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> withMotion [

	^ withMotion
]

{ #category : 'accessing' }
ASDSCDeviceModulLicht >> withMotion: anObject [

	withMotion := anObject
]
