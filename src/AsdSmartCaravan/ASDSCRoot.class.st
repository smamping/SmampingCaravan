"
Description
--------------------

I am the root component of AsdSmartCaravan. I will contain every components of the application to display.

I have a header.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #ASDSCRoot,
	#superclass : #ASDSCComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'rightPanel'
	],
	#category : #'AsdSmartCaravan-Core'
}

{ #category : #testing }
ASDSCRoot class >> canBeRoot [
	^ true
]

{ #category : #testing }
ASDSCRoot class >> development [ 
	^ true
]

{ #category : #initialization }
ASDSCRoot class >> initialize [
	self environment
		at: #WADevelopmentConfiguration
		ifPresent: [ :class | WAAdmin applicationDefaults addParent: class instance ].	"Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'AsdSmartCaravan')
		preferenceAt: #sessionClass put: ASDSCSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: ASDSCLibrary;
		yourself
]

{ #category : #'world menu' }
ASDSCRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'AsdSmartCaravan')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
ASDSCRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/AsdSmartCaravan'
]

{ #category : #testing }
ASDSCRoot class >> version [

	^ '00.00.05'
]

{ #category : #hooks }
ASDSCRoot >> children [
	^ {self header.
	self componentToDisplay.
	self rightPanel}
]

{ #category : #accessing }
ASDSCRoot >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
ASDSCRoot >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
ASDSCRoot >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
ASDSCRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
ASDSCRoot >> defaultHeader [
	^ ASDSCHeader new
]

{ #category : #updating }
ASDSCRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #actions }
ASDSCRoot >> goToAdminView [
	self displayInstanceOf: ASDSCAdminPage
]

{ #category : #actions }
ASDSCRoot >> goToOverviewView [
	self displayInstanceOf: ASDSCHomePage
]

{ #category : #accessing }
ASDSCRoot >> header [
	^ header
]

{ #category : #accessing }
ASDSCRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
ASDSCRoot >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header possiblePages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
ASDSCRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self session rootComponent: self.
	self rightPanel: ASDComponentWithRightPanel new.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #rendering }
ASDSCRoot >> renderContentOn: html [

	html mdlLayout
		fixedHeader;
		with: [ 
			html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ 
					html mdlGrid
						noSpacing;
						with: [ "noSpacing;""html render: self footer"
							html mdlCell
								class: 'rootComponent';
								size: 12;
								stretch;
								with: [ 
									html div
										id: #main;
										with: [ html render: self componentToDisplay ].
									html render: self rightPanel ] ] ] ].
	self renderEmptyGenericDialogOn: html
]

{ #category : #accessing }
ASDSCRoot >> rightPanel [
	^ rightPanel
]

{ #category : #accessing }
ASDSCRoot >> rightPanel: anObject [
	rightPanel := anObject
]

{ #category : #actions }
ASDSCRoot >> tryConnectionWithLogin: login andPassword: password [
	| user |
	user := self session model userFromLogin: login andPassword: password.

	"self halt."
	user
		ifNotNil: [ :arg | 
			self session currentUser: arg.

			"arg logged: true."
			
			self session first: true.
			arg isAdmin 
				ifTrue: [  self goToAdminView ]
						
				ifFalse: [ self goToOverviewView ] ]
		ifNil: [ 
			self goToOverviewView ]
]

{ #category : #updating }
ASDSCRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Smarter Caravan'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
ASDSCRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
