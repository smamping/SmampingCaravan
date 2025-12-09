Class {
	#name : 'ASDSCStartInstallModulePage',
	#superclass : 'ASDSCPage',
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCStartInstallModulePage class >> pageName [

	^ 'Start'
]

{ #category : 'accessing' }
ASDSCStartInstallModulePage class >> priority [
	^ 1
]

{ #category : 'initalize' }
ASDSCStartInstallModulePage >> initialize [

	super initialize.
	
]

{ #category : 'rendering' }
ASDSCStartInstallModulePage >> rendeModalLoginButtonOn: html [

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

{ #category : 'rendering' }
ASDSCStartInstallModulePage >> renderContentOn: html [

	| ready |
	ready := self session model installReady.

	ready
		ifTrue: [
			self rootComponent goToOverviewView. 
			]
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
