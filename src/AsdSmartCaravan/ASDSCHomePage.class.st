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
		shadow: 2;
		style: 'height: 100%;';
		with: [ html mdlCell
				class: 'grid-middle';
				middle;
				size: 3;
				with: 'Top'.
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 3;
				with: 'Middle'.
			html mdlCell
				class: 'grid-cell-demo';
				bottom;
				size: 3;
				with: 'Bottom'.
			html mdlCell
				class: 'grid-cell-demo';
				stretch;
				size: 3;
				with: 'Stretch' ]
]
