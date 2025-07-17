Class {
	#name : #ASDSCAdminPage,
	#superclass : #ASDSCPageAdmin,
	#instVars : [
		'taskComponente'
	],
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCAdminPage class >> pageName [
	^ 'Übersicht'
]

{ #category : #accessing }
ASDSCAdminPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDSCAdminPage >> children [
	^ { self taskComponente }
]

{ #category : #initalize }
ASDSCAdminPage >> initialize [

	super initialize.
	
	self taskComponente: ASDSCInstallTask new
]

{ #category : #rendering }
ASDSCAdminPage >> renderContentOn: html [
	html div
		style: 'min-height: 400px;';
		with: 'Hello world#############################################################################################################################################'
]

{ #category : #accessing }
ASDSCAdminPage >> taskComponente [
	^ taskComponente
]

{ #category : #accessing }
ASDSCAdminPage >> taskComponente: anObject [
	taskComponente := anObject
]
