Class {
	#name : #ASDSCFahrzeug,
	#superclass : #ASDModel,
	#instVars : [
		'bj',
		'hersteller',
		'laenge',
		'breite',
		'kfzModel'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCFahrzeug class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCFahrzeug >> bj [
	^ bj
]

{ #category : #accessing }
ASDSCFahrzeug >> bj: anObject [
	bj := anObject
]

{ #category : #accessing }
ASDSCFahrzeug >> breite [
	^ breite
]

{ #category : #accessing }
ASDSCFahrzeug >> breite: anObject [
	breite := anObject
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionBj [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Baujahr';
		  priority: 30;
		  accessor: #bj;
		  beRequired;
		  requiredErrorMessage: 'Bitte das Baujahr angeben';
		  comment: 'Bitte 4 Ziffern Format eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionBreite [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Breite';
		  priority: 50;
		  accessor: #breite;
		  beRequired;
		  requiredErrorMessage:
			  'Bitte die Breite eingeben';
		  comment: 'Bitte die Breite eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionHersteller [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Hersteller';
		  priority: 10;
		  accessor: #hersteller;
		  beRequired;
		  requiredErrorMessage: 'Ein Hersteller muss einen Namen haben';
		  comment: 'Bitte Hersteller Namen eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionKfzModel [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Fahrzeug Model';
		  priority: 20;
		  accessor: #kfzModel;
		  beRequired;
		  requiredErrorMessage: 'Bitte eine Fahrzeug Model Angabe machen';
		  comment: 'Bitte eine Fahrzeug Model Angabe machen';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCFahrzeug >> descriptionLaenge [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Länge (in cm)';
		  priority: 40;
		  accessor: #laenge;
		  beRequired;
		  requiredErrorMessage: 'Bitte eine Längen Angabe in cm machen';
		  comment: 'Bitte eine Längen Angabe in cm machen';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #accessing }
ASDSCFahrzeug >> hersteller [
	^ hersteller
]

{ #category : #accessing }
ASDSCFahrzeug >> hersteller: anObject [
	hersteller := anObject
]

{ #category : #accessing }
ASDSCFahrzeug >> kfzModel [
	^ kfzModel
]

{ #category : #accessing }
ASDSCFahrzeug >> kfzModel: anObject [
	kfzModel := anObject
]

{ #category : #accessing }
ASDSCFahrzeug >> laenge [
	^ laenge
]

{ #category : #accessing }
ASDSCFahrzeug >> laenge: anObject [
	laenge := anObject
]
