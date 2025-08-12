Class {
	#name : #ASDSCStartPage,
	#superclass : #ASDSCPageStart,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCStartPage class >> pageName [

	^ 'Start'
]

{ #category : #accessing }
ASDSCStartPage class >> priority [
	^ 1
]

{ #category : #initalize }
ASDSCStartPage >> initialize [

	super initialize.
	
]

{ #category : #rendering }
ASDSCStartPage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				class: 'grid-middle';
				id:'#system'
				middle;
				size: 3;
				with: [ 'Top' ].
			html mdlCell
				class: 'grid-cell-demo';
				id: '#energie'
				middle;
				size: 3;
				with: 'Middle'.
			html mdlCell
				class: 'grid-cell-demo';
				id: '#multimedia'
				middle;
				size: 3;
				with: 'Bottom'.
			html mdlCell
				class: 'grid-cell-demo';
				id: '#sicherheit'
				middle;
				size: 3;
				with: 'Stretch' ]
]
