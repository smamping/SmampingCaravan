Class {
	#name : 'ASDSCModuleMenu',
	#superclass : 'WAComponent',
	#instVars : [
		'moduleTasks'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCModuleMenu >> moduleTasks [

		^ Array
		  with: ASDSCInstallModuleTaskLicht
		  with: ASDSCInstallModuleTaskHeizung
		  with: ASDSCInstallModuleTaskSystem
		  "with: ASDSCInstallModuleTaskWebCam"
]
