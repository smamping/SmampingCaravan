Class {
	#name : #ASDSCSystem,
	#superclass : #ASDModel,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCSystem class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #initialization }
ASDSCSystem >> initialize [

	super initialize
]
