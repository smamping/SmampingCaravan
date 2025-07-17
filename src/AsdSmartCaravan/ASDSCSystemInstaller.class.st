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
