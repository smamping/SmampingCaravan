Class {
	#name : #ASDSCEditSystemPage,
	#superclass : #ASDSCPageAdmin,
	#instVars : [
		'taskComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEditSystemPage class >> pageName [

	^ 'System'
]

{ #category : #accessing }
ASDSCEditSystemPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCEditSystemPage >> children [
	^ { self taskComponente }
]

{ #category : #initalize }
ASDSCEditSystemPage >> initialize [

	super initialize.
	
	self taskComponente: ASDSCInstallTask new
]

{ #category : #rendering }
ASDSCEditSystemPage >> renderContentOn: html [
	html div
		style: 'min-height: 400px;';
		with: 'Hello world#############################################################################################################################################'
]

{ #category : #accessing }
ASDSCEditSystemPage >> taskComponente [
	^ taskComponente
]

{ #category : #accessing }
ASDSCEditSystemPage >> taskComponente: anObject [
	taskComponente := anObject
]
