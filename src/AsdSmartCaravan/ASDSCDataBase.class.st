Class {
	#name : #ASDSCDataBase,
	#superclass : #Object,
	#instVars : [
		'user',
		'adminUser',
		'esp32Drivers',
		'shellyDrivers',
		'relayDevicesLicht',
		'sensorDeviceMotion',
		'deviceModules',
		'system',
		'fahrzeug',
		'installReady'
	],
	#classVars : [
		'WriteMutex'
	],
	#classInstVars : [
		'uniqueInstancePlanung'
	],
	#category : #'AsdSmartCaravan-Db'
}

{ #category : #voyage }
ASDSCDataBase class >> createAdmin [
	(ASDSCUser benutzerName: 'admin' password: 'pwd' admin: true) save
]

{ #category : #'data sample' }
ASDSCDataBase class >> createDemoData [

]

{ #category : #voyage }
ASDSCDataBase class >> createUser [
	(ASDSCUser benutzerName: 'asdmundt' password: 'pwd' admin: false) save
]

{ #category : #'class initialization' }
ASDSCDataBase class >> current [
	^ uniqueInstancePlanung ifNil: [ uniqueInstancePlanung := self new ]
]

{ #category : #'default values' }
ASDSCDataBase class >> defaultAdminLogin [
   ^ 'admin'
]

{ #category : #'default values' }
ASDSCDataBase class >> defaultAdminPassword [
   ^ 'topsecret'
]

{ #category : #drivers }
ASDSCDataBase class >> esp32LichtMitte [

	^ ESP32Driver new
		  deviceName: 'lichtMitte';
		  brokerIP: 'mqtt://192.168.1.187';
		  setup
]

{ #category : #drivers }
ASDSCDataBase class >> esp32SystemMitte [

	^ ESP32Driver new
		  deviceName: 'systemMitte';
		  brokerIP: 'mqtt://192.168.1.187';
		  setup
]

{ #category : #'class initialization' }
ASDSCDataBase class >> initialize [
	self reset
]

{ #category : #voyage }
ASDSCDataBase class >> initializeLocalhostMongoDB [
	| repository |
	repository := VOMongoRepository database: 'smartCaravan'.
	repository enableSingleton
]

{ #category : #'class initialization' }
ASDSCDataBase class >> initializeVoyageOnMemoryDB [
VOMemoryRepository new enableSingleton
]

{ #category : #voyage }
ASDSCDataBase class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'class initialization' }
ASDSCDataBase class >> reset [

	uniqueInstancePlanung := nil.
	VORepository current reset.
	self initializeVoyageOnMemoryDB
]

{ #category : #'default values' }
ASDSCDataBase class >> version [
	^ '0.5.0'
]

{ #category : #accessing }
ASDSCDataBase >> adminUser [

	^ (ASDSCUser benutzerName: 'admin' password: 'pwd' admin: true)
]

{ #category : #operations }
ASDSCDataBase >> allUsers [
	^ ASDSCUser selectAll
]

{ #category : #accessing }
ASDSCDataBase >> deviceModules [

	^ deviceModules
]

{ #category : #accessing }
ASDSCDataBase >> esp32Drivers [

	^ ASDSCESP32Driver selectAll 
]

{ #category : #accessing }
ASDSCDataBase >> fahrzeug [

	^ fahrzeug
]

{ #category : #accessing }
ASDSCDataBase >> fahrzeug: anObject [

	fahrzeug := anObject
]

{ #category : #initialization }
ASDSCDataBase >> initialize [

	super initialize.
	self installReady: false
]

{ #category : #accessing }
ASDSCDataBase >> installReady [

	^ installReady
]

{ #category : #accessing }
ASDSCDataBase >> installReady: anObject [

	installReady := anObject
]

{ #category : #accessing }
ASDSCDataBase >> relayDevicesLicht [

	^ ASDSCDeviceRelayLicht selectAll 
]

{ #category : #accessing }
ASDSCDataBase >> sensorDeviceMotion [

	^ sensorDeviceMotion
]

{ #category : #accessing }
ASDSCDataBase >> shellyDrivers [

	^ shellyDrivers
]

{ #category : #operations }
ASDSCDataBase >> storeObject: anObject [
	anObject save
]

{ #category : #operations }
ASDSCDataBase >> storeUser: aUser [
	aUser save.
]

{ #category : #accessing }
ASDSCDataBase >> system [

	^ system
]

{ #category : #accessing }
ASDSCDataBase >> system: anObject [

	system := anObject
]

{ #category : #accessing }
ASDSCDataBase >> user [

	^ (ASDSCUser benutzerName: 'asdmundt' password: 'pwd' admin: false) 
]

{ #category : #operations }
ASDSCDataBase >> userFromLogin: aLogin andPassword: aPassword [

	^ ASDSCUser selectOne: [ :each | 
		  each benutzerName = aLogin & (each password = aPassword)
		  & (each admin = false) ]
]

{ #category : #operations }
ASDSCDataBase >> userFromLogin: aLogin andPassword: aPassword andAdmin: aBoolean [
	^ ASDSCUser
		selectOne: [ :each | 
			each benutzerName = aLogin & (each password = aPassword)
				& (each admin = aBoolean) ]
]
