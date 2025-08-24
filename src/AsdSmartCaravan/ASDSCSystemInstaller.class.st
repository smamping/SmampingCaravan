Class {
	#name : #ASDSCSystemInstaller,
	#superclass : #ASDSCComponent,
	#instVars : [
		'isInstallReady',
		'installReady',
		'installComponents'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #initialization }
ASDSCSystemInstaller >> initialize [

	super initialize.
	self addDecoration: ASDWindowDecoration new.
]

{ #category : #accessing }
ASDSCSystemInstaller >> installComponents [

	 ^ Array
		  with: ASDSCInstallKFZTask
		  with: ASDSCInstallSystemTask
		  with: ASDSCInstallDevicesTask 
]

{ #category : #accessing }
ASDSCSystemInstaller >> installReady [

	^ installReady
]

{ #category : #accessing }
ASDSCSystemInstaller >> installReady: anObject [

	installReady := anObject
]

{ #category : #accessing }
ASDSCSystemInstaller >> isInstallReady [

	^ isInstallReady
]
