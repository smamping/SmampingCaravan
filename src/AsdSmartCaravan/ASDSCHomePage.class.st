"
Description
--------------------

TODO
"
Class {
	#name : #ASDSCHomePage,
	#superclass : #ASDSCPageHome,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCHomePage class >> pageName [
	^ 'Home'
]

{ #category : #accessing }
ASDSCHomePage class >> priority [
	^ 1
]

{ #category : #initalize }
ASDSCHomePage >> initialize [
	super initialize.
	self session rootComponent header: ASDSCHeader new
]

{ #category : #rendering }
ASDSCHomePage >> renderContentOn: html [

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
