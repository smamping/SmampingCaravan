Class {
	#name : #ASDSCSystemPageKomponentView,
	#superclass : #ASDSCPageCarSystem,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCSystemPageKomponentView class >> pageName [

	^ 'KomponentenModul Ansicht'
]

{ #category : #accessing }
ASDSCSystemPageKomponentView class >> priority [
	^ 2
]

{ #category : #rendering }
ASDSCSystemPageKomponentView >> renderContentOn: html [

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
