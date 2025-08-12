Class {
	#name : #ASDSCESP32Driver,
	#superclass : #ESP32Driver,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCESP32Driver class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true

	
]

{ #category : #descriptions }
ASDSCESP32Driver >> brokerIPDescription [

	<magritteDescription>
	^ MAStringDescription new
		  priority: 10;
		  label: 'IP Mqtt';
		  accessor: #brokerIP;
		  beRequired;
		  requiredErrorMessage: 'Bitte eine Mqtt IP eingeben ';
		  comment: 'Bitte eine Mqtt IP eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #descriptions }
ASDSCESP32Driver >> deviceNameDescription [

	<magritteDescription>
	^ MAStringDescription new
		  priority: 20;
		  label: 'Name';
		  accessor: #deviceName;
		  beRequired;
		  requiredErrorMessage: 'Bitte einen Namen eingeben ';
		  comment: 'Bitte einen Namen eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #initialization }
ASDSCESP32Driver >> initialize [

	super initialize.
]
