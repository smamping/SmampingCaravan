Class {
	#name : 'ASDSCRequestForm',
	#superclass : 'ASDForm',
	#instVars : [
		'labelDeviceBezeichnung'
	],
	#category : 'AsdSmartCaravan-Forms',
	#package : 'AsdSmartCaravan',
	#tag : 'Forms'
}

{ #category : 'accessing' }
ASDSCRequestForm class >> componentTitle [

	^ 'Endgeräte'
]

{ #category : 'initialization' }
ASDSCRequestForm >> initialize [

	super initialize.
	labelDeviceBezeichnung := 'Name'.
	
]

{ #category : 'accessing' }
ASDSCRequestForm >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : 'rendering' }
ASDSCRequestForm >> renderButtonOn: html [

	html div
		class: 'mdl-typography--text-right';
		with: [
			html mdlButton
				raised;
				rippleEffect;
				beSubmit;
				callback: [ self answer: nil ];
				with: 'abbrechen'.
			html space.
			html mdlButton
				raised;
				primaryColor;
				beSubmit;
				id: #request;
				disabled: 'disabled';
				callback: [ self answer: self model ];
				with: 'ok' ]
]

{ #category : 'rendering' }
ASDSCRequestForm >> renderDeviceBezeichnungOn: html [
| list str |
	html mdlTextFieldContainer
		style: 'width: 350px';
		with: [
			html mdlTextFieldLabel
				for: 'bezeichnung';
				with: self labelDeviceBezeichnung.
			html mdlTextFieldInput
				id: 'bezeichnung';
				value: self model bez;
				onChange: (html jQuery ajax
						 serializeForm;
						 callback: [
							 list := self session model perform: str with: self model bez ];
						 script: [ :s |
							 s << (s jQuery: 'span.mdl-textfield__error') html: [ :ajaxHtml |
									 list count > 0
										 ifTrue: [ ajaxHtml show ]
										 ifFalse: [ ajaxHtml hide ] ].
							 s << (s jQuery: #request) html: [ :r |
									 list count > 0
										 ifTrue: [ r attributesAt: 'disabled' do: 'true' ]
										 ifFalse: [ r attributesAt: 'disabled' do: 'false' ] ] ]);
				callback: [ :aString | self model bez: aString ].
			html mdlTextFieldError: 'Input is not a number !' ]
]

{ #category : 'rendering' }
ASDSCRequestForm >> renderFieldsOn: html [

html form: [
	self renderDeviceBezeichnungOn: html.
	self renderButtonOn: html
	]
]
