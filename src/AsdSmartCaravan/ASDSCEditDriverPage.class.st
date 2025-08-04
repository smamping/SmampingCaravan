Class {
	#name : #ASDSCEditDriverPage,
	#superclass : #ASDSCPageAdmin,
	#instVars : [
		'taskComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditDriverPage class >> pageName [

	^ 'Treiber'
]

{ #category : #accessing }
ASDSCEditDriverPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCEditDriverPage >> children [
	^ { self taskComponente }
]

{ #category : #initalize }
ASDSCEditDriverPage >> initialize [

	super initialize.
	
	self taskComponente: ASDSCInstallTask new
]

{ #category : #rendering }
ASDSCEditDriverPage >> renderContentOn: html [
	html div
		style: 'min-height: 400px;';
		with: 'Hello world#############################################################################################################################################'
]

{ #category : #accessing }
ASDSCEditDriverPage >> taskComponente [
	^ taskComponente
]

{ #category : #accessing }
ASDSCEditDriverPage >> taskComponente: anObject [
	taskComponente := anObject
]
