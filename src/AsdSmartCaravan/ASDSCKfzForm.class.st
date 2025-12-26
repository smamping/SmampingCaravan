Class {
	#name : 'ASDSCKfzForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelBj',
		'labelBreite',
		'labelDisplays',
		'labelGas',
		'labelHeizung',
		'labelHersteller',
		'laderegler',
		'labelLaenge',
		'labelMultimediaSystem',
		'wassertank',
		'webCam'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCKfzForm class >> componentTitle [

	^ 'SystemForm'
]

{ #category : 'initialization' }
ASDSCKfzForm >> initialize [

	super initialize.
	labelBj := 'Bau jahr'.
	labelGas := 'Gas Stand'.
	labelHeizung := 'Heizungssteuerung'.
	labelHersteller := 'Hersteller'.
	labelLaenge := 'Länge Kfz (in Meter)'.

	wassertank := 'Wasserstand'.
	labelMultimediaSystem := 'Multimediasystem'
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderBjOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'bj';
				with: labelBj.
			html mdlTextFieldInput
				id: 'bj';
				value: self model bj;
				required;
				callback: [ :aString | self model bj: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderBreiteOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'breite';
				with: labelBreite.
			html mdlTextFieldInput
				id: 'breite';
				value: self model breite;
				required;
				callback: [ :aString | self model breite: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderFieldsOn: html [

	self renderBjOn: html.
	self renderBreiteOn: html.
	self renderHerstellerOn: html.
	self renderLaengeOn: html.
	
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderHerstellerOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'hersteller';
				with: labelHersteller.
			html mdlTextFieldInput
				id: 'hersteller';
				value: self model hersteller;
				required;
				callback: [ :aString | self model hersteller: aString ] ]
]

{ #category : 'rendering' }
ASDSCKfzForm >> renderIpMultimediaOn: html [

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

{ #category : 'rendering' }
ASDSCKfzForm >> renderLaengeOn: html [

	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'laenge';
				with: labelLaenge.
			html mdlTextFieldInput
				id: 'laenge';
				value: self model laenge;
				required;
				callback: [ :aString | self model laenge: aString ] ]
]
