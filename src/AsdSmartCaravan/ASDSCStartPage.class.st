Class {
	#name : #ASDSCStartPage,
	#superclass : #ASDSCPage,
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
ASDSCStartPage >> rendeModalLoginButtonOn: html [

	html form: [ 
		html render: (ASDLoginCardWidget new
				 callback: [ :login :password | 
					 self rootComponent
						 tryConnectionWithLogin: login
						 andPassword: password ];
				 yourself) ].
	self rootComponent class development ifTrue: [ 
		html anchor
			callback: [ self show: (WAInspector current on: self session) ];
			with: 'Inspect Session' ]
]

{ #category : #rendering }
ASDSCStartPage >> renderContentOn: html [
|ready|
	ready := self session model installReady.
	ready printString.
	ready
		ifTrue: [ 
			html mdlGrid
				shadow: 0;
				style: 'align-items: center; height: 100%';
				with: [ 
					html mdlCell
						middle;
						desktopOffset: 3;
						tabletOffset: 3;
						phoneOffset: 2;
						desktopSize: 8;
						tabletSize: 5;
						phoneSize: 2;
						with: [ html div ] ] ]
		ifFalse: [ 
			html mdlGrid
				shadow: 0;
				style: 'align-items: center; height: 100%';
				with: [ 
					html mdlCell
						middle;
						desktopOffset: 3;
						tabletOffset: 3;
						phoneOffset: 2;
						desktopSize: 8;
						tabletSize: 5;
						phoneSize: 2;
						with: [ self rendeModalLoginButtonOn: html ] ] ]
]
