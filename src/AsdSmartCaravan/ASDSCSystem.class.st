Class {
	#name : #ASDSCSystem,
	#superclass : #ASDModel,
	#instVars : [
		'hostName',
		'ip',
		'ssId',
		'wlanPwd',
		'mqttIp',
		'ipCam',
		'ipMultimedia'
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

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionHostName [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Hostname';
		  priority: 1;
		  accessor: #hostName;
		  beRequired;
		  requiredErrorMessage: 'Hostnamen angeben';
		  comment: 'Bitte Hostnamen eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionIp [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Ip der Zentrale';
		  priority: 2;
		  accessor: #ip;
		  beRequired;
		  requiredErrorMessage: 'Ip Zentrale angeben';
		  comment: 'Bitte Ip Zentrale eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionMqttIp [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Ip des Brockers';
		  priority: 3;
		  accessor: #mqttIp;
		  beRequired;
		  requiredErrorMessage: 'Ip Brocker angeben';
		  comment: 'Bitte Ip Brocker eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionSsId [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Wlanname eingeben';
		  priority: 4;
		  accessor: #ssId;
		  beRequired;
		  requiredErrorMessage: 'Wlanname eingeben';
		  comment: 'Bitte Wlanname eingeben';
		  componentClass: MDLMATextInputComponent;
		  yourself
]

{ #category : #'magritte descriptions' }
ASDSCSystem >> descriptionWlanPwd [

	<magritteDescription>
	^ MAStringDescription new
		  label: 'Wlan Passwort eingeben';
		  priority: 4;
		  accessor: #wlanPwd;
		  beRequired;
		  requiredErrorMessage: 'Wlan Passwort eingeben';
		  comment: 'Bitte Wlan Passwort eingeben';
		  componentClass: MDLMATextInputComponent;
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
ASDSCSystem >> ipCam [

	^ ipCam
]

{ #category : #accessing }
ASDSCSystem >> ipCam: anObject [

	ipCam := anObject
]

{ #category : #accessing }
ASDSCSystem >> ipMultimedia [

	^ ipMultimedia
]

{ #category : #accessing }
ASDSCSystem >> ipMultimedia: anObject [

	ipMultimedia := anObject
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
