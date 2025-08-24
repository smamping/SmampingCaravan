Class {
	#name : #ASDSCSystemPage,
	#superclass : #ASDSCPageCarSystem,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCSystemPage class >> pageName [

	^ 'FahrzeugSystem'
]

{ #category : #accessing }
ASDSCSystemPage class >> priority [
	^ 2
]

{ #category : #rendering }
ASDSCSystemPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				class: 'grid-middle';
				id: '#licht' middle;
				size: 3;
				with: [ 'Top' ].
			html mdlCell
				class: 'grid-cell-demo';
				id: '#sensoren' middle;
				size: 3;
				with: 'Middle'.
			html mdlCell
				class: 'grid-cell-demo';
				id: '#tuer' middle;
				size: 3;
				with: 'Bottom'.
			html mdlCell
				class: 'grid-cell-demo';
				id: '#heizen' middle;
				size: 3;
				with: 'Stretch' ]
]
