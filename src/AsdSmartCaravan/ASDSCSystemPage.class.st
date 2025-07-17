Class {
	#name : #ASDSCSystemPage,
	#superclass : #ASDSCPage,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCSystemPage class >> pageName [
	^ 'System'
]

{ #category : #accessing }
ASDSCSystemPage class >> priority [
	^ 2
]

{ #category : #rendering }
ASDSCSystemPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
