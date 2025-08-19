Class {
	#name : #ASDSCSystemComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'model',
		'form',
		'label'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #hooks }
ASDSCSystemComponent >> children [

	^ { self form  }
]

{ #category : #accessing }
ASDSCSystemComponent >> form [

	^ form
]

{ #category : #accessing }
ASDSCSystemComponent >> form: anObject [

	form := anObject
]

{ #category : #initialization }
ASDSCSystemComponent >> initialize [

	super initialize.
	self session model system
		ifNil: [ self model: ASDSCSystem new ]
		ifNotNil: [ self model: self session model system ].

	self form: (ASDSCSystemForm withModel: self model)
]

{ #category : #accessing }
ASDSCSystemComponent >> label [

	^ label
]

{ #category : #accessing }
ASDSCSystemComponent >> label: anObject [

	label := anObject
]

{ #category : #accessing }
ASDSCSystemComponent >> model [

	^ model
]

{ #category : #accessing }
ASDSCSystemComponent >> model: anObject [

	model := anObject
]

{ #category : #rendering }
ASDSCSystemComponent >> renderContentOn: html [

	html form: [ 
		html mdlCard
			shadow: 3;
			mdlTypographyTextLeft;
			style: 'width: 100%; height: 100%;';
			class: 'mainCard';
			with: [ 
				html mdlCardTitleContainer with: [ 
						html mdlCardTitleText: self label level: 2 ].
				html mdlCardTextContainer with: [ html render: self form ].

				html mdlCardActions with: [ 
						html mdlButton
							colored;
							rippleEffect;
							mdlTypographyFontBold;
							beSubmit;
							
									 callback: [ "serializeForm;"
										 self session model system: self model.
										 self session rootComponent goToEditDriverView ];
							with: 'save' ] ] ]
]
