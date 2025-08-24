Class {
	#name : #ASDSCEnergiePage,
	#superclass : #ASDSCPage,
	#category : #'AsdSmartCaravan-Pages'
}

{ #category : #accessing }
ASDSCEnergiePage class >> pageName [

	^ 'Energie'
]

{ #category : #accessing }
ASDSCEnergiePage class >> priority [
	^ 2
]

{ #category : #rendering }
ASDSCEnergiePage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
