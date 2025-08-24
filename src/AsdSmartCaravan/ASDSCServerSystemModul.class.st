Class {
	#name : #ASDSCServerSystemModul,
	#superclass : #ASDSCModulModel,
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #voyage }
ASDSCServerSystemModul class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]
