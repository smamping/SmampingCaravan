Class {
	#name : #ASDSCSystem,
	#superclass : #ASDModel,
	#instVars : [
		'hostName',
		'ip',
		'ssId',
		'wlanPwd',
		'mqttIp'
	],
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

{ #category : #accessing }
ASDSCSystem >> hostName [

	^ hostName
]

{ #category : #accessing }
ASDSCSystem >> hostName: anObject [

	hostName := anObject
]

{ #category : #initialization }
ASDSCSystem >> initialize [

	super initialize
]

{ #category : #accessing }
ASDSCSystem >> ip [

	^ ip
]

{ #category : #accessing }
ASDSCSystem >> ip: anObject [

	ip := anObject
]

{ #category : #accessing }
ASDSCSystem >> mqttIp [

	^ mqttIp
]

{ #category : #accessing }
ASDSCSystem >> mqttIp: anObject [

	mqttIp := anObject
]

{ #category : #accessing }
ASDSCSystem >> ssId [

	^ ssId
]

{ #category : #accessing }
ASDSCSystem >> ssId: anObject [

	ssId := anObject
]

{ #category : #accessing }
ASDSCSystem >> wlanPwd [

	^ wlanPwd
]

{ #category : #accessing }
ASDSCSystem >> wlanPwd: anObject [

	wlanPwd := anObject
]
