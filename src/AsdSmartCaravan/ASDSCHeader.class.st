"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDSCHeader,
	#superclass : #ASDSCComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'tooltipLabelopenRightPanel',
		'tooltipLabelCloseRightPanel'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #initialization }
ASDSCHeader >> initialize [

	super initialize.
	self tooltipLabelopenRightPanel: 'Rechtes Panel öffnen'.
	self tooltipLabelCloseRightPanel: 'Rechtes Panel schliessen'
]

{ #category : #accessing }
ASDSCHeader >> possiblePages [
	^ ASDSCPage pagesToDisplay
]

{ #category : #rendering }
ASDSCHeader >> rendeModalLoginButtonOn: html [
	html
		render:
			(MDLLoginDialogWidget new
				callback:
						[ :login :password | self rootComponent tryConnectionWithLogin: login andPassword: password ];
				yourself)
]

{ #category : #rendering }
ASDSCHeader >> renderAccountButtonOn: html [

	html mdlNavigation: [ 
		html mdlButton icon
			id: #bottomLeftButton;
			with: [ html mdlIcon: #account_circle ].
		html mdlMenu
			bottomRight;
			for: #bottomLeftButton;
			with: [ 
				html mdlMenuItem: 'Einstellungen'.
				html mdlMenuItem
					fullBleedDivider;
					with: 'Konto'.
				html mdlMenuItem
					disabled;
					with: 'Disabled Action'.
				html mdlMenuItem: 'Yet Another Action' ] ]
]

{ #category : #rendering }
ASDSCHeader >> renderButtonMenu: html [
	self session isLogged
		ifFalse: [ ^ self ].
	html
		mdlNavigation: [ "	html mdlAnchorButton
		icon;
		id: html nextId;
		class: 'closeNav';
		with: [ html mdlIcon: 'close_fullscreen' ].
	html mdlTooltip
		for: html lastId;
		with: self tooltipLabelCloseRightPanel"
			html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #settings ].
			html mdlMenu
				style: 'width: 200px; height 400px;';
				bottomRight;
				for: #bottomLeftButton;
				with: [  ].
			html mdlAnchorButton
				icon;
				id: html nextId;
				class: 'openNav';
				with: [ html mdlIcon: 'more_vert' ].
			html mdlTooltip
				for: html lastId;
				with: self tooltipLabelopenRightPanel ]
]

{ #category : #rendering }
ASDSCHeader >> renderButtonsOn: html [

	self session isLogged ifTrue: [ 
		html mdlNavigation: [ 
			self renderAccountButtonOn: html.
			self renderButtonMenu: html ] ]
]

{ #category : #rendering }
ASDSCHeader >> renderContentOn: html [
	html mdlLayoutHeader
		transparent;
		with: [ "self renderDrawerOn: html"
			html
				mdlLayoutHeaderRow: [ self renderButtonsOn: html
					"html text: '	Version ' , self rootComponent class version." ]].
			self renderDrawerOn: html 
]

{ #category : #rendering }
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

{ #category : #rendering }
ASDSCHeader >> renderTabBarOn: html [

	html mdlLayoutTabBar: [ 
		self possiblePages do: [ :aClass | 
			html mdlLayoutTab
				callback: [ self displayInstanceOf: aClass ];
				isActiveIf: aClass = self rootComponent componentToDisplay class;
				with: aClass pageName ] ]
]

{ #category : #accessing }
ASDSCHeader >> tooltipLabelCloseRightPanel [
	^ tooltipLabelCloseRightPanel
]

{ #category : #accessing }
ASDSCHeader >> tooltipLabelCloseRightPanel: anObject [
	tooltipLabelCloseRightPanel := anObject
]

{ #category : #accessing }
ASDSCHeader >> tooltipLabelopenRightPanel [
	^ tooltipLabelopenRightPanel
]

{ #category : #accessing }
ASDSCHeader >> tooltipLabelopenRightPanel: anObject [
	tooltipLabelopenRightPanel := anObject
]
