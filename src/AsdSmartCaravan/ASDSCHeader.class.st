"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : 'ASDSCHeader',
	#superclass : 'ASDSCComponent',
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'tooltipLabelopenRightPanel',
		'tooltipLabelCloseRightPanel',
		'titleLabel'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'initialization' }
ASDSCHeader >> initialize [

super initialize.
	self tooltipLabelopenRightPanel: 'Rechtes Panel öffnen'.
	self tooltipLabelCloseRightPanel: 'Rechtes Panel schliessen'.
	self titleLabel: 'SmartCaravan'
]

{ #category : 'accessing' }
ASDSCHeader >> possiblePages [
	^ ASDSCPage pagesToDisplay
]

{ #category : 'rendering' }
ASDSCHeader >> rendeModalLoginButtonOn: html [
	html
		render:
			(MDLLoginDialogWidget new
				callback:
						[ :login :password | self rootComponent tryConnectionWithLogin: login andPassword: password ];
				yourself)
]

{ #category : 'rendering' }
ASDSCHeader >> renderAccountButtonOn: html [

	html mdlNavigation: [ 
		html mdlButton icon
			id: #bottomLeftButton;
			with: [ html mdlIcon: #account_circle ].
		] 
]

{ #category : 'rendering' }
ASDSCHeader >> renderButtonMenu: html [

	self session isLogged ifFalse: [ ^ self ].
	html mdlNavigation: [ 
		html mdlButton icon
			id: #bottomLeftButton;
			with: [ html mdlIcon: #settings ].
		
		html mdlAnchorButton
			icon;
			id: html nextId;
			class: 'openNav';
			with: [ html mdlIcon: 'more_vert' ].
		html mdlTooltip
			for: html lastId;
			with: self tooltipLabelopenRightPanel ]
]

{ #category : 'rendering' }
ASDSCHeader >> renderButtonsOn: html [

	self session isLogged ifTrue: [ 
		html mdlNavigation: [ 
			self renderAccountButtonOn: html.
			self renderButtonMenu: html ] ]
]

{ #category : 'rendering' }
ASDSCHeader >> renderContentOn: html [

	html mdlLayoutHeader
		transparent;
		with: [ "self renderDrawerOn: html"
			html mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ self session rootComponent goToHomeView ];
						with: [ html mdlLayoutTitle: self titleLabel ].
					html mdlLayoutSpacer.
					"html text: '	Version ' , self rootComponent class version."
					self renderButtonsOn: html
					"html text: '	Version ' , self rootComponent class version." ] ].
	self renderDrawerOn: html
]

{ #category : 'rendering' }
ASDSCHeader >> renderDrawerOn: html [
	
	html
		mdlLayoutDrawer: [ html mdlLayoutTitle: 'Title'.
			html
				mdlNavigation: [ self possiblePages
						do: [ :aClass | 
							html mdlNavigationLink
								beCurrentIf: aClass = self rootComponent componentToDisplay class;
								callback: [ self displayInstanceOf: aClass ];
								with: aClass pageName ] ] ]
]

{ #category : 'rendering' }
ASDSCHeader >> renderTabBarOn: html [

	html mdlLayoutTabBar: [ 
		self possiblePages do: [ :aClass | 
			html mdlLayoutTab
				callback: [ self displayInstanceOf: aClass ];
				isActiveIf: aClass = self rootComponent componentToDisplay class;
				with: aClass pageName ] ]
]

{ #category : 'accessing' }
ASDSCHeader >> titleLabel [

	^ titleLabel
]

{ #category : 'accessing' }
ASDSCHeader >> titleLabel: anObject [

	titleLabel := anObject
]

{ #category : 'accessing' }
ASDSCHeader >> tooltipLabelCloseRightPanel [
	^ tooltipLabelCloseRightPanel
]

{ #category : 'accessing' }
ASDSCHeader >> tooltipLabelCloseRightPanel: anObject [
	tooltipLabelCloseRightPanel := anObject
]

{ #category : 'accessing' }
ASDSCHeader >> tooltipLabelopenRightPanel [
	^ tooltipLabelopenRightPanel
]

{ #category : 'accessing' }
ASDSCHeader >> tooltipLabelopenRightPanel: anObject [
	tooltipLabelopenRightPanel := anObject
]
