Class {
	#name : #ASDSCDevice,
	#superclass : #ASDModel,
	#instVars : [
		'driver',
		'pinNr',
		'pin',
		'deviceValue',
		'displayValue'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCDevice class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDSCDevice class >> newFromDriver: aDriver [

	^ self new
		  driver: aDriver;
		  yourself
]

{ #category : #'instance creation' }
ASDSCDevice class >> newFromDriver: aDriver AndPinNr: aPinNr [

	^ self new
		  	driver:aDriver;
			pinNr: aPinNr;
		  yourself
]

{ #category : #accessing }
ASDSCDevice class >> type [

	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDSCDevice class >> types [
	^ OrderedCollection
		newFrom:
			{'Licht' . 'Heizung' . 'Termostat' . 'Wassertank' . 'BatterieStand'.
			'GasStand'}
]

{ #category : #'magritte descriptions' }
ASDSCDevice >> bezDescription [

	<magritteDescription>
	^ MAStringDescription new
		  priority: 10;
		  label: 'Bezeichnung';
		  accessor: #bez;
		  beRequired;
		  requiredErrorMessage: 'Bitte eine Bezeichnung eingeben';
		  comment: 'Bitte eine Bezeichnung eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #accessing }
ASDSCDevice >> deviceValue [

	^ deviceValue
]

{ #category : #accessing }
ASDSCDevice >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self type;
			  space;
			  nextPutAll: self bez;
			  space ]
]

{ #category : #accessing }
ASDSCDevice >> displayValue [

	^ displayValue
]

{ #category : #accessing }
ASDSCDevice >> driver [

	^ driver
]

{ #category : #accessing }
ASDSCDevice >> driver: anObject [

	driver := anObject
]

{ #category : #initalize }
ASDSCDevice >> initialize [

	super initialize.
	deviceValue := 0.
	displayValue := 'Aus'.
	self type: self class type
]

{ #category : #accessing }
ASDSCDevice >> pinNr [

	^ pinNr
]

{ #category : #accessing }
ASDSCDevice >> pinNr: anObject [

	pinNr := anObject
]

{ #category : #'magritte descriptions' }
ASDSCDevice >> pinNrDescription [

	<magritteDescription>
	^ MAStringDescription new
		  priority: 11;
		  label: 'Pin Nr.';
		  accessor: #pinNr;
		  beRequired;
		  requiredErrorMessage: 'Bitte eine Pin Nr. eingeben';
		  comment: 'Bitte eine Pin Nr. eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]
