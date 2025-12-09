"
Description
--------------------

TODO
"
Class {
	#name : 'ASDSCHomePage',
	#superclass : 'ASDSCPageHome',
	#category : 'AsdSmartCaravan-Pages',
	#package : 'AsdSmartCaravan',
	#tag : 'Pages'
}

{ #category : 'accessing' }
ASDSCHomePage class >> pageName [
	^ 'Home'
]

{ #category : 'accessing' }
ASDSCHomePage class >> priority [
	^ 1
]

{ #category : 'initalize' }
ASDSCHomePage >> initialize [
	super initialize.
	self session rootComponent header: ASDSCHeader new
]

{ #category : 'rendering' }
ASDSCHomePage >> renderCardCarSystemOn: html [

	html anchor
		title: 'Close';
		callback: [ self rootComponent goToHomeView ];
		with: [ 
			html mdlCard
				shadow: 3;
				mdlTypographyTextLeft;
				style: 'width: 100%; height: 100%;';
				class: 'mainCard';
				with: [ 
					html mdlCardTitleContainer with: [ 
							html mdlCardTitleText: 'CarSystem' level: 2 ].
					html mdlCardTextContainer with: [ '   ' ] ] ]
]

{ #category : 'rendering' }
ASDSCHomePage >> renderCardMultiMediaOn: html [

	html anchor
		title: 'Close';
		callback: [ self rootComponent goToHomeView ];
		with: [ 
			html mdlCard
				shadow: 3;
				mdlTypographyTextLeft;
				style: 'width: 100%; height: 100%;';
				class: 'mainCard';
				with: [ 
					html mdlCardTitleContainer with: [ 
							html mdlCardTitleText: '' level: 2 ].
					html mdlCardTextContainer with: [ 'Multimedia' ] ] ]
]

{ #category : 'rendering' }
ASDSCHomePage >> renderContentOn: html [

	html mdlGrid
				shadow: 0;
				style: 'align-items: center; height: 100%';
				with: [ 
					html mdlCell
						middle;
						size: 12;
						with: [ 
							html mdlGrid
								shadow: 0;
								style: 'align-items: center; height: 100%';
								with: [ 
									html mdlCell
										middle;
										size: 4;
										with: [ self renderCardCarSystemOn: html ].
									html mdlCell
										middle;
										size: 4;
										with: [  ].
									html mdlCell
										middle;
										size: 4;
										with: [  ] ] ] ] 
]
