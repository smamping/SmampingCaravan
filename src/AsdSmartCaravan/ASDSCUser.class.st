Class {
	#name : #ASDSCUser,
	#superclass : #ASDModel,
	#instVars : [
		'password',
		'admin',
		'benutzerName'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #'instance creation' }
ASDSCUser class >> benutzerName: aName password: aPwd admin: aBoolean [
^ self new
		benutzerName: aName;
		password: aPwd;
		admin: aBoolean;
		yourself
]

{ #category : #voyage }
ASDSCUser class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDSCUser >> admin [
	^ admin
]

{ #category : #accessing }
ASDSCUser >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
ASDSCUser >> benutzerName [
	^ benutzerName
]

{ #category : #accessing }
ASDSCUser >> benutzerName: anObject [
	benutzerName := anObject
]

{ #category : #'magritte descriptions' }
ASDSCUser >> descriptionBenutzerName [
	<magritteDescription>
	^ MAStringDescription new
		priority: 30;
		label: 'Benutzer';
		accessor: #benutzerName;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Benutzernamen eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDSCUser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
ASDSCUser >> descriptionPassword [
	<magritteDescription>
	^ MAStringDescription new
		priority: 40;
		label: 'Password';
		accessor: #password;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Passwort eingeben';
		comment: 'Bitte Ihr Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDSCUser >> password [
	^ password
]

{ #category : #accessing }
ASDSCUser >> password: anObject [
	password := anObject
]
