Class {
	#name : 'ASDSCStartInstallModulePage',
	#superclass : 'ASDSCPageStartInstallModule',
	#instVars : [
		'menu'
	],
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

{ #category : 'hooks' }
ASDSCStartInstallModulePage >> children [

	^ { self menu }
]

{ #category : 'initalize' }
ASDSCStartInstallModulePage >> initialize [

	super initialize.
	self session rootComponent header: ASDSCStartInstallModuleHeader new
]

{ #category : 'accessing' }
ASDSCStartInstallModulePage >> menu [

	^ menu ifNil: [ menu := ASDSCModuleMenu new ]
]

{ #category : 'rendering' }
ASDSCStartInstallModulePage >> renderCardContentOn: html [

	html mdlCard
		style: 'overflow: visible; margin: auto; padding: 15px;';
		shadow: 2;
		with: [ 
			html mdlCardTitleContainer: [ 
					html mdlCardTitleText: 'Module' level: 2 ].
			html render: self menu ]
]

{ #category : 'rendering' }
ASDSCStartInstallModulePage >> renderContentOn: html [



	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				middle;
				size: 2.
			html mdlCell
				middle;
				size: 8;
				with: [  self renderCardContentOn: html ].
			html mdlCell
				middle;
				size: 2 ]
]
