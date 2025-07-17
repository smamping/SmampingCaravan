Class {
	#name : #ASDSCSystemOsSettings,
	#superclass : #ASDModel,
	#instVars : [
		'hostName',
		'ip',
		'ssId',
		'wlanPwd',
		'osVerion',
		'osLinuxName'
	],
	#category : #'AsdSmartCaravan-Model'
}

{ #category : #accessing }
ASDSCSystemOsSettings >> hostName [

	^ hostName
]

{ #category : #accessing }
ASDSCSystemOsSettings >> hostName: anObject [

	hostName := anObject
]

{ #category : #initialization }
ASDSCSystemOsSettings >> initialize [

	super initialize
]

{ #category : #accessing }
ASDSCSystemOsSettings >> ip [

	^ ip
]

{ #category : #accessing }
ASDSCSystemOsSettings >> ip: anObject [

	ip := anObject
]

{ #category : #accessing }
ASDSCSystemOsSettings >> osLinuxName [

	^ osLinuxName
]

{ #category : #accessing }
ASDSCSystemOsSettings >> osLinuxName: anObject [

	osLinuxName := anObject
]

{ #category : #accessing }
ASDSCSystemOsSettings >> osVerion [

	^ osVerion
]

{ #category : #accessing }
ASDSCSystemOsSettings >> osVerion: anObject [

	osVerion := anObject
]

{ #category : #accessing }
ASDSCSystemOsSettings >> ssId [

	^ ssId
]

{ #category : #accessing }
ASDSCSystemOsSettings >> ssId: anObject [

	ssId := anObject
]

{ #category : #accessing }
ASDSCSystemOsSettings >> wlanPwd [

	^ wlanPwd
]

{ #category : #accessing }
ASDSCSystemOsSettings >> wlanPwd: anObject [

	wlanPwd := anObject
]
