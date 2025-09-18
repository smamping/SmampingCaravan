Class {
	#name : #ASDSCEditModulePage,
	#superclass : #ASDSCPageEdit,
	#instVars : [
		'moduleComponenteLicht',
		'moduleComponenteHeizung'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditModulePage class >> pageName [

	^ 'Module'
]

{ #category : #accessing }
ASDSCEditModulePage class >> priority [

	^ 4
]

{ #category : #hooks }
ASDSCEditModulePage >> children [

	^ { self moduleComponenteLicht. self moduleComponenteHeizung }
]

{ #category : #initalize }
ASDSCEditModulePage >> initialize [

	| modulesLicht modulesHeizung |
	super initialize.
	modulesLicht := self session model deviceModulesLicht.
	modulesLicht size < 1
		ifTrue: [ 
			self moduleComponenteLicht:
				ASDSCObjectViewTableModulesLichtComponent new ]
		ifFalse: [ 
			self moduleComponenteLicht:
				(ASDSCObjectViewTableModulesLichtComponent withList:
					 modulesLicht) ].
	modulesHeizung := self session model deviceModulesHeizung.
	modulesHeizung size < 1
		ifTrue: [ 
			self moduleComponenteHeizung:
				ASDSCObjectViewTableModulesHeizungComponent new ]
		ifFalse: [ 
			self moduleComponenteHeizung:
				(ASDSCObjectViewTableModulesHeizungComponent withList:
					 modulesHeizung) ]
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponenteHeizung [

	^ moduleComponenteHeizung
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponenteHeizung: anObject [

	moduleComponenteHeizung := anObject
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponenteLicht [

	^ moduleComponenteLicht
]

{ #category : #accessing }
ASDSCEditModulePage >> moduleComponenteLicht: anObject [

	moduleComponenteLicht := anObject
]

{ #category : #rendering }
ASDSCEditModulePage >> renderContentOn: html [

	html mdlGrid
		shadow: 0;
		style: 'height: 100%;';
		with: [ 
			html mdlCell
				middle;
				size: 12;
				with: [ 
					html render: (MDLTabWidget new
								 addTabNamed: 'Licht Modul'
								 content: [ html render: self moduleComponenteLicht ];
								 addTabNamed: 'Heizungs Modul'
								 content: [ html render: self moduleComponenteHeizung ];
								 yourself) ] ]
]
